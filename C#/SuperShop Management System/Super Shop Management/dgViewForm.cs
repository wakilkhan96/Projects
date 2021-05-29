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
    public partial class dgViewForm : Form
    {
        public dgViewForm()
        {
            InitializeComponent();
            this.show();
        }



        //ConnectionBlock
        SqlConnection con = new SqlConnection(@"Data Source=PC\SQLEXPRESS;Initial Catalog=SuperShopData;Integrated Security=True");


        //datagrid er kaj
        public void show()
        {

            SqlDataAdapter sda = new SqlDataAdapter("select * from ProductData", con);

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


            // kaj sesh

        }





    }
}
