using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJECT_FINAL
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        PROJECT_FINAL.Cart c = new PROJECT_FINAL.Cart();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                string OrignalUrl=HttpContext.Current.Request.RawUrl;
                string LoginPageUrl="/login.aspx";
                HttpContext.Current.Response.Redirect(String.Format("{0}?ReturnUrl={1}", LoginPageUrl, OrignalUrl));
                
            }
            else
            {
                double price = double.Parse(((Label)DataList1.Controls[0].FindControl("priceLabel")).Text);
                string ProductName = ((Label)DataList1.Controls[0].FindControl("pnameLabel")).Text;
                string ProductImageUrl= ((Label)DataList1.Controls[0].FindControl("pimgUrl")).Text;
                int productID = int.Parse(Request.QueryString["pid"]);
                
                c=(PROJECT_FINAL.Cart)Session["cart"];
                c.Insert(productID, price, 1, ProductName, ProductImageUrl);
                Session["cart"]= c;
                string catid= ((Label)DataList1.Controls[0].FindControl("catidLabel")).Text;
                Response.Redirect("products.aspx?catid=" + catid);
            }
        }
    }
}