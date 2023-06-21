using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;

namespace E_Shopping.Admin
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["E-Shop"].ConnectionString;
        private decimal grandtotal;
        private decimal finalPrice;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "OrderDetails";
                dropdown();
                showOrder();
               
            }
            lblMsg.Visible = false;


        }

        void showOrder()
        {
            string OrderId = Request.QueryString["Id"];
            SqlConnection con = new SqlConnection(cs);
            string query = " select Product.Name , Product.ImageUrl,Product.Price,Order_Details.Quantity,Orders.Address,Orders.PinCode,Orders.City,Order_Details.* from Order_Details \r\n\t inner join Product on Product.ProductId=Order_Details.ProductId Inner join Orders on Orders.Id=Order_Details.OrderId where Order_Details.OrderId='" + OrderId + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rOrderMaster.DataSource = dt;
            rOrderMaster.DataBind();


        }

        protected void rOrderMaster_ItemDataBound1(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Label productPrice = e.Item.FindControl("lblPrice") as Label;
                Label quantity = e.Item.FindControl("lblQty") as Label;
                decimal price;
                decimal quan;
                if (productPrice.Text == "")
                {
                    price = 0;
                }
                else
                {
                    price = Convert.ToDecimal(productPrice.Text);
                }
                ;
                if (productPrice.Text == "")
                {
                     quan = 0;
                }
                else
                {
                    quan = Convert.ToDecimal(quantity.Text);
                }


                
                decimal cartTotalPrice = price * quan;
                grandtotal += cartTotalPrice;
                int shipping = 150;
                finalPrice = shipping + grandtotal;
            }
            Session["grandTotalCart"] = finalPrice;
        }

      

        
        void dropdown()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "Select * from Order_Status";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = "Name";
            DropDownList1.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            
            
            string OrderId = Request.QueryString["Id"];
            SqlConnection con = new SqlConnection(cs);
            string query = "UPDATE Orders SET OrderStatus =@orderStatus WHERE Orders.Id =@orderID";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@orderStatus", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@orderID", OrderId);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                lblMsg.Visible = true;
                lblMsg.Text = "Order Status Has Been Change";
                lblMsg.CssClass = "alert alert-success";
                Response.Redirect("OrderMaster.aspx");
            }
            catch (Exception ex)
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Error -" + ex.Message;
                lblMsg.CssClass = "alert alert-danger";
            }
            finally
            {
                con.Close();
            }
        }
    }
}