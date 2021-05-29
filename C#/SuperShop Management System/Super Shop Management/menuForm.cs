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

namespace Super_Shop_Management
{
    public partial class menuForm : Form
    {

        String logged_user;
        String pictureLocation = "";


        //ConnectionBlock
        SqlConnection con = new SqlConnection(@"Data Source=PC\SQLEXPRESS;Initial Catalog=SuperShopData;Integrated Security=True");




        public menuForm( String s)
        {
            InitializeComponent();


            //
            logged_user = s;

            userLabel.Text ="[    "+ s +"    ]";


            //picture adding block
            {

                con.Open();



                SqlDataAdapter sda = new SqlDataAdapter("select * from LoginData where Username='" + logged_user + "' ", con);

                DataTable dt = new DataTable();

                sda.Fill(dt);


                foreach (DataRow dr in dt.Rows)
                {

                    pictureLocation = dr[6].ToString();

                    //Console.WriteLine(pictureLocation);

                }


                con.Close();



                //kaj sesh

            }


            //location
            pictureBox.ImageLocation = pictureLocation;







        }

        private void productViewButton_Click(object sender, EventArgs e)
        {
            dgViewForm ob = new dgViewForm();
            ob.Show();
        }


        private void productSellButton_Click(object sender, EventArgs e)
        {
            productSellForm ob = new productSellForm(logged_user);
            ob.Show();
        }


        private void productConfigureButton_Click(object sender, EventArgs e)
        {
            mainForm ob = new mainForm();
            ob.Show();
            Console.WriteLine(1);
        }



        private void sellReportButton_Click(object sender, EventArgs e)
        {

            sellReportForm ob = new sellReportForm();
            ob.Show();


        }





        private void aboutButton_Click(object sender, EventArgs e)
        {

            MessageBox.Show(" App Developed by - *_* \n\n    CE-16002\n    CE-16031\n    CE-16042\n    CE-15054");

        }

        private void logoutButton_Click(object sender, EventArgs e)
        {
            logged_user = "";
            this.Hide();
            loginForm ob = new loginForm();
            ob.Show();

        }





    }
}
