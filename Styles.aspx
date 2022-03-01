<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.OleDb" %>

<!DOCTYPE html>
<html>
<center>
    <head runat="server">
        <h1 style="color:#ffffff"><font size="50">rate my style.</font></h1>
        <title>Rate My Style</title>
    </head>
    <body bgcolor="palevioletred">
        <a href="Upload.aspx">Upload an Image</a>
        <p><a href="HomePage.aspx">Logout</a></p>

        <p style="color:#ffffff"><font size="4.5">click on a users image to rate it.</font></p>
        <p id="parData" runat="server"></p><br />
        <br />

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
        String h;
        cmd = new OleDbCommand("SELECT * FROM Garments1;", cn);
        cn.Open();
        r = cmd.ExecuteReader();
        h = "";
        while (r.Read())
        {
            h = h + "<a href='Rate.aspx?ID=" + r["ID"] + "'>";
            h = h + "<img src='Images/" + r["Image"] + "' width='400' height='650' />" + "</a>";
        }
        cn.Close();
        parData.InnerHtml = h;
    }

</script>