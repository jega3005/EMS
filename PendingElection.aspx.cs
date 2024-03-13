using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PendingElection : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Election"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
            Response.Redirect("Login.aspx", false);
        if (!Page.IsPostBack)
        {
            BindElection();
            getrecords(0);
        }
    }

    private void BindElection()
    {
        SqlCommand cmd = new SqlCommand("select * from ElectionMaster where ElectionId not in(select ElectionId from voting where voterid=" + int.Parse("0" + Session["UserId"]) + ")", conn);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dt = new DataTable();
        da.Fill(dt);
        ddlElection.Items.Clear();
        if (dt.Rows.Count > 0)
        {
            ddlElection.DataSource = dt;
            ddlElection.DataTextField = "ElectionName";
            ddlElection.DataValueField = "ElectionId";
            ddlElection.DataBind();
        }
        ddlElection.Items.Insert(0, new ListItem("--Select Pending Election--", string.Empty));
    }

    private void getrecords(int Id)
    {

        SqlCommand cmd = new SqlCommand("select e.ElectionId,c.CandidateName,c.CandidateId from ElectionDetails e join Candidate c on c.CandidateId=e.CandidateId where ElectionId=" + Id, conn);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dt = new DataTable();
        da.Fill(dt);
        gvCandidate.DataSource = dt;
        gvCandidate.DataBind();
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {

        CheckBox chk = (CheckBox)sender;
        GridViewRow gv = (GridViewRow)chk.NamingContainer;
        int rownumber = gv.RowIndex;

        if (chk.Checked)
        {
            int i;
            for (i = 0; i <= gvCandidate.Rows.Count - 1; i++)
            {
                if (i != rownumber)
                {
                    CheckBox chkcheckbox = ((CheckBox)(gvCandidate.Rows[i].FindControl("CheckBox1")));
                    chkcheckbox.Checked = false;
                }
            }
        }


    }
    protected void ddlElection_SelectedIndexChanged(object sender, EventArgs e)
    {
        getrecords(int.Parse("0" + ddlElection.SelectedValue));
        btnSave.Enabled = true;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        int candidateId = 0;
        foreach (GridViewRow grv in gvCandidate.Rows)
        {
            HiddenField hdnCandidateId = (HiddenField)grv.FindControl("hdnCandidateId");
            CheckBox chk = (CheckBox)grv.FindControl("CheckBox1");
            if (chk.Checked)
                candidateId = int.Parse("0" + hdnCandidateId.Value);
        }
        if (conn.State == ConnectionState.Closed)
            conn.Open();
        SqlCommand cmd = new SqlCommand("insert into Voting(ElectionId,CandidateId,VoterId)values(" + int.Parse("0" + ddlElection.SelectedValue) + "," + candidateId + "," + int.Parse("0" + Session["UserId"]) + ")", conn);
        cmd.CommandType = CommandType.Text;
        int a = cmd.ExecuteNonQuery();
        if (a == 1)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Message", "<script language='javascript'>alert('Your vote taken by us successfully')</script>'");
            btnSave.Enabled = false;
        }
        BindElection();
        conn.Close();
    }
}