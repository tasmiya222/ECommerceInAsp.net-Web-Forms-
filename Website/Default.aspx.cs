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
    public partial class Default : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["E-Shop"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                getLatestProduct();
                getBestSellerProduct();
            }
        }
        void getLatestProduct()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from Product where IsActive= 1";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rLatestProduct.DataSource = dt;
            rLatestProduct.DataBind();


        }

        protected void rLatestProduct_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (Session["UserId"] != null)
            {
                bool isCartItemUpdated = false;
                int i = isItemExistInCart(Convert.ToInt32(e.CommandArgument));
                if (i == 0)
                {
                    //Adding new  item in cart 
                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand("Cart_Crud", con);
                    cmd.Parameters.AddWithValue("@Action", "INSERT");
                    cmd.Parameters.AddWithValue("@ProductId", e.CommandArgument);
                    cmd.Parameters.AddWithValue("@Quantity", "1");
                    cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
                    cmd.CommandType = CommandType.StoredProcedure;

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error = " + ex.Message + "')</script>");
                    }
                    finally
                    {
                        con.Close();
                    }
                }
                else
                {
                    Utils util = new Utils();
                    isCartItemUpdated = util.updateCartQuantity(i + 1, Convert.ToInt32(e.CommandArgument), Convert.ToInt32(Session["UserId"]));
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Item added SuccessFully')</script>");
                    Response.AddHeader("REFRESH", "1;URL=AddCart.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        int isItemExistInCart(int productId)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("Cart_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETBYID");
            cmd.Parameters.AddWithValue("@ProductId", productId);
            cmd.Parameters.AddWithValue("@UserID", Session["UserId"]);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            int quantity = 0;
            if (dt.Rows.Count > 0)
            {
                quantity = Convert.ToInt32(dt.Rows[0]["Quantity"]);

            }

            return quantity;
        }

  
        void getBestSellerProduct()
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("Product_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "BESTSELLER");
            cmd.Parameters.AddWithValue("@BestSeller", "1");
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new  SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rBestSeller.DataSource = dt;
            rBestSeller.DataBind();

        }
        protected void rBestSeller_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (Session["UserId"] != null)
            {
                bool isCartItemUpdated = false;
                int i = isItemExistInCart(Convert.ToInt32(e.CommandArgument));
                if (i == 0)
                {
                    //Adding new  item in cart 
                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand("Cart_Crud", con);
                    cmd.Parameters.AddWithValue("@Action", "INSERT");
                    cmd.Parameters.AddWithValue("@ProductId", e.CommandArgument);
                    cmd.Parameters.AddWithValue("@Quantity", "1");
                    cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
                    cmd.CommandType = CommandType.StoredProcedure;

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error = " + ex.Message + "')</script>");
                    }
                    finally
                    {
                        con.Close();
                    }
                }
                else
                {
                    Utils util = new Utils();
                    isCartItemUpdated = util.updateCartQuantity(i + 1, Convert.ToInt32(e.CommandArgument), Convert.ToInt32(Session["UserId"]));
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Item added SuccessFully')</script>");
                    Response.AddHeader("REFRESH", "1;URL=AddCart.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}