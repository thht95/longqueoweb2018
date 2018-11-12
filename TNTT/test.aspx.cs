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
    public partial class test : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection(@"Data Source=DESKTOP-NSOQDCR\SQLEXPRESS;Initial Catalog=TNTT;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql = "select sCauhoi,sDapan1,sDapan2,sDapan3,sDapan4 from tblCauhoi";
            SqlCommand sql1 = new SqlCommand(sql, cnn);
            SqlDataAdapter sql11 = new SqlDataAdapter(sql1);
            DataTable da = new DataTable();
            sql11.Fill(da);
            RadioButtonList1.DataValueField = "sCauhoi";
            RadioButtonList1.DataSource = da;
            RadioButtonList1.DataBind();

            //Label1.Text = da.Rows[0][0].ToString();
            //RadioButtonList1.Items.Add(da.Rows[0][1].ToString());
            //RadioButtonList1.Items.Add(da.Rows[0][2].ToString());
            //RadioButtonList1.Items.Add(da.Rows[0][3].ToString());
            //RadioButtonList1.Items.Add(da.Rows[0][4].ToString());


        }
    }
}