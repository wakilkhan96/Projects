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
using System.Speech;
using System.Speech.Recognition;
using System.Speech.Synthesis;
using System.Threading;

namespace Student_Attendance_System__Voice_Engine_
{
    public partial class takeAttendanceForm : Form
    {
        string department = "";
        string semester = "";
        string course_code = "";
        string schema_id = "";

        int totalLectureCompleted = 0;

        List<String> student_ID_list = new List<string>();


        //voice engine related{ 
        SpeechRecognitionEngine engine = new SpeechRecognitionEngine();
        SpeechSynthesizer synthesizer = new SpeechSynthesizer();
        int tracker = 0;
        //voice engine related}



        public takeAttendanceForm(String selected_Schema_ID,String selected_Course,String selected_Semester,String selected_Department)
        {
            InitializeComponent();
            
            department = selected_Department;
            semester = selected_Semester;
            course_code = selected_Course;
            schema_id = selected_Schema_ID;


            this.InitializeDataGridView();
            this.InitializeFieldSets();

            //voice engine related{ 
            this.InitializeVoiceEngine();
            //voice engine related}

        }





        //voice engine related{
        //
        //
        //
        //
        //
        public void InitializeVoiceEngine()
        {
            
            engine.SetInputToDefaultAudioDevice();

            engine.LoadGrammarAsync(myGrammar());
            //engine.RecognizeAsync(RecognizeMode.Multiple);
            engine.SpeechRecognized += Engine_SpeechRecognized;

            synthesizer.Volume = 100;  // 0...100
            synthesizer.Rate = -2;     // -10...10

        }

        public Grammar myGrammar()
        {
            String[] str = new String[]
            {
             
                "present sir",
                
                "yes sir"
            };

            GrammarBuilder gb = new GrammarBuilder(new Choices(str));
            Grammar grmr = new Grammar(gb);
            return grmr;
        }


        private void Engine_SpeechRecognized(object sender, SpeechRecognizedEventArgs e)
        {
            try
            {
                String word = e.Result.Text;
                Console.WriteLine("-->" + word);
                dataGridView.Rows[tracker].Cells[1].Value = true;


            }
            catch (Exception ex)
            { }

        }




        public void startVoiceAttendance()
        {


            DateTime start;
            DateTime finish;
            

            for (int x = 0; x < student_ID_list.Count; x++)
            {
                //to move scroll bar with countdown
                dataGridView.CurrentCell = dataGridView.Rows[x].Cells[0];
                //dataGridView.FirstDisplayedScrollingRowIndex = dataGridView.SelectedRows[x].Index;
                //

                tracker = x;
                string temp = student_ID_list[x].ToString();
                synthesizer.SpeakAsync(temp);
                start = DateTime.Now;
                finish = start.AddSeconds(.2);
                do { } while (DateTime.Now < finish);

                Application.DoEvents();//necessary

                engine.RecognizeAsync(RecognizeMode.Single);

                start = DateTime.Now;
                finish = start.AddSeconds(3);
                do { } while (DateTime.Now < finish);

                engine.RecognizeAsyncStop();

                Application.DoEvents();//necessary

            }


            //attendance done//now enable button
            submitButton.Visible = true;

        }




            //
            //
            //
            //
            //voice engine related}





        //ConnectionBlock
        SqlConnection con = new SqlConnection(@"Data Source=PC\SQLEXPRESS;Initial Catalog=Student_Attendance_System_Data;Integrated Security=True");





        public void InitializeFieldSets()
        {
            this.getLectureNumber();

            schemaIDTextBox.Text = schema_id;
            departmentTextBox.Text = department;
            semesterTextBox.Text = semester;
            courseCodeTextBox.Text = course_code;
            lectureTextBox.Text = (totalLectureCompleted + 1).ToString();
            dateTextBox.Text = DateTime.Today.ToString("dd/MM/yyyy");
        }

