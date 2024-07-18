using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJECT_FINAL
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(txtUser.Text== "admin@emailid.com" && txtPass.Text=="admin123")
            {
                Session["email"] = "admin@emailid.com";
                Response.Redirect("admin/WelcomeAdmin.aspx");
            }
            else { 
            SqlConnection con = new SqlConnection("Data Source=Shreya\\SQLEXPRESS;Initial Catalog=organicFinal;Integrated Security=True");
            con.Open();
            SqlCommand cmd= con.CreateCommand();
            cmd.CommandText = "select txtM,txtAdd,txtPass from signup where txtEmail=@email";
            cmd.Parameters.AddWithValue("email",txtUser.Text);
            SqlDataReader dataReader= cmd.ExecuteReader();
            if(dataReader.Read())
            {
                if (txtPass.Text == dataReader.GetString(2).ToString())
                {
                    Session["email"] = txtUser.Text;
                    Session["mobile"] = dataReader.GetString(0).ToString();
                    Session["address"] = dataReader.GetString(1).ToString();
                    cmd.Dispose();
                    con.Close();
                        PROJECT_FINAL.Cart c=new PROJECT_FINAL.Cart();
                        Session["cart"] = c;
                        if (this.Request.QueryString["ReturnUrl"]!=null)
                        {
                            this.Response.Redirect(Request.QueryString["ReturnUrl"].ToString());
                        }
                        else
                        {
                            this.Response.Redirect("index.aspx");
                        }
                        
                }
                else
                {
                    Label1.Text = "PLEASE TRY AGAIN!!!";
                }
            }
            else
            {
                Label1.Text = "PLEASE TRY AGAIN!!!";
            }
            }

        }
    }
}