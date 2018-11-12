using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace TNTT
{
    public partial class Dangky : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection(@"Data Source=(local)\SQLEXPRESS;Initial Catalog=TNTT;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox5.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var tendn = TextBox1.Text;
            var mk = TextBox2.Text;
            var email = TextBox3.Text;
            SqlCommand cmd = new SqlCommand("dangky", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@sUserName", SqlDbType.Char).Value = tendn;
            cmd.Parameters.Add("@sPassword", SqlDbType.Char).Value = mk;
            cmd.Parameters.Add("@sEmail", SqlDbType.Char).Value = email;
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
  
        }
    }
}