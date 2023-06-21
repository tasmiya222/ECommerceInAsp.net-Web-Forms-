using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Shopping.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        //varaible of connection string
        string cs = ConfigurationManager.ConnectionStrings["E-Shop"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //this class maintainconnection b/w  Database and  Application  data
            SqlConnection conn = new SqlConnection(cs);
            //query
            string query = "select * from Admin where Username=@user and Password=@pass";
            //command for execute the query
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@user", txt_users.Text);
            cmd.Parameters.AddWithValue("@pass", txt_pass.Text);
            conn.Open();
            //its will Read the rows and match with query
            SqlDataReader dt = cmd.ExecuteReader();
            if (dt.HasRows)
            {
                Session["Admin_Username"] = txt_users.Text;
                //script alert message
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Login Succesfully!')</script>");
                Response.Redirect("DashBoard.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", "<script>alert('Login Fail!')</script>");

            }
            conn.Close();

        }
    }
}