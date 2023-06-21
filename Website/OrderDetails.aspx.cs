using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Shopping.Website
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["E-Shop"].ConnectionString;
        private decimal grandtotal;
        private decimal total;
        private decimal finalPrice;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserId"] != null)
                {
                    ShowOrder();
                }

                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
        void ShowOrder()
        {
            string OrderID = Request.QueryString["Id"];
            int UserId = Convert.ToInt32(Session["UserId"]);
            SqlConnection con = new SqlConnection(cs);
            string query = "select distinct(Order_Details.OrderId),Order_Details.*,Product.Name,Product.ImageUrl from Order_Details,Product, Orders where Order_Details.OrderId='"+OrderID+"' and Orders.UserId='"+UserId+"' and  Order_Details.ProductId=Product.ProductId";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new  DataTable();
            sda.Fill(dt);
            rOrder.DataSource = dt;
            rOrder.DataBind();

        }

        protected void rOrder_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

              
                Label lblQuantity = e.Item.FindControl("lblQty") as Label;
                Label lblPrice = e.Item.FindControl("lblPrice") as Label;
                decimal Price = Convert.ToDecimal(lblPrice.Text.Replace("Rs.", ""));
                decimal qty = Convert.ToDecimal(lblQuantity.Text);
                decimal CartSubTotal = Price * qty;
               
                grandtotal += CartSubTotal;
                int shipping = 150;

                total = shipping;
                finalPrice = shipping + grandtotal;
            }
            

            Session["Total"] = finalPrice;
        }
    }
}