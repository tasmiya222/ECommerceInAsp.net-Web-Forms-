using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Shopping.Website
{
    public partial class Contact : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["E-Shop"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "insert into Contact(Name,Subject,Email,Message,createdDate) values(@Name,@Subject,@Email,@Message,@Date)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Name", txt_name.Text.Trim());
            cmd.Parameters.AddWithValue("@Subject", txt_subject.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txt_email.Text.Trim());
            cmd.Parameters.AddWithValue("@Message", txt_message.Text.Trim());
            DateTime date = DateTime.Now;
            cmd.Parameters.AddWithValue("@Date", date);
            con.Open();
            int a = cmd.ExecuteNonQuery();
             if(a > 0 )
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Message Sent Successfully')</script>");
            }
             else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "<script>alert('Message Fail!!')</script>");
            }
            con.Close();


        }
    }
}