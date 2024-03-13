using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VoteCalculating : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Election"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            BindElection();
    }
    private void BindElection()
    {
        SqlCommand cmd = new SqlCommand("select * from ElectionMaster", conn);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            ddlElectionId.DataSource = dt;
            ddlElectionId.DataTextField = "ElectionName";
            ddlElectionId.DataValueField = "ElectionId";
            ddlElectionId.DataBind();
        }
        ddlElectionId.Items.Insert(0, new ListItem("--Select Election--", string.Empty));
    }
    protected void ddlElectionId_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("SELECT c.CandidateId, c.CandidateName,c.CandidateContact,c.Profile,COUNT(dbo.Voting.VoteId) AS VoteCount" +
                    "FROM  dbo.Candidate c inner join electiondetails ed on ed.candidateId=c.CandidateId and ed.electionid="+int.Parse("0"+ddlElectionId.SelectedValue)+
                    "left   JOIN dbo.Voting ON c.CandidateId = dbo.Voting.CandidateId and dbo.voting.electionId=ed.electionId"+
                    "GROUP BY c.CandidateId, c.CandidateName,c.CandidateContact,c.Profile order by VoteCount desc", conn);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            rptVotingResult.DataSource = dt;
            rptVotingResult.DataBind();
        }
        lblCandidate.Text = Convert.ToString(dt.Rows[0]["CandidateName"]);
    }
}