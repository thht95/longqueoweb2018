<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Capnhat.aspx.cs" Inherits="TNTT.Capnhat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 182px;
        }
        .auto-style2 {
            width: 262px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="CẬP NHẬT VÀ CHỈNH SỬA CÂU HỎI"></asp:Label><table style="width: 100%;">
                <tr>
                    <td class="auto-style1">Nhập mã câu hỏi</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Tìm" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Câu hỏi</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" Text="Thêm mới" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Cập nhật câu hỏi</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Cập nhật" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="true" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5">
        </asp:GridView>
    </form>
</body>
</html>
