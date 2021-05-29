using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Student_Attendance_System__Voice_Engine_
{
    public partial class viewAttendanceDataForm : Form
    {

        string department = "";
        string semester = "";
        string course_code = "";
        string schema_id = "";

        int totalLectureCompleted = 0;

        List<String> student_ID_list = new List<string>();
        List<String> student_presence_list = new List<string>();


        public viewAttendanceDataForm(String selected_Schema_ID, String selected_Course, String selected_Semester, String selected_Department)
        {
            InitializeComponent();

            department = selected_Department;
            semester = selected_Semester;
            course_code = selected_Course;
            schema_id = selected_Schema_ID;


            this.InitializeDataGridView();

        }





        //ConnectionBlock
        SqlConnection con = new SqlConnection(@"Data Source=PC\SQLEXPRESS;Initial Catalog=Student_Attendance_System_Data;Integrated Security=True");




        public void InitializeDataGridView()
        {


            //portion a will add student id to student_ID_list 

            /*------------------------------------ < portion a >--------------------------------*/
            //portion a start

            con.Open();

            try
            {
                //Console.WriteLine("p---a\n");

                SqlDataAdapter sda
                    = new SqlDataAdapter("select * from AttendanceSchema where SchemaID='" + schema_id + "' ", con);

                DataTable dt = new DataTable();

                sda.Fill(dt);

                if (dt.Rows.Count >= 1)
                {

                    //clear all item
                    student_ID_list.Clear();

                    String sid = "";

                    //assigning student id(format ->( 1, 2, 3, 4, 5, 6,) ) to sid got from sql data
                    foreach (DataRow dr in dt.Rows)
                    {
                        sid = dr[4].ToString();

                        //Console.WriteLine(dr[3].ToString());
                    }


                    //now tokenize student id string and save to list item
                    string st = sid;
                    string[] numbers = st.Split(new char[] { ' ', '.', ',', '?' }, StringSplitOptions.RemoveEmptyEntries);

                    for (int x = 0; x < numbers.Length; x++)
                    {
                        student_ID_list.Add(numbers[x]);
                    }

                    Console.WriteLine(numbers.Length);


                }

                else
                {
                    //MessageBox.Show("Error ! No such rows available!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

            }
            catch (Exception)
            {
                Console.WriteLine("Query error\n");
            }



            con.Close();

            //portion a end
            /*------------------------------------ < portion a >--------------------------------*/



            int totalLecture = 0;


            //portion b will add student presence string to student_presence_list 
            /*------------------------------------ < portion b >--------------------------------*/
            //portion b start

            con.Open();

            try
            {
                //Console.WriteLine("p---b\n");

                SqlDataAdapter sda
                    = new SqlDataAdapter("select * from Attendance where SchemaID='" + schema_id + "' ", con);

                DataTable dt = new DataTable();

                sda.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    //here total rows represent total attendance taken for every lecture
                    totalLecture = dt.Rows.Count;

                    //clear all item
                    student_presence_list.Clear();

                    String presence = "";

                    //assigning student presence string (format ->( 1001011011111110) ) to presence got from sql data
                    foreach (DataRow dr in dt.Rows)
                    {
                        presence = dr[3].ToString();
                        student_presence_list.Add( presence );
                        //Console.WriteLine(dr[3].ToString());
                    }

                }

                else
                {
                    //MessageBox.Show("Error ! No such rows available!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

            }
            catch (Exception)
            {
                Console.WriteLine("Query error\n");
            }



            con.Close();


            //portion b end
            /*------------------------------------ < portion b >--------------------------------*/




            // count attendance of students into count[] array
            //

            int total_student = student_ID_list.Count;
            int[] count = new int[total_student];

            Console.WriteLine(student_ID_list.Count + "-" + student_presence_list.Count + "\n");


            for (int x = 0; x < student_presence_list.Count; x++)
            {
                String str = student_presence_list[x];

                for (int y = 0; y < student_ID_list.Count; y++)
                {
                    if (str[y] == '1') count[y] += 1;
                    else count[y] += 0;

                    Console.WriteLine(x+"-"+y+"\n");

                }
            }

            //
            // count attendance of students into count[] array



            for (int x = 0; x < student_ID_list.Count; x++)
            {
                /*
                dataGridView.Rows.Add(student_id, false);

                dataGridView.AllowUserToAddRows = false;
                */
                int totalPresent = count[x];
                int totalAbsent = totalLecture - count[x];
                Double percent = 0.00;
                if (totalPresent > 0) percent = ( (double)totalPresent / (double)totalLecture) * 100.00;
                percent = System.Math.Round(percent, 2);

                dataGridView.Rows.Add();
                dataGridView.Rows[x].Cells["StudentId_Column"].Value = student_ID_list[x].ToString();
                dataGridView.Rows[x].Cells["TotalLecture_Column"].Value = totalLecture.ToString();
                dataGridView.Rows[x].Cells["TotalPresent_Column"].Value = totalPresent.ToString();
                dataGridView.Rows[x].Cells["TotalAbsent_Column"].Value = totalAbsent.ToString();
                dataGridView.Rows[x].Cells["AttendancePercentage_Column"].Value = percent.ToString()+"%";
                //student_ID_list[x], totalLecture, count, totalAbsent, 0

                dataGridView.AllowUserToAddRows = false;

            }



            //endof_
        }


        //
    }
}
