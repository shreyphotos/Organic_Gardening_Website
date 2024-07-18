using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJECT_FINAL
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=Shreya\\SQLEXPRESS;Initial Catalog=organicFinal;Integrated Security=True");
            con.Open();
            SqlCommand cmd= con.CreateCommand();
            cmd.CommandText = "insert into signup(txtFname,txtLname,txtM,txtAdd,txtEmail,txtPass) values (@txtFname,@txtLname,@txtM,@txtAdd,@txtEmail,@txtPass)";
            cmd.Parameters.AddWithValue("txtFname", txtFname.Text);
            cmd.Parameters.AddWithValue("txtLname", txtLname.Text);
            cmd.Parameters.AddWithValue("txtM", txtM.Text);
            cmd.Parameters.AddWithValue("txtAdd", txtAdd.Text);
            cmd.Parameters.AddWithValue("txtEmail", txtEmail.Text);
            cmd.Parameters.AddWithValue("txtPass", txtPass.Text);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
            Response.Redirect("login.aspx");
        }
    }
}