        public void InitializeDataGridView()
        {
            //this will add student id to datagrid

            con.Open();

            try
            {


                SqlDataAdapter sda
                    = new SqlDataAdapter("select * from AttendanceSchema where SchemaID='" + schema_id + "' ", con);

                DataTable dt = new DataTable();

                sda.Fill(dt);

                if (dt.Rows.Count >= 1)
                {

                    //clear all item
                    student_ID_list.Clear();

                    String sid = "";

                    //assigning student id(format ->( 1, 2, 3, 4,) ) to sid got from sql data
                    foreach (DataRow dr in dt.Rows)
                    {
                        sid = dr[4].ToString();

                        //Console.WriteLine(dr[3].ToString());
                    }


                    //now tokenize student id string and save to list
                    string st = sid;
                    string[] numbers = st.Split(new char[] { ' ', '.', ',', '?' }, StringSplitOptions.RemoveEmptyEntries);
                    
                    for (int x = 0; x < numbers.Length; x++)
                    {
                        student_ID_list.Add( numbers[x] );
                    }


                }

                else
                {

                        MessageBox.Show("Error ! Can not complete query!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
          
                }

            }

            catch (Exception)
            {
                Console.WriteLine("Query error\n");
            }



            con.Close();
            //kaj sesh


        

            for (int x = 0; x < student_ID_list.Count; x++ )
            {
                string student_id = student_ID_list[x].ToString();

                DataGridViewCheckBoxColumn chkbox = new DataGridViewCheckBoxColumn();

                chkbox.Name = "chk"+student_id.ToString();
                
                dataGridView.Rows.Add( student_id, false);

                dataGridView.AllowUserToAddRows = false;
            }

            //endof_
        }





        public void getLectureNumber()
        {
            con.Open();

            try
            {
                SqlDataAdapter sda
                    = new SqlDataAdapter("select * from Attendance where SchemaID='" + schema_id + "' ", con);

                DataTable dt = new DataTable();

                sda.Fill(dt);

                totalLectureCompleted = dt.Rows.Count;

            }

            catch (Exception)
            {
                //Console.WriteLine("Query error\n");
            }



            con.Close();

        }





        private void submitButton_Click(object sender, EventArgs e)
        {
            //creating attendance 0/1 data string
            String _str = "";
            for (int x = 0; x < dataGridView.RowCount; x++)
            {
                DataGridViewCheckBoxCell chk = dataGridView.Rows[x].Cells[1] as DataGridViewCheckBoxCell;

                if (Convert.ToBoolean(chk.Value) == true) _str += "1";
                else _str += "0";
            }



            string message = "Do you agree to create new attendance schema?";
            string title = "Change Warning";
            MessageBoxButtons buttons = MessageBoxButtons.YesNo;
            DialogResult result = MessageBox.Show(message, title, buttons);
            if (result == DialogResult.Yes)
            {
                string lecture = lectureTextBox.Text;
                string date = dateTextBox.Text;
                string presence = _str;

                //now insert

                con.Open();

                String query =
                            "insert into Attendance values( '" + schema_id + "','" + lecture + "','" + date + "','" + presence + "' )";

                SqlCommand scmd = new SqlCommand(query, con);

                try
                {
                    int i = scmd.ExecuteNonQuery();
                    if (i == 1) MessageBox.Show("Attendance Stored Succesfully\n", "Succes");

                }
                catch (Exception ex)
                {
                    MessageBox.Show("Creation Failed !", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }



                //now disabling buttons
                submitButton.Visible = false;
                startButton.Visible = false;


            }



            con.Close();
            //done

        }

        private void startButton_Click(object sender, EventArgs e)
        {

            submitButton.Visible = false;

            startVoiceAttendance();

        }


        private void dataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //to avoid error when clicked at header
            if (e.RowIndex < 0) goto End;

            //DataGridViewCheckBoxCell chk = dataGridView.Rows[e.RowIndex].Cells[1] as DataGridViewCheckBoxCell;

            //if (Convert.ToBoolean(chk.Value) == true) dataGridView.Rows[e.RowIndex].Cells[1].Value = false;
            //else dataGridView.Rows[e.RowIndex].Cells[1].Value = true;

            if (Convert.ToBoolean(dataGridView.Rows[e.RowIndex].Cells[1].Value) == true)
                dataGridView.Rows[e.RowIndex].Cells[1].Value = false;
            else
                dataGridView.Rows[e.RowIndex].Cells[1].Value = true;

            

            End:
            { }

        }

        private void automaticRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            startButton.Visible = true;
        }

        private void manualRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            startButton.Visible = false;
        }




        //endofclass

    }
}
