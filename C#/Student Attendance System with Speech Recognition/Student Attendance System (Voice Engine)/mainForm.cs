using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Excel = Microsoft.Office.Interop.Excel;

namespace Student_Attendance_System__Voice_Engine_
{
    public partial class mainForm : Form
    {
        String selected_Schema_ID = "";
        String selected_Course = "";
        String selected_Semester = "";
        String selected_Department = "";



        String schema_ID_used_last = "";
        String schema_ID_generated_new = "";



        String excelFileLocation = "";


        List<string> schemaIDList = new List<string>();



        public mainForm()
        {
            InitializeComponent();

            this.userTextBox.Text = "wakil";
            this.passwordTextBox.Text = "12345";


            innerPanel.Visible = false;
            excelPanel.Visible = false;


            this.InitializeDataGridView();


            //
            this.setFirstRowSelected();
            
            //setting combobox selected an option
            optionComboBox.SelectedIndex = 1;

        }






        //ConnectionBlock
        SqlConnection con = new SqlConnection(@"Data Source=PC\SQLEXPRESS;Initial Catalog=Student_Attendance_System_Data;Integrated Security=True");




        public void InitializeDataGridView()
        {
            schemaIDList.Clear();

            //this will keep updated student id to datagrid


            dataGridView.Rows.Clear();

            con.Open();

            try
            {


                SqlDataAdapter sda
                    = new SqlDataAdapter("select * from AttendanceSchema ", con);

                DataTable dt = new DataTable();

                sda.Fill(dt);

                int n = 0;
                if (dt.Rows.Count >= 1)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        dataGridView.Rows.Add();
                        dataGridView.Rows[n].Cells["SchemaID_Column"].Value = dr[0].ToString();
                        dataGridView.Rows[n].Cells["Department_Column"].Value = dr[1].ToString();
                        dataGridView.Rows[n].Cells["Semester_Column"].Value = dr[2].ToString();
                        dataGridView.Rows[n].Cells["Course_Column"].Value = dr[3].ToString();


                        schemaIDList.Add(dr[0].ToString());

                        n++;

                    }


                }

                else
                {

                    //MessageBox.Show("Error !", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }

            }

            catch (Exception)
            {
                Console.WriteLine("Query error\n");
            }



            con.Close();
            //kaj sesh
            

            //stop adding empty rows
            dataGridView.AllowUserToAddRows = false;

            

        }

        public void setFirstRowSelected()
        {
            if (dataGridView.Rows.Count > 0)
            {
                dataGridView.Rows[0].Selected = true;
                selected_Schema_ID = dataGridView.Rows[0].Cells["SchemaID_Column"].Value.ToString();
                selected_Course = dataGridView.Rows[0].Cells["Course_Column"].Value.ToString();
                selected_Semester = dataGridView.Rows[0].Cells["Semester_Column"].Value.ToString();
                selected_Department = dataGridView.Rows[0].Cells["Department_Column"].Value.ToString();
            }
        }


        public void generateSchemaID()
        {
            //updating dataGridView
            this.InitializeDataGridView();


            if (dataGridView.Rows.Count < 1) schema_ID_used_last = "SCH - 10000";
            else
            {
                int total_row_inside_dataGridView = dataGridView.Rows.Count;
                int temp = total_row_inside_dataGridView - 1;

                schema_ID_used_last = dataGridView.Rows[temp].Cells["SchemaID_Column"].Value.ToString();
            }


            string str = schema_ID_used_last;
            string[] ss = str.Split(new char[] { ' ', '.', ',', '-' }, StringSplitOptions.RemoveEmptyEntries);

            schema_ID_generated_new = ss[0] + "-"+ (Int32.Parse(ss[1]) + 1).ToString();

            //now setting generated schema id to field
            schemaIDTextBox.Text = schema_ID_generated_new.ToString();

        }




