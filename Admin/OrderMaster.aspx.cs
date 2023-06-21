using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Shopping.Admin
{
    public partial class OrderMaster : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["E-Shop"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "OrderMaster";
                getOrder();
               
            }
            lblMsg.Visible = false;
        }
        void getOrder()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select Orders.*,Order_Status.Name as Order_Status from Orders,Order_Status where Order_Status.Name=Orders.OrderStatus";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rOrderMaster.DataSource = dt;
            rOrderMaster.DataBind();

        }
    }
}