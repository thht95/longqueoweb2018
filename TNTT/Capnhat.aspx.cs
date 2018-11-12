using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace TNTT
{
    public partial class Capnhat : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection(@"Data Source=(local)\SQLEXPRESS;Initial Catalog=TNTT;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            hienthi();
        }
        protected void hienthi()
        {
            string sql = "select * from tblCauhoi";
            SqlCommand com = new SqlCommand(sql, cnn);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            TextBox2.Text = HttpUtility.HtmlDecode( row.Cells[2].Text);
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            hienthi();
        }
    }
}