using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJECT_FINAL
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        static int oid;
        PROJECT_FINAL.Cart c;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cart"]!=null)
            {
                c = (PROJECT_FINAL.Cart)Session["cart"];
            }
            else
            {
                Response.Redirect("login.aspx");
            }
            if (!Page.IsPostBack)
            {
                ReBindGrid();
            }
            if (c.Items == null)
            {
                lblTotal.Visible= false;
            }

        }
        private void ReBindGrid()
        {
            grdCart.DataSource = c.Items;
            DataBind();
            lblTotal.Text = c.Total.ToString();
        }

        protected void grdCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            c.Items.RemoveAt(e.RowIndex);
            ReBindGrid();
        }
        protected void grdCart_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdCart.EditIndex = -1;
            ReBindGrid();
        }

        protected void grdCart_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdCart.EditIndex = e.NewEditIndex;
            ReBindGrid();
        }

        protected void grdCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox txtQuantity = (TextBox)grdCart.Rows[e.RowIndex].Cells[2].Controls[0];
            int qty =Convert.ToInt32(txtQuantity.Text);
            if (qty == 0)
            {
                c.Items.RemoveAt(e.RowIndex);
            }
            else
            {
                c.Items[e.RowIndex].Quantity= qty;
            }
            grdCart.EditIndex = -1;
            ReBindGrid();
        }
        

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["organicFinal"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd = con.CreateCommand();
            cmd.CommandText = "insert into total_billing(email,total,mobile,address) values(@email, @total, @mobile, @address)";
            cmd.Parameters.AddWithValue("email", Session["email"].ToString());
            cmd.Parameters.AddWithValue("mobile", Session["mobile"].ToString());
            cmd.Parameters.AddWithValue("address", Session["address"].ToString());
            cmd.Parameters.AddWithValue("total",lblTotal.Text);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();

            foreach(GridViewRow rowno in grdCart.Rows)
            {
                if (rowno.RowType == DataControlRowType.DataRow)
                {
                    SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["organicFinal"].ToString());
                    con1.Open();
                    SqlCommand cmd2= new SqlCommand();  
                    cmd2=con1.CreateCommand();

                    string productname = rowno.Cells[1].Text.ToString();
                    int quantitynow = int.Parse((rowno.Cells[2].Text.ToString()));
                    string pricenow = rowno.Cells[3].Text.ToString();
                    string subtotal = rowno.Cells[4].Text.ToString();

                    cmd2.CommandText = "insert into order_details(orderid,prodname,quantity,price,subtotal) values(@orderid,@prodname,@quantity,@price,@subtotal)";
                    oid = BringOid();
                    Session["oid"] = oid;
                    cmd2.Parameters.AddWithValue("orderid", oid);
                    cmd2.Parameters.AddWithValue("prodname", productname);
                    cmd2.Parameters.AddWithValue("quantity", quantitynow);
                    cmd2.Parameters.AddWithValue("price", pricenow);
                    cmd2.Parameters.AddWithValue("subtotal", subtotal);
                    cmd2.ExecuteNonQuery();
                    cmd2.Dispose();
                    con1.Close();

                    Response.Redirect("index.aspx");

                }
            }

        }
        protected int BringOid()
        {
            int od = 0;
            SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["organicFinal"].ToString());
            con1.Open();
            SqlCommand cmd1 = new SqlCommand();
            cmd1 = con1.CreateCommand();
            cmd1.CommandText = "select orderid from total_billing where email=@email";
            cmd1.Parameters.AddWithValue("email", Session["email"].ToString());
            SqlDataReader dr= cmd1.ExecuteReader();
            while (dr.Read())
            {
                od=dr.GetInt32(0);
            }
            dr.Dispose();
            cmd1.Dispose();
            con1.Close();
            return od;
        }
    }
}