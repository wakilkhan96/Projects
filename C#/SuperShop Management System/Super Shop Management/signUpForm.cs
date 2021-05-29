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
    public partial class signUpForm : Form
    {


        string picPath = "";



        public signUpForm()
        {
            InitializeComponent();
        }


        //ConnectionBlock
        SqlConnection con = new SqlConnection(@"Data Source=PC\SQLEXPRESS;Initial Catalog=SuperShopData;Integrated Security=True");


        


        //submit button er kaj
        private void submitButton_Click(object sender, EventArgs e)
        {


            String user = userTextBox.Text.ToString();
            String pass = passTextBox.Text.ToString();
            String vCode = vCodeTextBox.Text.ToString();

            String name = nameTextBox.Text.ToString();
            String address = addressTextBox.Text.ToString();
            String email = emailTextBox.Text.ToString();
            String cell = cellTextBox.Text.ToString();
    
            


            //email checking

            int length = email.Length;

            bool valid = true;

            char[] ch = email.ToCharArray();


            if ( length<7 || !( ch[length - 4] == '.' && ch[length - 3] == 'c' && ch[length - 2] == 'o' && ch[length - 1] == 'm'))
                valid = false;


            bool correct_order = true;
            int count = 0;
             
            for(int x = 0; x < length-4 ; x++)
            {
                if (ch[x] == '@') count++;

                if (ch[x] == '@')
                {
                    if (x == 0 || ch[x+1]=='.')
                        correct_order = false;
                }

                if ((ch[x] >= 32 && ch[x] <= 45) || (ch[x] >= 58 && ch[x] <= 63) || (ch[x] >= 91 && ch[x] <= 94) || ch[x] == '{' || ch[x] == '}' || ch[x] == '/')
                    correct_order = false;


            }


            if (!correct_order || count!=1) valid = false;

            //email checking sesh





            if (user.Equals("") || pass.Equals("") || name.Equals("") || address.Equals("") || email.Equals("") || cell.Equals("") || vCode.Equals(""))
                MessageBox.Show("Fill all empty places !!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

            else if ( !valid   ||   cell.Length != 11   ||   !vCode.Equals("two"))
            {
                if ( !valid )
                    MessageBox.Show("Invalid E-mail Address !!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                if ( cell.Length != 11 )
                    MessageBox.Show("Invalid Cell number !!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                if (!vCode.Equals("two"))
                    MessageBox.Show("Incorrect Verification Code !!\n", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
          
            else
            {
                con.Open();

                String query =
                    "insert into LoginData values( '" + user + "','" + pass + "','" + name + "','" + address + "','" + email + "','" + cell + "', '" + picPath + "' )";

                SqlCommand scmd = new SqlCommand(query, con);

                try
                {
                    int i = scmd.ExecuteNonQuery();
                    if (i == 1) MessageBox.Show("Registration Succesfull\n");

                    userTextBox.Text = passTextBox.Text = nameTextBox.Text = addressTextBox.Text = emailTextBox.Text = cellTextBox.Text = vCodeTextBox.Text = "";
                }
                catch (Exception)
                {
                    Console.WriteLine("Query Failed\n");
                }


                con.Close();


                pictureBox.ImageLocation = "";

            }


            

            //kaj sesh

        }




        //close button er kaj
        private void closeButton_Click(object sender, EventArgs e)
        {
            this.Dispose();
            loginForm ob = new loginForm();
            ob.Show();

            //kaj sesh

        }



        //cell textBox er kaj
        private void cellTextBox_TextChanged(object sender, EventArgs e)
        {

            String str = cellTextBox.Text.ToString();
            int length = str.Length;

            if( length>0   &&    ! (str[length-1]>='0' && str[length-1]<='9') )
            {
                MessageBox.Show("No Letters or Symbols are allowed !!\n", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                
                char[] ch = str.ToCharArray();  //converting string to char array
                ch[length - 1] = '\0';          //dismissing last typed  char or symbol or other
                str = new String(ch);           //now converting edited char arrayto string

                cellTextBox.Text = str;
            }

            if(length ==1   &&   !str[0].Equals('0') )
            {
                MessageBox.Show("Cell must start with ' 0 ' \n", "Attention", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }

            //kaj sesh


        }

        private void browseButton_Click(object sender, EventArgs e)
        {

            OpenFileDialog dlg = new OpenFileDialog();

            dlg.Filter = "JPG Files(*.jpg)|*.jpg|PNG Files (*.png)|*.png|All files(*.*)|*.*";

            if (dlg.ShowDialog() == DialogResult.OK)
            {
                picPath = dlg.FileName;

                pictureBox.ImageLocation = picPath;
            }



        }
    }
}
