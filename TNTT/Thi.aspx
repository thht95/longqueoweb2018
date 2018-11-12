<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Thi.aspx.cs" Inherits="TNTT.Display" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" method="post">
        <div>
    <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">
        <ItemTemplate>
          
            <input type="hidden" name='<%# Eval("iMacauhoi") %>' value='<%# Eval("iMacauhoi") %>'/>
            <asp:Label ID="Label1" runat="server" Text='<%#Eval("sCauhoi") %>' CssClass='<%# Eval("iDapan") %>'></asp:Label>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" ></asp:RadioButtonList>
        </ItemTemplate>
    </asp:DataList>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
           
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
           
        </div>
    </form>
</body>
</html>
