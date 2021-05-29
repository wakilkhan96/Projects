using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;



namespace Super_Shop_Management
{
    public partial class loginForm : Form
    {
        public loginForm()
        {
            InitializeComponent();


            this.userTextBox.Text = "user_4";
            this.passwordTextBox.Text = "12345";


        }


        //ConnectionBlock
        SqlConnection con = new SqlConnection(@"Data Source=PC\SQLEXPRESS;Initial Catalog=SuperShopData;Integrated Security=True");
        




        private void signInButton_Click(object sender, EventArgs e)
        {

            con.Open();

            try
            {
                String user = userTextBox.Text.ToString();
                String pass = passwordTextBox.Text.ToString();
                //Console.WriteLine("user = "+user + "\npass = " + pass+"\n");


                SqlDataAdapter sda 
                    = new SqlDataAdapter("select * from LoginData where Username='"+user+"' and Password='"+pass+"' ",con);

                DataTable dt = new DataTable();
                
                sda.Fill(dt);

                if(dt.Rows.Count>=1)
                {

                    menuForm ob = new menuForm(user);
                    ob.Show();
                    this.Hide();
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

            catch(Exception)
            {
                Console.WriteLine("Query error\n");
            }


            con.Close();
            //kaj sesh
        }




        private void signUpButton_Click(object sender, EventArgs e)
        {
            this.Hide();
            signUpForm ob = new signUpForm();
            ob.Show();
          
        }

        private void exitButton_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }





    }
}