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

        <form id="form1" runat="server">


            <p style="color:#ffffff"><font size="4.5">rate this style out of 5.</font></p>
            <p>
                <input id="Star1" type="submit" value="1" runat="server" onnseverclick="Star1_Click" />
                <input id="Star2" type="submit" value="2" runat="server" onnseverclick="Star2_Click" />
                <input id="Star3" type="submit" value="3" runat="server" onnseverclick="Star3_Click" />
                <input id="Star4" type="submit" value="4" runat="server" onnseverclick="Star4_Click" />
                <input id="Star5" type="submit" value="5" runat="server" onnseverclick="Star5_Click" />
            </p>

            <a href="Styles.aspx">Back to Garments</a>
            <p id="parImage" runat="server"></p>

            <p><b>Garment:</b><p id="parItem" runat="server" style="color:#ffffff"></p>
            <b>Colour:</b><p id="parColour" runat="server" style="color:#ffffff"></p>
            <b>Shop:</b><p id="parShop" runat="server" style="color:#ffffff"></p>
            <b>Price(£):</b><p id="parPrice" runat="server" style="color:#ffffff"></p></p>


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
            parItem.InnerText = r["Item"].ToString();
            parColour.InnerText = r["Colour"].ToString();
            parShop.InnerText = r["Shop"].ToString();
            parPrice.InnerText = r["Price"].ToString();
            parImage.InnerHtml = "<img src='Images/" + r["Image"].ToString() + "' width='400' height='650' />";

        }
        cn.Close();
    }

    protected void Star1_Click(Object s, EventArgs e)
    {

        int rating = 1;

        String cs = "Provider=Microsoft.ACE.OLEDB.12.0;" +
                          "Data Source=" + Server.MapPath("RateStyle.accdb") + ";";
        OleDbConnection cn = new OleDbConnection(cs);
        {
            cn.Open();
            OleDbCommand cmd = new OleDbCommand("INSERT INTO Garments1([Rate])VALUES (@Rate)", cn);
            cmd.Parameters.AddWithValue("@Rate", rating);
            cmd.ExecuteNonQuery();
            cn.Close();

        }
    }
    protected void Star2_Click(Object s, EventArgs e)
    {

    }
    protected void Star3_Click(Object s, EventArgs e)
    {

    }
    protected void Star4_Click(Object s, EventArgs e)
    {

    }
    protected void Star5_Click(Object s, EventArgs e)
    {

    }


</script>