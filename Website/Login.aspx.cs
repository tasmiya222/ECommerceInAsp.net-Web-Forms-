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
    public partial class Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["E-Shop"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {
                Response.Redirect("MyAccount.aspx");
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from Users where Username=@user and Password=@pass";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@user", txt_user.Text);
            cmd.Parameters.AddWithValue("@pass", txt_pass.Text.Trim());
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count == 1)
            {
                Session["UserName"] = txt_user.Text;
                Session["UserId"] = dt.Rows[0]["UserId"];
                Response.Redirect("MyAccount.aspx");
            }
            else
            {
                lbl_Msg.Visible = true;
                lbl_Msg.Text = "InVAilds Details";
                lbl_Msg.CssClass = "alert alert-danger";
            }
        }
    }
}