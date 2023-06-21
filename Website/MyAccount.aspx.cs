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
    public partial class MyAccount : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["E-Shop"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
             
                if (Session["UserId"] != null)
                {
                    getOrderShow();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
                
            }
            void getOrderShow()
            {
                
                SqlConnection con = new SqlConnection(cs);
                string query = "Select o.*,s.Name As OrderStatus from dbo.Orders o" +
                    " INNER JOIN dbo.Order_Status s ON s.OrderId= o.Id where UserId =@userId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@userId", Session["UserId"]);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                ROrderShow.DataSource = dt;
                ROrderShow.DataBind();
            }
           
        }

        protected void lknLogout_Click(object sender, EventArgs e)
        {

            if (Session["UserId"] != null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                Session.Abandon();
                Response.Redirect("Login.aspx");
            }
        }
    }
}