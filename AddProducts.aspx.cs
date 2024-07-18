using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJECT_FINAL.admin
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["organicFinal"].ToString());
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = "insert into products(pname,pimage,catid,price) values(@pname,@pimage,@catid,@price)";
            cmd.Parameters.AddWithValue("pname", txtprodname.Text);
            cmd.Parameters.AddWithValue("catid", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("price",txtPrice.Text);
            SaveImage();
            string proimage = "~/projectimages/products/" + proUpload.PostedFile.FileName.ToString();
            cmd.Parameters.AddWithValue("pimage", proimage);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            lblMsg.Text = "Uploaded Successfully";
            txtPrice.Text = "";
            txtprodname.Text = "";
        }
        protected void SaveImage()
        {
            if (proUpload.HasFile)
            {
                string filename = proUpload.PostedFile.FileName.ToString();
                proUpload.SaveAs(Server.MapPath("~/projectimages/products/" + filename));
            }
        }
    }
}