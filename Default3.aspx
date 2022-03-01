<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.OleDb" %>

<!DOCTYPE html>

<html>
<center>
    <head runat="server">
        <h1 style="color:#ffffff"><font size="50">rate my style.</font></h1>
        <title>Rate My Style</title>
    </head>
    <body bgcolor="black">
        <a href="Rate.aspx">Back to Garments</a>
        <form id="form1" runat="server">
            <input id="Star1" type="submit" value="Star1" runat="server" onnseverclick="Star1_Click" />
            <input id="Star2" type="submit" value="Star2" runat="server" onnseverclick="Star2_Click" />
            <input id="Star3" type="submit" value="Star3" runat="server" onnseverclick="Star3_Click" />
            <input id="Star4" type="submit" value="Star4" runat="server" onnseverclick="Star4_Click" />
            <input id="Star5" type="submit" value="Star5" runat="server" onnseverclick="Star5_Click" />

            <p id="parImage" runat="server"></p>

        </form>
    </body>
</center>
</html>

<script runat="server">
    void Page_Load()
    {
        String cs = "Provider=Microsoft.ACE.OLEDB.12.0;" +
               "Data Source=" + Server.MapPath("RateStyle.accdb") + ";";
        OleDbConnection cn = new OleDbConnection(cs);
        OleDbCommand cmd;
        OleDbDataReader r;
        String sql  = "SELECT * FROM Garments1 WHERE ID=" + Request.QueryString["ID"];
        cmd = new OleDbCommand(sql, cn);

        cn.Open();
        r = cmd.ExecuteReader();
        if (r.Read())
        {
            parImage.InnerHtml = "<img src='Images/" +  r["Image"].ToString() + "'" + " />";
        }
        cn.Close();
    }

    protected void Star1_Click(Object s, EventArgs e)
    {

    }
</script>