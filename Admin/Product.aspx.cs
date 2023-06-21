using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;

namespace E_Shopping.Admin
{
    public partial class Product : System.Web.UI.Page
    {
        //varaible of connection string
        string cs = ConfigurationManager.ConnectionStrings["E-Shop"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "Product";
                getProduct();
                dropDown();
            }
            lblMsg.Visible = false;

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //check if there any duplicate category 
            SqlConnection con1 = new SqlConnection(cs);
            string CheckQuery = "Select * from Product where Name = @product_name";
            SqlCommand cmd1 = new SqlCommand(CheckQuery, con1);
            cmd1.Parameters.AddWithValue("@product_name", txt_name.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                //we will show a message by javascript 
                lblMsg.Text = "Product Already Exits";
                cIdActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"]);
              


            }
           


            else
            {
                string actionName= String.Empty, imagePath = String.Empty, fileExtension = String.Empty;
                bool isValidToExcute = false;
                int productID = Convert.ToInt32(hdnId.Value);
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand("Product_Crud", con);
                cmd.Parameters.AddWithValue("@Action", productID ==  0 ? "INSERT" : "UPDATE"); 
                cmd.Parameters.AddWithValue("@ProductId", productID); 
                cmd.Parameters.AddWithValue("@CategoryId", DropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("@Name", txt_name.Text);
                cmd.Parameters.AddWithValue("@Quantity", txt_qty.Text);
                cmd.Parameters.AddWithValue("@Price", txt_price.Text);
                cmd.Parameters.AddWithValue("@description", txt_description.Text);
                cmd.Parameters.AddWithValue("@BestSeller", DropDownList2.SelectedValue);
                cmd.Parameters.AddWithValue("@IsActive", cIdActive.Checked);

                con.Open();
                if (fuProductImage.HasFile)
                {
                    if (Utils.IsValidExtension(fuProductImage.FileName))
                    {
                        //Global Unique Identification number
                        //Guid enforce Uniqueness
                        Guid obj = Guid.NewGuid();
                        fileExtension = Path.GetExtension(fuProductImage.FileName);
                        imagePath = "Image/Product/" + obj.ToString() + fileExtension;
                        fuProductImage.PostedFile.SaveAs(Server.MapPath("/Image/Product/") + obj.ToString() + fileExtension);
                        cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
                        isValidToExcute = true;
                    }
                    else
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "PLease Select jpg, png ,jpeg";
                        lblMsg.CssClass = "alert alert-danger";
                        isValidToExcute = false;

                    }
                
                }
                else
                {
                    isValidToExcute = true;
                }
                if(isValidToExcute)
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    try
                    {
                        cmd.ExecuteNonQuery();
                        actionName = productID == 0 ? "insert" : "update";
                        lblMsg.Text = "Prdouct" + actionName + "successfully";
                        lblMsg.CssClass = "alert alert-success";
                        BtnAdd.Text = "Add";
                        getProduct();
                        clear();

                    }
                    catch(Exception ex)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "Error - " + ex.Message;
                        lblMsg.CssClass = "alert alert-danger";

                    }
                    finally
                    {
                        con.Close();
                    }
                    
                }

            }
        }


        protected void rProduct_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label label = e.Item.FindControl("lblQty") as Label;
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

                //if (Convert.ToInt32(label.Text) <= 5)
                //{
                //    label.CssClass = "badge badge-danger";
                //    label.ToolTip = "Item Abour to Out of Stock";
                //}
            }
        }

        protected void rProduct_ItemCommand(object source, RepeaterCommandEventArgs e)
        {



            lblMsg.Visible = false;


            if (e.CommandName == "delete")
            {

                SqlConnection con3 = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand("Product_Crud", con3);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@ProducId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;


                try
                {
                    con3.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Product deleted succesfully!";
                    lblMsg.CssClass = "alert alert-success";
                    getProduct();
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
            else if (e.CommandName == "Edit")
            {
                SqlConnection con = new SqlConnection(cs);
              
                SqlCommand cmd = new SqlCommand("Product_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "GETBYID");
                cmd.Parameters.AddWithValue("@ProductId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
               
                    cIdActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"]);
                    txt_name.Text = dt.Rows[0]["Name"].ToString();
                    txt_price.Text = dt.Rows[0]["Price"].ToString();
                    txt_description.Text = dt.Rows[0]["Description"].ToString();
                    txt_qty.Text = dt.Rows[0]["Quantity"].ToString();
                  imgProduct.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["ImageUrl"].ToString()) ?
                         ".../Image/No_image.png" : "../" + dt.Rows[0]["ImageUrl"].ToString();
                    DropDownList1.SelectedValue = dt.Rows[0]["CategoryId"].ToString();
                DropDownList2.SelectedValue = dt.Rows[0]["Best_Seller"].ToString();
                    imgProduct.Width = 200;
                    imgProduct.Height = 200;
                hdnId.Value = dt.Rows[0]["ProductId"].ToString();
                BtnAdd.Text = "Update";
                LinkButton btn = e.Item.FindControl("lknUpdate") as LinkButton;
                btn.CssClass = "badge badge-warning";
                
               
            }

        }



        void dropDown()
        {
            SqlConnection conn = new SqlConnection(cs);
            string query = "select *  from categories order by category desc";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DropDownList1.Items.Insert(0, "--Select--");
            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = "category";
            DropDownList1.DataValueField = "id";
            DropDownList1.DataBind();

        }
        void getProduct()
        {
            SqlConnection conn = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("Product_Crud", conn);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rProduct.DataSource = dt;
            rProduct.DataBind();

        }
      void clear()
        {
            txt_name.Text = String.Empty;
            txt_description.Text = String.Empty;
            txt_qty.Text = String.Empty;
            txt_qty.Text = String.Empty;
            txt_price.Text = String.Empty;
            DropDownList1.ClearSelection();
            hdnId.Value = "0";
            cIdActive.Checked = false;
            BtnAdd.Text = "Add";
            imgProduct.ImageUrl = String.Empty;
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            clear();
        }
    }
}

   