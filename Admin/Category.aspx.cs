using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Shopping.Admin
{
    public partial class Category : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["E-Shop"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "Category";
                getCategories();
                Response.Write(Request.QueryString["id"]);
            }
            lblMsg.Visible = false;

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //check if there any duplicate category 
            SqlConnection con1 = new SqlConnection(cs);
            string Query = "select * from categories where category = @check_category";
            SqlCommand cm = new SqlCommand(Query, con1);
            cm.Parameters.AddWithValue("@check_category", txt_name.Text);
            SqlDataAdapter check = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            check.Fill(dt);

            if (dt.Rows.Count == 1)
            {
                //we will show a message by javascript 
                lblMsg.Text = "Category Already  Exist!!";

                cIdActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"]);
                txt_name.Text = dt.Rows[0]["category"].ToString();
            }
            else if (Request.QueryString["id"] != null)
            {
                UpdateDelete();

            }
            else
            {
                SqlConnection con = new SqlConnection(cs);
                string CategoryQuery = "insert into categories (category,IsActive)values(@category,@active)";
                SqlCommand cmd = new SqlCommand(CategoryQuery, con);
                cmd.Parameters.AddWithValue("@category", txt_name.Text);
                cmd.Parameters.AddWithValue("@active", cIdActive.Checked);
                con.Open();
                cmd.ExecuteNonQuery();
                lblMsg.Text = "Category Added!!";
                con.Close();


            }
        }

        void getCategories()
        {
            SqlConnection conn = new SqlConnection(cs);
            string query = "select * from categories";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rCategory.DataSource = dt;
            rCategory.DataBind();

        }

        void UpdateDelete()
        {
            lblMsg.Visible = false;
            string type = Request.QueryString["type"];
            if (type == "edit")
            {

                SqlConnection con2 = new SqlConnection(cs);
                string UpdateQuery = "update  categories set category=@category, IsActive=@active where id=@id";
                SqlCommand cmd = new SqlCommand(UpdateQuery, con2);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                cmd.Parameters.AddWithValue("@category", txt_name.Text);
                cmd.Parameters.AddWithValue("@active", cIdActive.Checked);
                cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
                sda.Fill(dt);
           
                con2.Open();
                cmd.ExecuteNonQuery();
                BtnAdd.Text = "Update";
                con2.Close();

            }
            else if (Request.QueryString["type"] == "delete")
            {
                string UID = Request.QueryString["id"];
                SqlConnection con3 = new SqlConnection(cs);
                string DeleteQuery = "delete from categories where id=@id";
                SqlCommand cmd = new SqlCommand(DeleteQuery, con3);
                cmd.Parameters.AddWithValue("@id", UID);
                    con3.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Category Deleted Succesfully!";
                    lblMsg.CssClass = "alert alert-success";
                    getCategories();               
                    con3.Close();

                
            }
            else
            {
                lblMsg.Text = "Error";
            }
        }
    
        protected void rCategory_DataBound(object source, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbl = e.Item.FindControl("lblActiveMsg") as Label;
                if (lbl.Text == "True")
                {
                    lbl.Text = "Active";
                    lbl.CssClass = "badge badge-success";
                }
                else
                {
                    lbl.Text = "DeActive";
                    lbl.CssClass = "badge badge-danger";
                }
            }
        }

        protected void rCategory_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {

                SqlConnection con3 = new SqlConnection(cs);
                string deletequery = "delete from categories where id=@id";
                SqlCommand cmd = new SqlCommand(deletequery, con3);
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);


                try
                {
                    con3.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "category deleted succesfully!";
                    lblMsg.CssClass = "alert alert-success";
                    getCategories();
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
