using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace E_Shopping.Website
{
    public partial class Main : System.Web.UI.MasterPage
    {
        string cs = ConfigurationManager.ConnectionStrings["E-Shop"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NavBar();


                if (Session["UserId"] != null)
                {
                    lblLogoutOrLogin.Text = Session["UserName"].ToString();

                    Utils utils = new Utils();
                    Session["CartCount"] = utils.CartCount(Convert.ToInt32(Session["UserId"])).ToString();
                    getCartShow();

                }

                else
                {
                    lblLogoutOrLogin.Text = "Login";
                    Session["CartCount"] = "0";
                    lblMsg.Visible = true;
                    lblMsg.Text = "Your Cart is Empty!!";
                }
            }
        }
        void NavBar()
        {
            SqlConnection conn = new SqlConnection(cs);
            string query = "select  * from  categories where IsActive = 1 order by category ";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rNavBar.DataSource = dt;
            rNavBar.DataBind();
        }




      
        protected void rCartShow_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            Utils utils = new Utils();
            if (e.CommandName == "remove")
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


        }
        void getCartShow()
        {



            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("Cart_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rCartShow.DataSource = dt;
            rCartShow.DataBind();


        }

    }
}