using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Shopping.Admin
{

    public partial class Conatact : System.Web.UI.Page
    {
        //varaible of connection string
        string cs = ConfigurationManager.ConnectionStrings["E-Shop"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "Contact";
                getContact();

            }
            lblMsg.Visible = false;

        }

        protected void rContact_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
        void getContact()
        {
            SqlConnection conn = new SqlConnection(cs);
            string query = "select * from Contact";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rContact.DataSource = dt;
            rContact.DataBind();
        }

        protected void rContact_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {

                SqlConnection con3 = new SqlConnection(cs);
                string deletequery = "delete from Contact where ContactId=@id";
                SqlCommand cmd = new SqlCommand(deletequery, con3);
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);


                try
                {
                    con3.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Contact deleted succesfully!";
                    lblMsg.CssClass = "alert alert-success";
                    getContact();
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
    }
}
    
