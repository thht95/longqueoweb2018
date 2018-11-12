<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="TNTT.admin" %> 

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 136px;
        }
        .auto-style2 {
            width: 135px;
        }
        .auto-style3 {
            width: 258px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lb1" runat="server"></asp:Label>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                 
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" Text="Kiểm tra" OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                 
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                 
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Thêm" OnClick="Button2_Click" />
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" OnPageIndexChanging="GridView2_PageIndexChanging" PageSize="2">
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Label ID="Label2" runat="server" Text="Thêm và cập nhật câu hỏi"></asp:Label>
        <table style="width: 100%;">
            <tr>
                <td class="auto-style2">Tìm kiếm</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button3_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True"  PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging">
        </asp:GridView>
    </form>
</body>
</html>
