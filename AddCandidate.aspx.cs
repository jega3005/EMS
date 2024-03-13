using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

public partial class AddCandidate : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Election"].ToString());
    SqlCommand sqlCmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            if (Request.QueryString["CandidateId"] != null)
                FillCandidate(int.Parse("0" + Request.QueryString["CandidateId"]));
        }
    }

    private void FillCandidate(int id)
    {
        if (conn.State == ConnectionState.Closed)
            conn.Open();
        SqlCommand cmd = new SqlCommand("select * from Candidate where CandidateId=" + id, conn);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            txtAddress.Text = dt.Rows[0]["Address"].ToString();
            txtCandidateName.Text = dt.Rows[0]["CandidateName"].ToString();
            txtCity.Text = dt.Rows[0]["City"].ToString();
            txtDescription.Text = dt.Rows[0]["Description"].ToString();
            txtEmailId.Text = dt.Rows[0]["EmailId"].ToString();
            txtCandidateContact.Text = dt.Rows[0]["CandidateContact"].ToString();
            hdnProfile.Value = dt.Rows[0]["Profile"].ToString();
            btnsubmit.Text = "Update";
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {


            DataSet ds = new DataSet();
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.Text;
            sqlCmd.Connection = conn;
            sqlCmd.CommandText = "select * from Candidate where CandidateContact='" + txtCandidateContact.Text + "'";
            SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
            sda.Fill(ds);
            sda.Dispose();
            string filename = string.Empty;
            if (fuimgInp.HasFiles)
            {
                filename = fuimgInp.FileName;
                fuimgInp.PostedFile.SaveAs(Server.MapPath("~/Profile/") + fuimgInp.PostedFile.FileName);
            }
            else
            {
                filename = hdnProfile.Value;
            }
            if (btnsubmit.Text != "Update")
            {
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count == 0)
                {
                    
                    if (btnsubmit.Text != "Update")
                    {
                        sqlCmd = new SqlCommand();
                        sqlCmd.CommandText = "insert into Candidate(CandidateName,CandidateContact,EmailId,Address,Profile,City,Description)values('" + txtCandidateName.Text + "','" + txtCandidateContact.Text + "','" + txtEmailId.Text + "','" + txtAddress.Text + "','" + filename + "','" + txtCity.Text + "','" + txtDescription.Text + "')";
                        sqlCmd.CommandType = CommandType.Text;
                        sqlCmd.Connection = conn;
                        int a = sqlCmd.ExecuteNonQuery();
                        if (a == 1)
                        {
                            divMessage.Attributes.Add("class", "alert alert-success");
                            divMessage.InnerHtml = "Data inserted successfully";
                        }
                        else
                        {
                            divMessage.Attributes.Add("class", "alert alert-danger");
                            divMessage.InnerHtml = "Please try again later";
                        }
                    }
                }
                else
                {
                    divMessage.Attributes.Add("class", "alert alert-danger");
                    divMessage.InnerHtml = "This candidate already exists";
                }
            }
            else
            {
                sqlCmd = new SqlCommand();
                sqlCmd.CommandText = "update Candidate set CandidateName='" + txtCandidateName.Text + "',CandidateContact='" + txtCandidateContact.Text + "',EmailId='" + txtEmailId.Text + "',Address='" + txtAddress.Text + "',Profile='" + filename + "',City='" + txtCity.Text + "',Description='" + txtDescription.Text + "' where CandidateId=" + int.Parse("0" + Request.QueryString["CandidateId"]);
                sqlCmd.CommandType = CommandType.Text;
                sqlCmd.Connection = conn;
                int a = sqlCmd.ExecuteNonQuery();
                if (a == 1)
                {
                    divMessage.Attributes.Add("class", "alert alert-success");
                    divMessage.InnerHtml = "Data updated successfully";
                }
                else
                {
                    divMessage.Attributes.Add("class", "alert alert-danger");
                    divMessage.InnerHtml = "Please try again later";
                }
                btnsubmit.Text = "Submit";
            }

        }
        catch (Exception)
        {
            throw;
        }
    }
}