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
    public partial class sellReportForm : Form
    {


        //ConnectionBlock
        SqlConnection con = new SqlConnection(@"Data Source=PC\SQLEXPRESS;Initial Catalog=SuperShopData;Integrated Security=True");



        List<String> container = new List<string>();


        public sellReportForm()
        {
            InitializeComponent();


            container.Clear();

            //product item add to combo box
            {

                con.Open();//


                SqlDataAdapter sda = new SqlDataAdapter("select * from SellData", con);

                DataTable dt = new DataTable();

                sda.Fill(dt);



                foreach (DataRow dr in dt.Rows)
                {
                    String s = dr[0].ToString();

                    if (!container.Contains(s) )
                    {
                        container.Add( s );
                        Console.WriteLine( s );
                        getUserComboBox.Items.Add( s );

                    }


                }


                con.Close();

                //complete
            }



            



        }

        private void getUserComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {


            //product item add to combo box
            {

                con.Open();//

                String suser = getUserComboBox.SelectedItem.ToString();


                String query;

                if (suser.Equals("All User")) query = "select * from SellData ";

                else query = "select * from SellData where Username='" + suser + "' ";



                SqlDataAdapter sda = new SqlDataAdapter(query, con);

                DataTable dt = new DataTable();

                sda.Fill(dt);

                long total = 0;


                foreach (DataRow dr in dt.Rows)
                {
                    String s = dr[5].ToString();

                    total += Int64.Parse(s);
                    


                }



                totalTextBox.Text = total.ToString();


                con.Close();

                //complete
            }


            //kaj sesh
        }




    }
}
