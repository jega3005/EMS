using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
public partial class NewElection : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Election"].ToString());
    SqlCommand sqlCmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            BindDropDown();
        }
    }
    private void BindDropDown()
    {
        DataSet ds = new DataSet();
        if (conn.State == ConnectionState.Closed)
            conn.Open();
        sqlCmd = new SqlCommand();
        sqlCmd.CommandType = CommandType.Text;
        sqlCmd.Connection = conn;
        sqlCmd.CommandText = "select * from Candidate";
        SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
        sda.Fill(ds);
        sda.Dispose();
        if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            ddlCandList1.DataSource = ds.Tables[0];
            ddlCandList2.DataSource = ds.Tables[0];
            ddlCandList3.DataSource = ds.Tables[0];
            ddlCandList4.DataSource = ds.Tables[0];

            ddlCandList1.DataTextField = "CandidateName";
            ddlCandList2.DataTextField = "CandidateName";
            ddlCandList3.DataTextField = "CandidateName";
            ddlCandList4.DataTextField = "CandidateName";

            ddlCandList1.DataValueField = "CandidateId";
            ddlCandList2.DataValueField = "CandidateId";
            ddlCandList3.DataValueField = "CandidateId";
            ddlCandList4.DataValueField = "CandidateId";

            ddlCandList1.DataBind();
            ddlCandList2.DataBind();
            ddlCandList3.DataBind();
            ddlCandList4.DataBind();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (conn.State == ConnectionState.Closed)
            conn.Open();
        sqlCmd = new SqlCommand();
        sqlCmd.CommandType = CommandType.Text;
        sqlCmd.Connection = conn;
        sqlCmd.CommandText = "insert into ElectionMaster(ElectionName,NoOfCandidate,ElectionDate)values('" + txtElectionName.Text + "',"+Convert.ToInt32(ddlNoOfCandidate.SelectedValue) + ",'"+ txtEndDate.Text + "')";
        int i=sqlCmd.ExecuteNonQuery();
        if(i==1)
        {
            DataTable dt = new DataTable();
            SqlCommand sql1 = new SqlCommand();
            sql1.CommandType = CommandType.Text;
            sql1.Connection = conn;
            sql1.CommandText="select max(ElectionId) as ElectionId from ElectionMaster";
            SqlDataAdapter sda = new SqlDataAdapter(sql1);
            sda.Fill(dt);
            sda.Dispose();
            if (dt.Rows.Count > 0)
                txtElectionId.Text = Convert.ToString(dt.Rows[0]["ElectionId"]);

            if(ddlNoOfCandidate.SelectedValue=="2")
                sqlCmd.CommandText = "insert into ElectionDetails(ElectionId,CandidateId)values(" + int.Parse("0" + txtElectionId.Text) + "," + +int.Parse("0" + ddlCandList1.SelectedValue) + ")insert into ElectionDetails(ElectionId,CandidateId)values(" + int.Parse("0" + txtElectionId.Text) + "," + int.Parse("0" + ddlCandList2.SelectedValue) + ")";
            else if(ddlNoOfCandidate.SelectedValue=="3")
                sqlCmd.CommandText = "insert into ElectionDetails(ElectionId,CandidateId)values(" + int.Parse("0" + txtElectionId.Text) + "," + +int.Parse("0" + ddlCandList1.SelectedValue) + ")insert into ElectionDetails(ElectionId,CandidateId)values(" + int.Parse("0" + txtElectionId.Text) + "," + int.Parse("0" + ddlCandList2.SelectedValue) + ")insert into ElectionDetails(ElectionId,CandidateId)values(" + int.Parse("0" + txtElectionId.Text) + "," + int.Parse("0" + ddlCandList3.SelectedValue) + ")";
            else if(ddlNoOfCandidate.SelectedValue=="4")
                sqlCmd.CommandText = "insert into ElectionDetails(ElectionId,CandidateId)values(" + int.Parse("0" + txtElectionId.Text) + "," + +int.Parse("0" + ddlCandList1.SelectedValue) + ")insert into ElectionDetails(ElectionId,CandidateId)values(" + int.Parse("0" + txtElectionId.Text) + "," + int.Parse("0" + ddlCandList2.SelectedValue) + ")insert into ElectionDetails(ElectionId,CandidateId)values(" + int.Parse("0" + txtElectionId.Text) + "," + int.Parse("0" + ddlCandList3.SelectedValue) + ")insert into ElectionDetails(ElectionId,CandidateId)values(" + int.Parse("0" + txtElectionId.Text) + "," + int.Parse("0" + ddlCandList4.SelectedValue) + ")";
            int k=sqlCmd.ExecuteNonQuery();
            conn.Close();
        }
    }
    protected void ddlNoOfCandidate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlNoOfCandidate.SelectedValue=="2")
        {
            ddlCandList1.Style.Add("display", "");
            ddlCandList2.Style.Add("display", "");
        }
        else if(ddlNoOfCandidate.SelectedValue=="3")
        {
            ddlCandList1.Style.Add("display", "");
            ddlCandList2.Style.Add("display", "");
            ddlCandList3.Style.Add("display", "");
        }
        else if (ddlNoOfCandidate.SelectedValue == "4")
        {
            ddlCandList1.Style.Add("display", "");
            ddlCandList2.Style.Add("display", "");
            ddlCandList3.Style.Add("display", "");
            ddlCandList4.Style.Add("display", "");
        }
        else
        {
            ddlCandList1.Style.Add("display", "none");
            ddlCandList2.Style.Add("display", "none");
            ddlCandList3.Style.Add("display", "none");
            ddlCandList4.Style.Add("display", "none");
        }
    }
}