using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;

namespace TNTT
{
    public partial class Display : System.Web.UI.Page
    {
        DataSet ds;
        SqlConnection cnn = new SqlConnection(@"Data Source=(local)\SQLEXPRESS;Initial Catalog=TNTT;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            int i = 0;
            string sql = "select top 10 * from tblCauhoi order by newid()";
            SqlCommand sqlcm = new SqlCommand(sql, cnn);
            SqlDataAdapter comd = new SqlDataAdapter(sqlcm);
            ds = new DataSet();
            comd.Fill(ds, "tblCauhoi");
            DataList1.DataSource = ds.Tables["tblCauhoi"];
            DataList1.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)

            //    {
            //        RadioButtonList RadioButtonList1 = (RadioButtonList)e.Item.FindControl("RadioButtonList1");
            //        if (RadioButtonList1 != null)
            //        {
            //            DataRowView drv = (DataRowView)e.Item.DataItem;
            //            RadioButtonList1.DataSource = GetSubData(Convert.ToInt32(drv["iMacauhoi"]));
            //            RadioButtonList1.DataBind();

            //        }
            //    }
            //}

            //private DataTable GetSubData(int ij)
            //{
            //    string tv = "select sDapan1 from tblCauhoi where iMacauhoi='"+ij+"'";
            //    SqlCommand sqlcm = new SqlCommand(tv, cnn);
            //    SqlDataAdapter comd1 = new SqlDataAdapter(sqlcm);
            //    DataTable da = new DataTable();
            //    comd1.Fill(da);
            //    return da;

            //}
            //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)

            //{
            //    RadioButtonList RadioButtonList1 = (RadioButtonList)e.Item.FindControl("RadioButtonList1");
            //    if (RadioButtonList1 != null)
            //    {
            //        // DataRowView drv = (DataRowView)e.Item.DataItem;
            //        int ij = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "iMacauhoi"));
            //        string tv = "select sDapan1 from tblCauhoi where iMacauhoi=1";
            //        SqlCommand sqlcm = new SqlCommand(tv, cnn);
            //        SqlDataAdapter comd1 = new SqlDataAdapter(sqlcm);
            //        DataTable da = new DataTable();
            //        comd1.Fill(da);
            //RadioButtonList1.Items.Add(da.Rows[0][0].ToString());
            //RadioButtonList1.DataBind();

        }


        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                RadioButtonList RadioButtonList1 = (RadioButtonList)e.Item.FindControl("RadioButtonList1");

                //Get questionID here
                //int ij = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "iMacauhoi"));

                //pass Question ID to your DB and get all available options for the question
                //Bind the RadiobUttonList here
                //string q = "select sDapan1 from tblCauhoi where iMacauhoi='" + ij + "'";
                //SqlCommand cmd = new SqlCommand(q, cnn);
                //SqlDataAdapter da = new SqlDataAdapter(cmd);
                ////    //DataSet ds = new DataSet();]
                //DataTable ds = new DataTable();
                //da.Fill(ds);
                //    //DataTable dt = ds.Tables[0];
                //    //DataTable dtRecords = new DataTable();
                //    //dtRecords.Columns.Add("answer", typeof(String));
                //    //dtRecords.Rows.Add(dt.Rows[0][0].ToString().Trim());
                //    //dtRecords.Rows.Add(dt.Rows[0][1].ToString().Trim());
                //    //dtRecords.Rows.Add(dt.Rows[0][2].ToString().Trim());
                //    //dtRecords.Rows.Add(dt.Rows[0][3].ToString().Trim());

                //RadioButtonList1.DataSource = ds.ToString();
                //RadioButtonList1.DataTextField = "sDapan1";
                //RadioButtonList1.DataBind();
                //    //DataTable dt = DAL.SelectFromTable("SELECT Qus.ID, Qus.CorrectAns, Qus.Ans2, Qus.Ans3 FROM  EkhtbrNafsk INNER JOIN Qus ON EkhtbrNafsk.ID = Qus.Type  WHERE  Qus.ID=" + QuestionID);

                //    RadioButtonList1.Items.Add(ds.Rows[0]["sDapan1"].ToString());
                //    //RadioButtonList1.Items.Add(ds.Rows[0][1].ToString());
                //    //RadioButtonList1.Items.Add(ds.Rows[0][2].ToString());
                //}


                if (RadioButtonList1 != null)
                {
                    DataRowView drv = (DataRowView)e.Item.DataItem;
                    RadioButtonList1.DataSource = GetSubData(Convert.ToInt32(drv["iMacauhoi"]));
                    RadioButtonList1.DataTextField = "sCautl";
                    RadioButtonList1.DataValueField = "iMacautl";
                    RadioButtonList1.DataBind();

                }
            }
        }

        private DataTable GetSubData(int ij)
        {
            string tv = "select iMacautl,sCautl from tblCauhoi,tblDapan where tblCauhoi.iMacauhoi = tblDapan.iMacauhoi and tblCauhoi.iMacauhoi = '" + ij + "' order by newid()";
            SqlCommand sqlcm = new SqlCommand(tv, cnn);
            SqlDataAdapter comd1 = new SqlDataAdapter(sqlcm);
            DataTable da = new DataTable();
            comd1.Fill(da);
            return da;


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                DateTime new1 = DateTime.Now;
                //DateTime old = Convert.ToDateTime(Session["old"].ToString());
                //TimeSpan ts = new1 - old;
                //double epoc = ts.TotalSeconds;
                //int phut = (int)(epoc/ 60);
                //int giay =(int) epoc-(phut* 60);
                //Label2.Text = phut+"phút"+giay+"giây";
                var all_items = DataList1.Items;
                foreach (DataListItem item in all_items)
                {
                    RadioButtonList RadioButtonList1 = (RadioButtonList)item.FindControl("RadioButtonList1");
                    var json = new JavaScriptSerializer().Serialize(RadioButtonList1.SelectedValue);
                }


                //Response.Write(Request.Form);
                //var RB = (RadioButtonList)FindControl("RB") as RadioButtonList;
                //{
                //    if (RB != null && RB.SelectedValue != null)
                //    {
                //        Label2.Text = RB.SelectedValue;
                //    }

                //}
                //Response.Redirect("Ketqua.aspx");
            }
        }
    }
}
