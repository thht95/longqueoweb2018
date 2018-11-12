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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection(@"Data Source=(local)\SQLEXPRESS;Initial Catalog=TNTT;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dangky.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var tendn = TextBox1.Text;
            var mk = TextBox2.Text;
            SqlCommand cmd = new SqlCommand("kiemtradangnhap", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@sUsername", SqlDbType.Char).Value = tendn;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                if (mk == dt.Rows[0]["sPassword"].ToString())
                {
                    if (int.Parse(dt.Rows[0]["iRole"].ToString()) != 3)
                    {
                        Session["tk"] = tendn;
                        Session["mk"] = mk;
                        Response.Redirect("admin.aspx");
                    }
                    else
                        Response.Redirect("User.aspx");

                }
                else
                    Response.Write("<script>alert('Sai tên đăng nhập hoặc mật khẩu');</script>");

            }
            else
                Response.Write("<script>alert('Sai tên đăng nhập hoặc mật khẩu');</script>");
            TextBox1.Focus();
        }
    }
}