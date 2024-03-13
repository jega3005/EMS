using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Election"].ToString());
    SqlCommand sqlCmd;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if(txtUsername.Text=="Admin" && txtPassword.Text=="admin")
        {
            Session["Username"] = "Admin";
            Response.Redirect("NewElection.aspx");
        }
        else
        {
            DataSet ds = new DataSet();
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;
            sqlCmd.Connection = conn;
            sqlCmd.CommandText = "select * from Register where Username='" + txtUsername.Text + "' and Password='" + txtPassword.Text + "'";
            SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
            sda.Fill(ds);
            sda.Dispose();
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Session["UserId"] = ds.Tables[0].Rows[0]["UserId"];
                Session["Username"] = ds.Tables[0].Rows[0]["Username"];
                Session["FullName"] = ds.Tables[0].Rows[0]["FullName"];
                Response.Redirect("PendingElection.aspx");
            }
            else
            {
                divMessage.Attributes.Add("class", "alert alert-danger");
                divMessage.InnerHtml = "Your Username or Password wrong";
            }
        }
    }
}