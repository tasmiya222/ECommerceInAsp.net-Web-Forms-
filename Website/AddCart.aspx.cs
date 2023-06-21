using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Schema;

namespace E_Shopping.Website
{
    public partial class AddCart : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["E-Shop"].ConnectionString;
        private decimal grandtotal;
        private decimal total;
        private decimal finalPrice;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                if (Session["UserId"] == null)
                {
                    Response.Redirect("Login.aspx");
                  
                }
                else
                {

                    getCartItem();
                }
            }

        }
        void getCartItem()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("Cart_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.Parameters.AddWithValue("@UserID", Session["UserId"]);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rCart.DataSource = dt;
            if (dt.Rows.Count > 0)
            {
                //rCart.FooterTemplate = null;
                //rCart.FooterTemplate = new CustomTemplate(ListItemType.Footer);

            }
            rCart.DataBind();
        }


        protected void rCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Utils utils = new Utils();
            if(e.CommandName == "remove")
            {
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand("Cart_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@ProductId", e.CommandArgument);
                cmd.Parameters.AddWithValue("@UserID", Session["UserId"]);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    getCartItem();
                    Session["CartCount"] = utils.CartCount(Convert.ToInt32(Session["UserId"]));
                }
                catch (Exception ex)
                {
                 
                    System.Web.HttpContext.Current.Response.Write("<script>alert('Error = " + ex.Message + "')</script>");

                }
                finally
                {
                    con.Close();
                }
            }
            if(e.CommandName == "updateCart")
            {
                bool isCartUpdate = false;
                for(int item =0;item < rCart.Items.Count; item++)
                {
                    if (rCart.Items[item].ItemType == ListItemType.Item || rCart.Items[item].ItemType == ListItemType.AlternatingItem)
                    {
                        TextBox quantity = rCart.Items[item].FindControl("txtQuantity") as TextBox;
                        HiddenField __ProductId = rCart.Items[item].FindControl("hdnProductId") as HiddenField;
                        HiddenField __quantity = rCart.Items[item].FindControl("hdnQuantity") as HiddenField;
                        int quantityFromCart = Convert.ToInt32(quantity.Text);
                        int ProductId = Convert.ToInt32(__ProductId.Value);
                        int quantityFromDB = Convert.ToInt32(__quantity.Value);
                        bool isTrue = false;
                        int updateQuanity = 1;
                    
                     if (quantityFromCart > quantityFromDB)
                    {
                        updateQuanity = quantityFromCart;
                        isTrue = true;

                    }
                     else if(quantityFromCart < quantityFromDB)
                        {
                            updateQuanity = quantityFromCart;
                            isTrue = true;
                        }
                         if(isTrue)
                        {
                            //update cart item's  quantity in DB
                            isCartUpdate = utils.updateCartQuantity(updateQuanity, ProductId, Convert.ToInt32(Session["UserId"]));
                        }


                    }
                }
            }
            getCartItem();
        }

        protected void rCart_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
     
                Label totalPrice = e.Item.FindControl("lblTotalPrice") as Label;
                Label productPrice = e.Item.FindControl("lblPrice") as Label;
                TextBox quantity = e.Item.FindControl("txtQuantity") as TextBox;
                decimal cartTotalPrice = Convert.ToDecimal(productPrice.Text.Replace("Rs.", "")) * Convert.ToDecimal(quantity.Text);
                totalPrice.Text = cartTotalPrice.ToString();
                grandtotal += cartTotalPrice;

                int above_order = 1500;
                int shipping = 150;
                if(cartTotalPrice >= above_order)
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
            Session["grandTotalCart"] = grandtotal;
            Session["ShippinPrice"] = total;

            Session["Total"] = finalPrice;

            

        }

        
         
        }

    }
