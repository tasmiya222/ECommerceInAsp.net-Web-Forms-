using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Shopping.Admin
{
    public partial class User : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["E-Shop"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "User";
                getUser();

            }
            lblMsg.Visible = false;
        }

        protected void rUser_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {

                SqlConnection con3 = new SqlConnection(cs);
                string deletequery = "delete from Users where UserId=@id";
                SqlCommand cmd = new SqlCommand(deletequery, con3);
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);


                try
                {
                    con3.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Users deleted succesfully!";
                    lblMsg.CssClass = "alert alert-success";
                    getUser();
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "error - " + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con3.Close();

                }
            }
        }
        void getUser()
        {
            SqlConnection conn = new SqlConnection(cs);
            string query = "select * from Users";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rUser.DataSource = dt;
            rUser.DataBind();
        }
    }
}