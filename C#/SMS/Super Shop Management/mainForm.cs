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
using System.IO;

namespace Super_Shop_Management
{
    public partial class mainForm : Form
    {
        public mainForm()
        {
            InitializeComponent();

            this.searchTextBox.Text = "    Search Here";

            this.show();
        }




        //ConnectionBlock
        SqlConnection con = new SqlConnection(@"Data Source=PC\SQLEXPRESS;Initial Catalog=SuperShopData;Integrated Security=True");



        List<String> container = new List<string>();




        //datagrid er kaj
        public void show()
        {

            con.Open();//
            container.Clear();

            SqlDataAdapter sda = new SqlDataAdapter("select * from ProductData",con);

            DataTable dt = new DataTable();

            sda.Fill(dt);

            dataGridView.Rows.Clear();

            int n = 0;

            foreach(DataRow dr in dt.Rows)
            {
                dataGridView.Rows.Add();
                dataGridView.Rows[n].Cells[0].Value = dr[0].ToString();
                dataGridView.Rows[n].Cells[1].Value = dr[1].ToString();
                dataGridView.Rows[n].Cells[2].Value = dr[2].ToString();
                dataGridView.Rows[n].Cells[3].Value = dr[3].ToString();
                dataGridView.Rows[n].Cells[4].Value = dr[4].ToString();

                container.Add(dr[0].ToString());

                n++;
            }


            con.Close();//

            // kaj sesh

        }







        //add button er kaj
        private void addButton_Click(object sender, EventArgs e)
        {

            String id = productIDTextBox.Text.ToString();
            String name = productNameTextBox.Text.ToString();
            String category = productCategoryTextBox.Text.ToString();

            String squantity = productQuantityTextBox.Text.ToString();
            long quantity;

            String scost = productCostTextBox.Text.ToString();
            long cost=0;





            if (id.Equals("") || name.Equals("") || squantity.Equals("") || category.Equals("") || cost.Equals(""))
                MessageBox.Show("Fill all empty places !", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

            else if(container.Contains(id))
                MessageBox.Show("Product ID already exists !", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

            else
            {
                con.Open();

                quantity = Int64.Parse(squantity);
                cost = Int64.Parse(scost);

                String query = "insert into ProductData values( '" + id + "' , '" + name + "' , " + quantity + " , '" + category + "' , " + cost +"  )";

                SqlCommand scmd = new SqlCommand(query, con);

                try
                {
                    int i = scmd.ExecuteNonQuery();
                    if (i == 1) MessageBox.Show("Product Added Succesfully\n");

                    productIDTextBox.Text = productNameTextBox.Text = productQuantityTextBox.Text = productCategoryTextBox.Text = productCostTextBox.Text = "";
   
                }
                catch (Exception)
                {
                    Console.WriteLine("Query Failed\n");
                }


                con.Close();

            }


            this.show();

            //kaj sesh
        }






        //update button er kaj
        private void updateButton_Click(object sender, EventArgs e)
        {

            String id = productIDTextBox.Text.ToString();
            String name = productNameTextBox.Text.ToString();
            String category = productCategoryTextBox.Text.ToString();

            String squantity = productQuantityTextBox.Text.ToString();
            long quantity ;

            String scost = productCostTextBox.Text.ToString();
            long cost=0 ;




            if (id.Equals("") || name.Equals("") || squantity.Equals("") || category.Equals("") || cost.Equals(""))
                MessageBox.Show("Fill all empty places !", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

            else
            {
                con.Open();

                quantity = Int64.Parse(squantity);
                cost = Int64.Parse(scost);

                String query = "update ProductData set Name='" + name + "' , Quantity="+quantity+" , Category='" + category + "' , Cost=" + cost + " where ID='" + id + "'  ";
                SqlCommand scmd = new SqlCommand(query, con);

                try
                {
                    int i = scmd.ExecuteNonQuery();
                    if (i == 1) MessageBox.Show("Product Updated Succesfully\n");

                    productIDTextBox.Text = productNameTextBox.Text = productQuantityTextBox.Text = productCategoryTextBox.Text = productCostTextBox.Text = "";
                    
                }
                catch (Exception)
                {
                    Console.WriteLine("Query Failed\n");
                }


                con.Close();

            }



            this.show();

            //kaj sesh

        }






        //delete button er kaj
        private void deleteButton_Click(object sender, EventArgs e)
        {


            String id = productIDTextBox.Text.ToString();



            if ( id.Equals("") )
                MessageBox.Show("Product ID is missing !", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

            else
            {
                con.Open();

                String query = "delete from ProductData where ID='" + id + "'   ";
                SqlCommand scmd = new SqlCommand(query, con);

                try
                {
                    int i = scmd.ExecuteNonQuery();
                    if (i == 1) MessageBox.Show("Product Deleted Succesfully\n");

                    productIDTextBox.Text = productNameTextBox.Text = productQuantityTextBox.Text = productCategoryTextBox.Text = productCostTextBox.Text = "";
                }
                catch (Exception)
                {
                    Console.WriteLine("Query Failed\n");
                }


                con.Close();

            }



            this.show();


            //kaj sesh

        }




        //search box er kaj
        private void searchTextBox_TextChanged(object sender, EventArgs e)
        {

            con.Open();


            if(!searchTextBox.Text.Equals("    Search Here") && comboBox.Text.ToString().Equals(""))
            {
                MessageBox.Show("Please select Search Option First !", "Attention", MessageBoxButtons.OK, MessageBoxIcon.Information);
                goto End;
            }

            String name = searchTextBox.Text.ToString();
            String category = searchTextBox.Text.ToString();

            String query;
            
            if( comboBox.Text.ToString().Equals("Name") )
            {
                query = "select * from ProductData where Name like '%" + name + "%' ";
            }
            else
            {
                query = "select * from ProductData where Category like '%" + category + "%' ";
            }

            SqlDataAdapter sda = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();

            sda.Fill(dt);

            dataGridView.Rows.Clear();

            int n = 0;

            foreach (DataRow dr in dt.Rows)
            {
                dataGridView.Rows.Add();
                dataGridView.Rows[n].Cells[0].Value = dr[0].ToString();
                dataGridView.Rows[n].Cells[1].Value = dr[1].ToString();
                dataGridView.Rows[n].Cells[2].Value = dr[2].ToString();
                dataGridView.Rows[n].Cells[3].Value = dr[3].ToString();
                dataGridView.Rows[n].Cells[4].Value = dr[4].ToString();
                


                n++;
            }


            End:;


            con.Close();

                //kaj sesh

            

        }





        // selection change er kaj
        private void comboBox_SelectedIndexChanged(object sender, EventArgs e)
        {

            searchTextBox_TextChanged(sender, e);

            //kaj sesh
        }



        //datagrid er cell click er kaj
        private void dataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {

            this.productIDTextBox.Text = dataGridView.Rows[e.RowIndex].Cells["id"].Value.ToString();
            this.productNameTextBox.Text = dataGridView.Rows[e.RowIndex].Cells["name"].Value.ToString();
            this.productQuantityTextBox.Text = dataGridView.Rows[e.RowIndex].Cells["quantity"].Value.ToString();
            this.productCategoryTextBox.Text = dataGridView.Rows[e.RowIndex].Cells["category"].Value.ToString();
            this.productCostTextBox.Text = dataGridView.Rows[e.RowIndex].Cells["cost"].Value.ToString();

            

            //kaj sesh
        }

        private void searchTextBox_Click(object sender, EventArgs e)
        {
            this.searchTextBox.Text = "";
        }
    }
}
