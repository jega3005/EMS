using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CandidateReport : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Election"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            BindElection();
    }

    private void BindElection()
    {
        if (conn.State == ConnectionState.Closed)
            conn.Open();
        SqlCommand cmd = new SqlCommand("select * from Candidate", conn);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            gvCandidate.DataSource = dt;
            gvCandidate.DataBind();
        }
    }
    protected void gvCandidate_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int candidateId = int.Parse("0" + gvCandidate.DataKeys[e.RowIndex].Value);
        if (conn.State == ConnectionState.Closed)
            conn.Open();
        SqlCommand cmd = new SqlCommand("delete from Candidate where CandidateId="+candidateId, conn);
        cmd.CommandType = CommandType.Text;
        int i = cmd.ExecuteNonQuery();

        if (i == 1)
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Message", "<script language='javascript'>alert('You have removed one record successfully!!')</script>");
        BindElection();
    }

}