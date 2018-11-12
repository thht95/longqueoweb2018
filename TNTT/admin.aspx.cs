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
    public partial class admin : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection(@"Data Source=(local)\SQLEXPRESS;Initial Catalog=TNTT;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            Button2.Enabled = false;
            if (Session["tk"] == null && Session["mk"] == null)
            {
                Button1.Enabled = false;
                Button2.Enabled = false;
                TextBox1.Enabled = false;
                Label1.Text = "";

            }
            else
            {
                var tk = Session["tk"].ToString();
                var mk = Session["mk"].ToString();
                SqlCommand cmd = new SqlCommand("dangnhapadmin", cnn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@sUsername", SqlDbType.Char).Value = tk;
                cmd.Parameters.Add("@sPassword", SqlDbType.Char).Value = mk;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count>0)
                {
                    Label1.Text = "";
                }
                hienthi();
                hienthi2();
            }
        }
        protected void hienthi()
        {
            string grv = "select * from tblMonhoc";
            SqlCommand cmd1 = new SqlCommand(grv, cnn);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            GridView2.DataSource = dt1;
            GridView2.DataBind();
        }
        protected void hienthi2()
        {
            SqlCommand hienthi = new SqlCommand("hienthi", cnn);
            hienthi.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter dahienthi = new SqlDataAdapter(hienthi);
            DataTable dthienthi = new DataTable();
            dahienthi.Fill(dthienthi);
            GridView1.DataSource = dthienthi;
            GridView1.DataBind();
        }
      

        protected void Button1_Click(object sender, EventArgs e)
        {
            var mh = TextBox1.Text;
            if (mh == "")
            {
                Response.Write("<script>alert('Bạn chưa nhập môn học');</script>");
                Button2.Enabled = false;

            }
            else
            {
                SqlCommand cmd = new SqlCommand("kiemtramonhoc", cnn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@sTenmon", SqlDbType.Char).Value = mh;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Label1.Text = "Đã có môn học này";
                    Button2.Enabled = false;
                }
                else
                {
                    Label1.Text = "Chưa có môn học này";
                    Button2.Enabled = true;
                }
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string sql = "SELECT TOP 1 tblMonhoc.iMamon FROM tblMonhoc ORDER BY iMamon DESC";
            SqlCommand com = new SqlCommand(sql,cnn);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            int i = int.Parse(dt.Rows[0]["iMamon"].ToString()) + 1;
            var mh = TextBox1.Text;
            SqlCommand cmd = new SqlCommand("themmonhoc", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@iMamon", SqlDbType.Char).Value = i;
            cmd.Parameters.Add("@sTenmon", SqlDbType.Char).Value = mh;
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();
            hienthi();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            var tk = TextBox2.Text;
       
            try {
                if (int.Parse(tk)%1==0)
                {
                    SqlCommand tkma = new SqlCommand("timkiemtheoma", cnn);
                    tkma.CommandType = CommandType.StoredProcedure;
                    tkma.Parameters.Add("@timkiem", SqlDbType.Int).Value = tk;
                    SqlDataAdapter datkma = new SqlDataAdapter(tkma);
                    DataTable dttkma = new DataTable();
                    datkma.Fill(dttkma);
                    GridView1.DataSource = dttkma;
                    GridView1.DataBind();

                }
            }
            catch {
                SqlCommand tkten= new SqlCommand("timkiemtheoten", cnn);
                tkten.CommandType = CommandType.StoredProcedure;
                tkten.Parameters.Add("@timkiem", SqlDbType.Char).Value = tk;
                SqlDataAdapter datkten = new SqlDataAdapter(tkten);
                DataTable dttkma = new DataTable();
                datkten.Fill(dttkma);
                GridView1.DataSource = dttkma;
                GridView1.DataBind();
            }
            
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            //int trang_thu = e.NewPageIndex;
            //int so_dong = GridView2.PageSize;
            hienthi();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            hienthi2();
        }
    }
}