        //this will keeep updating data 
        private void tabControl_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tabControl.SelectedTab == tabPage1)
            {
                this.InitializeDataGridView();
            }
            else if (tabControl.SelectedTab == tabPage2)
            {
                this.generateSchemaID();
            }
        }



        private void enterButton_Click(object sender, EventArgs e)
        {
            con.Open();

            try
            {
                String user = userTextBox.Text.ToString();
                String pass = passwordTextBox.Text.ToString();


                SqlDataAdapter sda
                    = new SqlDataAdapter("select * from LoginData where Username='" + user + "' and Password='" + pass + "'  ", con);

                DataTable dt = new DataTable();

                sda.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    panel.Visible = false;
                }
                else
                {

                    if (user.Equals("") || pass.Equals(""))
                        MessageBox.Show("Fill all empty places !", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    else
                    {
                        MessageBox.Show("Wrong Username or Password !!\n", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        userTextBox.Text = passwordTextBox.Text = "";
                    }

                }

            }

            catch (Exception)
            {
                Console.WriteLine("Query error\n");
            }


            con.Close();
            //kaj sesh




        }

        private void signUpButton_Click(object sender, EventArgs e)
        {
            signUpForm ob = new signUpForm();
            ob.Show();
        }

        private void manualRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            innerPanel.Visible = false;
            excelPanel.Visible = false;
        }

        private void automaticRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            innerPanel.Visible = true;
            excelPanel.Visible = false;
        }

        private void importRadioButton_CheckedChanged(object sender, EventArgs e)
        {
     
            innerPanel.Visible = false;
            excelPanel.Visible = true;
        }





        private void sIDRichTextBox_MouseClick(object sender, MouseEventArgs e)
        {
            studentIDRichTextBox.Text = "";
        }

        private void generateButton_Click(object sender, EventArgs e)
        {
            if(minTextBox.Text == ""  || maxTextBox.Text == "")
            {
                MessageBox.Show("Set Min and Max value first.");
                goto End_of_Function;
            }


            studentIDRichTextBox.Text = "";


            string str = leftTextBox.Text;
            string[] numbers = str.Split(new char[] { ' ', '.', ',', '?' }, StringSplitOptions.RemoveEmptyEntries);
            List<int> unnecessaryID = new List<int>();
            for (int x = 0; x < numbers.Length; x++)
            {
                unnecessaryID.Add(Int32.Parse(numbers[x]));
            }

            if (leftCheckBox.Checked == false) unnecessaryID.Clear();

            int min = 0, max = 0;

            min = Int32.Parse(minTextBox.Text);
            max= Int32.Parse(maxTextBox.Text);

            for(int x = min; x <= max; x++)
            {
                if(!unnecessaryID.Contains(x))
                    studentIDRichTextBox.Text += x + ", ";
            }

            End_of_Function:
            { }

        }

        private void createButton_Click(object sender, EventArgs e)
        {
            
            if (departmentComboBox.SelectedIndex == -1 || semesterComboBox.SelectedIndex == -1 || 
                courseCodeComboBox.SelectedIndex == -1 || studentIDRichTextBox.Text.Equals("") || 
                studentIDRichTextBox.Text.Equals("Enter Student IDs seperated by Blank Space or Comma"))
            {
                MessageBox.Show("Fill all empty places !", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                goto End_of_Function;
            }

            if(agreeCheckBox.Checked == false)
            {
                MessageBox.Show("Please agree to the terms of use.", "Alert", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                goto End_of_Function;
            }

            string message = "Do you agree to create new attendance schema?"; 
            string title = "Change Warning";
            MessageBoxButtons buttons = MessageBoxButtons.YesNo;
            DialogResult result = MessageBox.Show(message, title, buttons);
            if (result == DialogResult.Yes)
            {

                con.Open();

                string schema_id = schemaIDTextBox.Text;
                string department = departmentComboBox.SelectedItem.ToString();
                string semester = semesterComboBox.SelectedItem.ToString();
                string course_code = courseCodeComboBox.SelectedItem.ToString();
                string student_id = studentIDRichTextBox.Text;




                SqlDataAdapter sda = new SqlDataAdapter("select * from AttendanceSchema where SchemaID ='" + schema_id + "' ", con);

                DataTable dt = new DataTable();

                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    MessageBox.Show("Attendance schema already exists !", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    goto End_of_Function;
                }


                String query =
                        "insert into AttendanceSchema values( '" + schema_id + "','" + department + "','" + semester + "','" + course_code + "','" + student_id + "'  )";

                SqlCommand scmd = new SqlCommand(query, con);

                try
                {
                    int i = scmd.ExecuteNonQuery();
                    if (i == 1) MessageBox.Show("Attendance Schema Created Succesfully\n", "Succes");

                    departmentComboBox.Text = semesterComboBox.Text = courseCodeComboBox.Text = studentIDRichTextBox.Text = "";

                    minTextBox.Text = maxTextBox.Text = leftTextBox.Text = "";
                    leftCheckBox.Checked = false;

                }
                catch (Exception ex)
                {
                    MessageBox.Show("Creation Failed !", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                
                }


                con.Close();


            }
            else
            {
                // Do something  
            }


            End_of_Function:
            {
                con.Close();
                this.InitializeDataGridView();
                this.generateSchemaID();
            }

        }

        private void okButton_Click(object sender, EventArgs e)
        {
            if (dataGridView.Rows.Count < 1)
            {
                MessageBox.Show("No Attendance Schemas are available !", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                goto End_of_Function;
            }
            if (optionComboBox.SelectedIndex == -1)
            {
                MessageBox.Show("Please select an option first !", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                goto End_of_Function;
            }





            if (optionComboBox.SelectedItem.ToString() == "Take New Attendance")
            {

                //Console.WriteLine(selected_Schema_ID + " " + selected_Course + " " + selected_Semester + " " + selected_Department);
                takeAttendanceForm taf = new takeAttendanceForm(selected_Schema_ID,selected_Course, selected_Semester,selected_Department);
                taf.Show();
            }

            else if (optionComboBox.SelectedItem.ToString() == "View Attendance Data")
            {
                viewAttendanceDataForm vadf = new viewAttendanceDataForm(selected_Schema_ID, selected_Course, selected_Semester, selected_Department);
                vadf.Show();

            }

            else if (optionComboBox.SelectedItem.ToString() == "Export Attendance Data")
            {

                tabControl.SelectTab(2);
                //
                exportSchemaIDTextBox.Text = selected_Schema_ID;
                exportDepartmentTextBox.Text = selected_Department;
                exportSemesterTextBox.Text = selected_Semester;
                exportCourseCodeTextBox.Text = selected_Course;


            }

            //Export Attendance Data
            // View Attendance Data
            //this.ID = dataGridView.Rows[0].Cells["Job_ID"].Value.ToString();

            End_of_Function:
            { }

        }

        private void dataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //to avoid error when clicked at header
            if (e.RowIndex < 0) goto End;

            selected_Schema_ID = dataGridView.Rows[e.RowIndex].Cells["SchemaID_Column"].Value.ToString();
            selected_Course = dataGridView.Rows[e.RowIndex].Cells["Course_Column"].Value.ToString();
            selected_Semester = dataGridView.Rows[e.RowIndex].Cells["Semester_Column"].Value.ToString();
            selected_Department = dataGridView.Rows[e.RowIndex].Cells["Department_Column"].Value.ToString();


            //Console.WriteLine(selected_Course+" "+selected_Semester+" " + selected_Department);
            End:
            { }

        }



        private void openButton_Click(object sender, EventArgs e)
        {

            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Title = "Choose Your Excel File";
            //ofd.Filter = "pdf files (*.pdf)|*.pdf|doc files (*.doc)|*.doc|All files (*.*)|*.*";
            ofd.Filter = "Excel Files (.xlsx)|*.xlsx|Excel Files (.xls) |*.xls";
            if (ofd.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                excelFileLocation = ofd.FileName;
                textBox.Text = excelFileLocation;

            }


        }





        private void importButton_Click(object sender, EventArgs e)
        {

            if (excelFileLocation == "") goto End;

            //load();

            string file = excelFileLocation;
            Process.Start(file);

            OleDbConnection xlcon =
                new OleDbConnection("Provider = Microsoft.Jet.OLEDB.4.0;Data Source=" + excelFileLocation + ";Extended Properties =\"Excel 8.0;HDR=Yes;\";  ");

            OleDbDataAdapter xlda =
                new OleDbDataAdapter("select * from [Sheet1$]", xlcon);

            DataTable dt = new DataTable();
            xlda.Fill(dt);


            String importedID = "";
            int n = 0;
            foreach (DataRow dr in dt.Rows)
            {
                importedID += dr[0].ToString() + ", ";
                n++;

            }


            //close connection
            xlcon.Close();

            ////
            studentIDRichTextBox.Text = importedID;


            End:
            { }


        }




        private void exportButton_Click(object sender, EventArgs e)
        {
            if( exportSchemaIDTextBox.Text == "" )
            {
                MessageBox.Show("No Schema ID selected to export Data.","Select Schema ID",MessageBoxButtons.OK,MessageBoxIcon.Warning);
                goto End;
            }

            if ( ! schemaIDList.Contains(exportSchemaIDTextBox.Text) )
            {
                MessageBox.Show("Schema ID does not exist.", "Select Schema ID", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                goto End;
            }

            if (agreeCheckBox1.Checked == false || agreeCheckBox2.Checked == false)
            {
                MessageBox.Show("Mark the checkboxes to export Attendance Data.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                goto End;
            }


                SaveFileDialog saveFile = new SaveFileDialog();
            saveFile.InitialDirectory = "C:\\Users\\Wakil\\Documents\\Visual Studio 2015\\Projects\\Student Attendance System (Voice Engine)";
            saveFile.Title = "Save as Excell File";
            saveFile.FileName = "Exported File";
            saveFile.Filter = "Excel Files (.xlsx)|*.xlsx|Excel Files (.xls) |*.xls";



            if (saveFile.ShowDialog() == DialogResult.OK)
            {
                if (File.Exists(saveFile.FileName))
                {
                    File.Delete(saveFile.FileName);
                }




                Excel.Application xlApp = new Excel.Application();
                xlApp.Application.Workbooks.Add(Type.Missing);

                //Excel.Worksheet xlWorksheet = xlWorkbook.Sheets[1];
                //xlWorksheet.Cells[10, 1] = "Student ID";
                    
                xlApp.Columns.ColumnWidth = 20;
                //
                xlApp.Cells[1, 1] = "ID";//cell naming
                //

                List<string> IDString = new List<string>();
                List<string> DateString = new List<string>();
                List<string> PresenceString = new List<string>();
                IDString.Clear();
                DateString.Clear();
                PresenceString.Clear();

                ///retrive data
                /////

                con.Open();

                try
                {

                    SqlDataAdapter sda
                        = new SqlDataAdapter("select * from AttendanceSchema where SchemaID='" + exportSchemaIDTextBox.Text + "' ", con);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    if (dt.Rows.Count >= 1)
                    {
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
                            IDString.Add(numbers[x]);
                        }


                    }

                    else
                        MessageBox.Show("Attendance Schema doesn't exist.","Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }

                catch (Exception)
                {
                    Console.WriteLine("Query error\n");
                }







                try
                {
                    SqlDataAdapter sda
                        = new SqlDataAdapter("select * from Attendance where SchemaID='" + exportSchemaIDTextBox.Text + "' ", con);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    int n = 0;
                    if (dt.Rows.Count >= 1)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            //dr[2].ToString();//Date
                            //dr[3].ToString();//Presence

                            DateString.Add( dr[2].ToString() );
                            PresenceString.Add( dr[3].ToString() );


                            n++;
                        }

                    }

                    else
                        MessageBox.Show("Attendance Schema doesn't exist.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);


                }

                catch (Exception)
                {
                    Console.WriteLine("Query error\n");
                }



                con.Close();
                //kaj sesh

                /////
                ///retrive data


                for (int x = 0; x < IDString.Count; x++)
                {
                    xlApp.Cells[ x + 2, 1 ] = IDString[x].ToString();
                }

                for (int x = 0; x < DateString.Count; x++ )
                {
                    xlApp.Cells[ 1, x + 2 ] = DateString[x].ToString();
                }


                for (int x = 0; x < PresenceString.Count; x++)
                {
                    string __str = PresenceString[x];

                    for (int y = 0; y < __str.Length; y++)
                    {
                        
                        xlApp.Cells[ y + 2, x + 2 ] = __str[y].ToString();
                    }
                        
                }



                xlApp.ActiveWorkbook.SaveCopyAs(saveFile.FileName.ToString());
                xlApp.ActiveWorkbook.Saved = true;
                xlApp.Quit();


            }




            End:
            { }

        }








        //end_of_form
    }
}
