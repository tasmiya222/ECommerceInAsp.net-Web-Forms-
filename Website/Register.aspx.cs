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
 
    public partial class Register : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["E-Shop"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(cs);
            string RegQuery = "insert into Users(Name,Mobile,Address,Email,PostCode,Username,Password,createdDate)values(@name,@mobile,@address,@email,@post,@pass,@user,@date)";
            SqlCommand cmd = new SqlCommand(RegQuery, con);
            cmd.Parameters.AddWithValue("@name",txt_name.Text);
            cmd.Parameters.AddWithValue("@mobile", txt_mobile.Text);
            cmd.Parameters.AddWithValue("@address", txt_address.Text);
            cmd.Parameters.AddWithValue("@post", txt_post.Text);
            cmd.Parameters.AddWithValue("@email", txt_email.Text);
            cmd.Parameters.AddWithValue("@pass", txt_pass.Text);
            cmd.Parameters.AddWithValue("@user", txt_user.Text);
            DateTime date = DateTime.Now;
            cmd.Parameters.AddWithValue("@date", date);
            con.Open();
                cmd.ExecuteNonQuery();
            lbl_Msg.Visible = true;
            lbl_Msg.Text = "Registered";
            lbl_Msg.CssClass = "alert alert-success";
            Response.Redirect("Login.aspx");
            con.Close();
        }
    }
}