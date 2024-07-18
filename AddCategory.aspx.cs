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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
        }

        protected void txtcatname_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=Shreya\\SQLEXPRESS;Initial Catalog=organicFinal;Integrated Security=True");
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = "insert into category(catname,catimage) values(@catname,@catimage)";
            cmd.Parameters.AddWithValue("catname", txtcatname.Text);
            string cimage = "~/projectimages/category/" + catUpload.PostedFile.FileName.ToString();
            cmd.Parameters.AddWithValue("catimage",cimage);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            lblMsg.Text = "Category Successfully added";
            txtcatname.Text = "";


        }
        protected void saveImage()
        {
            if(catUpload.HasFile)
            {
                string filename = catUpload.PostedFile.FileName.ToString();
                catUpload.SaveAs(Server.MapPath("~/projectimages/category/"+filename));
            }
        }
    }
}