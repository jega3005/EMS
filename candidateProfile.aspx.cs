using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class candidateProfile : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Election"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
            Response.Redirect("Login.aspx", false);
        if (Request.QueryString["CandidateId"] != null)
        {
            SqlCommand cmd = new SqlCommand("select * from Candidate where CandidateId=" + int.Parse("0" + Request.QueryString["CandidateId"]), conn);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataTable dt = new DataTable();
            da.Fill(dt);
            if(dt.Rows.Count>0)
            {
                imgProfilePic.ImageUrl = "~/Profile/" + dt.Rows[0]["Profile"];
                lblName.Text = Convert.ToString(dt.Rows[0]["CandidateName"]);
                lblEmail.Text = Convert.ToString(dt.Rows[0]["EmailId"]);
                lblContact.Text = Convert.ToString(dt.Rows[0]["CandidateContact"]);
                lblCity.Text = Convert.ToString(dt.Rows[0]["City"]);
                lblAddress.Text = Convert.ToString(dt.Rows[0]["Address"]);
                lblDescription.Text = Convert.ToString(dt.Rows[0]["Description"]);
            }
        }
    }
}