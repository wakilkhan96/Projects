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
    public partial class productSellForm : Form
    {

        String logged_user;

        //total calculation variable
        long total = 0;
        long totalGrid = 0;
        //data grid row count 
        int n = 0;


        //ConnectionBlock
        SqlConnection con = new SqlConnection(@"Data Source=PC\SQLEXPRESS;Initial Catalog=SuperShopData;Integrated Security=True");



        List<String> container = new List<string>();







        List<String> product_name = new List<String>();
        List<String> product_qty = new List<String>();
        List<String> product_price = new List<String>();




        public productSellForm(String s)
        {
            InitializeComponent();

            logged_user = s;



            //product item add to combo box
            {

                con.Open();//


                SqlDataAdapter sda = new SqlDataAdapter("select * from ProductData", con);

                DataTable dt = new DataTable();

                sda.Fill(dt);



                foreach (DataRow dr in dt.Rows)
                {

                    this.productNameComboBox.Items.Add(dr[1].ToString());


                }


                con.Close();

                //complete
            }



            {
                //start to fill container with invoice no.
                con.Open();//
                container.Clear();

                SqlDataAdapter sda = new SqlDataAdapter("select * from SellData", con);

                DataTable dt = new DataTable();

                sda.Fill(dt);


                foreach (DataRow dr in dt.Rows)
                {

                    container.Add(dr[4].ToString());

                }


                con.Close();//

                // kaj sesh

            }







        }





        //productNameComboBox_SelectedIndexChanged
        private void productNameComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {

            con.Open();//

            String item = productNameComboBox.SelectedItem.ToString();


            SqlDataAdapter sda = new SqlDataAdapter("select * from ProductData where Name='" + item + "' ", con);

            DataTable dt = new DataTable();

            sda.Fill(dt);


            foreach (DataRow dr in dt.Rows)
            {

                stockTextBox.Text = dr[2].ToString();

            }

            productQuantityComboBox.ResetText();


            con.Close();



            //kaj sesh
        }




        private void addButton_Click(object sender, EventArgs e)
        {

            if( (productNameComboBox.SelectedItem == null ) || (this.productQuantityComboBox.SelectedItem==null) )
            {
                MessageBox.Show("Select product and quantity first !", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            else
            {

                long qty = Int64.Parse(productQuantityComboBox.Text);
                long aqty = Int64.Parse(stockTextBox.Text);

                if (aqty == 0)
                    MessageBox.Show("Product is Out of Stock !", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                else if (qty > aqty)
                    MessageBox.Show(" Desired quantity is not available !", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                else
                {



                    con.Open();//

                    String item = productNameComboBox.SelectedItem.ToString();


                    SqlDataAdapter sda = new SqlDataAdapter("select * from ProductData where Name='" + item + "' ", con);

                    DataTable dt = new DataTable();

                    sda.Fill(dt);




                    foreach (DataRow dr in dt.Rows)
                    {
                        dataGridView.Rows.Add();

                        dataGridView.Rows[n].Cells[0].Value = dr[1].ToString();

                        dataGridView.Rows[n].Cells[1].Value = productQuantityComboBox.Text.ToString();

                        long cost = Int64.Parse(dr[4].ToString());

                        cost = cost * qty;

                        total = total + cost;


                        string scost = cost.ToString();

                        //Console.WriteLine(scost);

                        dataGridView.Rows[n].Cells[2].Value = scost;


                        totalTextBox.Text = total.ToString();



                        {
                            //container e add kora


                            product_name.Add(dr[1].ToString());
                            product_qty.Add(productQuantityComboBox.Text.ToString());
                            product_price.Add(scost);

                            //container e add kora sesh

                        }


                        n++;


                        totalGrid = n;




                        //update stock

                        String name = dr[1].ToString();
                        long nqty = aqty - qty;
                        String snqty = nqty.ToString();

                        String query = "update ProductData set Quantity=" + snqty + "  where Name='" + name + "'  ";
                        SqlCommand scmd = new SqlCommand(query, con);

                        try
                        {
                            int i = scmd.ExecuteNonQuery();



                        }
                        catch (Exception)
                        {
                            Console.WriteLine("Query Failed\n");
                        }

                        //updating sesh



                    }


                    stockTextBox.Text = "";
                    productNameComboBox.ResetText();
                    productQuantityComboBox.ResetText();


                    con.Close();



                }



            }
            //kaj sesh
        }








        //save r print
        private void okButton_Click(object sender, EventArgs e)
        {

            String sname = customerNameTextBox.Text.ToString();
            String saddress = addressTextBox.Text.ToString();
            String scell = cellTextBox.Text.ToString();
            String sinvoice = invoiceNumberTextBox.Text.ToString();


            String stotal = totalTextBox.Text.ToString();
            long itotal;

            String sdate = dateTimePicker.Text.ToString();




            if (sname.Equals("") || saddress.Equals("") || scell.Equals("") || sinvoice.Equals("") || sdate.Equals(""))
                MessageBox.Show("Fill all empty places !", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

            else if (scell.Length != 11)
                MessageBox.Show("Invalid Cell number !!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

            else if (!container.Contains(sinvoice))
            {



                con.Open();



                itotal = Int64.Parse(stotal);

                String query = "insert into SellData values( '" + logged_user + "' , '" + sname + "' , '" + saddress + "' , '" + scell + "' , '" + sinvoice + "' , " + itotal + " , '" + sdate + "'  )";

                SqlCommand scmd = new SqlCommand(query, con);

                try
                {
                    int i = scmd.ExecuteNonQuery();
                    if (i > 0) MessageBox.Show("Data saving Succesfull !", "Succes", MessageBoxButtons.OK, MessageBoxIcon.Information);


                }
                catch (Exception)
                {
                    Console.WriteLine("Query Failed\n");
                }


                con.Close();

                container.Add(sinvoice);


                itotal = 0;
                //total = 0;
                n = 0;


                ////
                printPreviewDialog1.Document = printDocument1;
                printPreviewDialog1.ShowDialog();



                customerNameTextBox.Text = addressTextBox.Text = cellTextBox.Text = invoiceNumberTextBox.Text = totalTextBox.Text = "";
                dataGridView.Rows.Clear();
                total = 0;







            }

            else
            {
                MessageBox.Show("Invoice Number already exists !", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }






            //kaj sesh

            



        }









        //cell verification
        private void cellTextBox_TextChanged(object sender, EventArgs e)
        {


            String str = cellTextBox.Text.ToString();
            int length = str.Length;

            if (length > 0 && !(str[length - 1] >= '0' && str[length - 1] <= '9'))
            {
                MessageBox.Show("No Letters or Symbols are allowed !!\n", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);


                char[] ch = str.ToCharArray();  //converting string to char array
                ch[length - 1] = '\0';          //dismissing last typed  char or symbol or other
                str = new String(ch);           //now converting edited char arrayto string

                cellTextBox.Text = str;
            }

            if (length == 1 && !str[0].Equals('0'))
            {
                MessageBox.Show("Cell must start with ' 0 ' \n", "Attention", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }

            //kaj sesh



        }

        private void printDocument1_PrintPage(object sender, System.Drawing.Printing.PrintPageEventArgs e)
        {
            Image image = Properties.Resources.Super_Shop;
            e.Graphics.DrawImage(image, 0, 0, 815, image.Height);

            e.Graphics.DrawString("Date: " + DateTime.Now, new Font("Ariel",15,FontStyle.Regular),Brushes.Black,new Point(25,240) );
            e.Graphics.DrawString("Invoice Nuber:  " + invoiceNumberTextBox.Text, new Font("Ariel", 15, FontStyle.Regular), Brushes.Black, new Point(25, 290));
            e.Graphics.DrawString("Customer Name:  " + customerNameTextBox.Text, new Font("Ariel", 15, FontStyle.Regular), Brushes.Black, new Point(25, 330));
            e.Graphics.DrawString("Address: "+ addressTextBox.Text, new Font("Ariel", 15, FontStyle.Regular), Brushes.Black, new Point(25, 370));
            e.Graphics.DrawString("------------------------------------------------------------------------------------------------------------------------" , new Font("Ariel", 14, FontStyle.Regular), Brushes.Black, new Point(25, 420));
            e.Graphics.DrawString("  Item Name                                           Quanity                                            Price ", new Font("Ariel", 14, FontStyle.Regular), Brushes.Black, new Point(25, 440));
            e.Graphics.DrawString("------------------------------------------------------------------------------------------------------------------------", new Font("Ariel", 14, FontStyle.Regular), Brushes.Black, new Point(25, 460));






            int location = 500;
            for(int x= 0;x< totalGrid ; x++)
            {
                
                String pName = product_name[x];
                String pQuant = product_qty[x];
                String price = product_price[x];

                e.Graphics.DrawString( pName , new Font("Ariel", 15, FontStyle.Regular), Brushes.Black, new Point(25, location));
                e.Graphics.DrawString( pQuant, new Font("Ariel", 15, FontStyle.Regular), Brushes.Black, new Point(375, location));
                e.Graphics.DrawString( price, new Font("Ariel", 15, FontStyle.Regular), Brushes.Black, new Point(650, location));


                location += 30;
            }

            e.Graphics.DrawString("------------------------", new Font("Ariel", 15, FontStyle.Regular), Brushes.Black, new Point(580, location));
            totalGrid = 0;
            location += 40;
            e.Graphics.DrawString("Total Cost = "+total, new Font("Ariel", 15, FontStyle.Bold), Brushes.Blue, new Point(580, location));


            {
                //container clear kora

                product_name.Clear();
                product_qty.Clear();
                product_price.Clear();


            }



        }


    }
}
