using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

namespace E_Shopping.Website
{
    public partial class Checkout1 : System.Web.UI.Page
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
                    

                    getOrder();
                }
                else
                {


                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Your Car is Empty!')</script>");
                    Response.Redirect("Login.aspx");
                }
            }

        }
   

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "Select * from Users where Username = @user and Password=@pas";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@user", txtUser.Text.Trim());
            cmd.Parameters.AddWithValue("@pas", txtPass.Text.Trim());
            con.Open();
            cmd.ExecuteNonQuery();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Login SucccessFully')</script>");
            Response.Redirect("Checkout.aspx");
            con.Close();
        }
        void getOrder()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("Cart_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rOder.DataSource = dt;
            rOder.DataBind();
        }
        protected void rOder_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Label subTotal = e.Item.FindControl("lblSubTotal") as Label;
                Label lblQuantity = e.Item.FindControl("lblQuantity") as Label;
                Label lblPrice = e.Item.FindControl("lblPrice") as Label;
                decimal Price = Convert.ToDecimal(lblPrice.Text.Replace("Rs.", ""));
                decimal qty = Convert.ToDecimal(lblQuantity.Text);
                decimal CartSubTotal = Price * qty;
                subTotal.Text = CartSubTotal.ToString();
                grandtotal += CartSubTotal;

                int above_order = 1500;
                int shipping = 150;
                if (CartSubTotal >= above_order)
                {
                    shipping = 0;
                }
                else
                {
                    shipping = 150;

                }


                total = shipping;
                finalPrice = shipping + grandtotal;
            }
            Session["ShippinPrice"] = total;

            Session["Total"] = finalPrice;

        }

 
        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {


            SqlConnection con = new SqlConnection(cs);
            DateTime date = DateTime.Now;
            int OrderId = Convert.ToInt32(hdnID.Value);
            Label lblQty = FindControl("lblQuantity") as Label;
            Label ProductID = FindControl("lblProductId") as Label;
            decimal Price = Convert.ToDecimal(Session["Total"]);
            string query = "insert into Orders(Address,UserId,PinCode,PaymentType,totalPrice,PaymentStatus,OrderStatus,City,createdDate,Country,Notes)" +
                "values(@Address,@UserId,@PinCode,@PaymentType,@totalPrice,@PaymentStatus,@OrderStatus,@City,@date,@Country,@Notes)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Address", txt_address.Text);
            cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
            cmd.Parameters.AddWithValue("@PinCode", txt_postCode.Text);
            cmd.Parameters.AddWithValue("@totalPrice", Price);
            cmd.Parameters.AddWithValue("@OrderStatus","Pending");
            cmd.Parameters.AddWithValue("@date", date);
            cmd.Parameters.AddWithValue("@City", txt_City.Text);
            cmd.Parameters.AddWithValue("@Country", txt_Country.Text);
            cmd.Parameters.AddWithValue("@Notes", txt_notes.Text);
            SqlCommand cmd1 = new SqlCommand("insert into Order_Details(UserId,ProductId,Quantity,Price,createdDate)" +
                "values(@UserId,@ProductId,@Quantity,'"+Price+"',@Date)",con);
            cmd1.Parameters.AddWithValue("@Date", date);
            cmd1.Parameters.AddWithValue("@ProductId", ProductID);
            cmd1.Parameters.AddWithValue("@UserId", Session["UserId"]);
            cmd1.Parameters.AddWithValue("@Quantity", lblQty);
            string payment_type = "cod";
            string payment_Status;
            if (payment_type == "cod")
            {
              payment_Status = "success";

                cmd.Parameters.AddWithValue("@paymentType", payment_type);
                cmd.Parameters.AddWithValue("@PaymentStatus", payment_Status);
            }
           
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                lblMsg.Visible = true;
                lblMsg.Text = "Order Successfuly Place";
                lblMsg.CssClass = "alert alert-success";
                Response.Redirect("ThankYou.aspx");
            }
            catch (Exception ex)
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Error - "+ ex.Message;
                lblMsg.CssClass = "alert alert-danger";
            }
            finally
            {
                con.Close();

            }
            
               
               
            
        }
    }
}