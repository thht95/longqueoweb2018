<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="TNTT.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        
           <%-- <%for (int i = 0; i < 10; i++) { %>--%>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            <br/>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            </asp:RadioButtonList>
           <%-- <%} %>--%>
        </div>
    </form>
</body>
</html>