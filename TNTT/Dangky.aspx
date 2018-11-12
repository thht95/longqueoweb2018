<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dangky.aspx.cs" Inherits="TNTT.Dangky" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 141px;
        }
        .auto-style2 {
            width: 279px;
        }
        .auto-style3 {
            width: 141px;
            height: 26px;
        }
        .auto-style4 {
            width: 279px;
            height: 26px;
        }
        .auto-style5 {
            height: 26px;
        }
    </style>
</head>
    <script>
        function hoi() {
            var hoi = confirm("Bạn đã chắc chắn chưa?");  
        }
    </script>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1">Tên đăng nhập</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Không được để trống tên đăng nhập">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="RegularExpressionValidator" ValidationExpression="^\w\w\w(1|2)$"></asp:RegularExpressionValidator>
                       
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Mật khẩu</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Không được để trống mật khẩu">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Nhập lại mật khẩu</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Bạn chưa nhập lại mật khẩu">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" ErrorMessage="Pass không giống nhau">*</asp:CompareValidator>
                    </td>
                </tr>
                
                 <tr>
                    <td class="auto-style3">Email</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                     </td>
                    <td class="auto-style5">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="Không được để trống email">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox5" ErrorMessage="RegularExpressionValidator" ValidationExpression="\b[\w\.-]+@([^yahoo].)[\w\.-]+\.\w*\b"></asp:RegularExpressionValidator>

                     </td>
                </tr>
                
                 <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">
                      
                        <asp:Button ID="Button1" runat="server" Text="Đăng ký" OnClientClick="hoi()" OnClick="Button1_Click" />
                        <asp:Button ID="Button2" runat="server" Text="Hủy" Width="75px" OnClick="Button2_Click" />
                      
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    </form>
</body>
</html>
