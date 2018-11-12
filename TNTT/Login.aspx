<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TNTT.Login" %> 

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .content{
				width:700px;
				height:500px;
				color:black;
				text-align:center;
                margin:0 auto;
                
			}
        .main{
				width:100%;
			}
        .menu{
				width:100%;
				height:50px;
				text-align:center;
				line-height:50px;
				background-color:#273D47;
				color:white;
			}
        ul{
				list-style-type:none;
			}
        .auto-style2 {
            width: 450px;
            height:100px;
			color:black;
			text-align:center;
            margin:0 auto;
          
        }
        .auto-style3 {
            width: 245px;
        }
        .auto-style4 {
            width: 204px;
        }
        li{
				font-size:20px;
				display:inline;
				margin-right:30px;
			}
        .auto-style6 {
            width: 245px;
            height: 36px;
        }
        .auto-style7 {
            width: 204px;
            height: 36px;
        }
        .auto-style8 {
            width: 140px;
        }
        .auto-style9 {
            width: 140px;
            height: 36px;
        }

        a{
            text-decoration:none;
            color:white;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div class='main'>
     <div class='menu'>
				<ul>
					<li><a href='#'>Đăng Nhập<a></li>
					<li><a href='#'>Quy Định<a></li>
					<li><a href='#'>Liên Hệ<a></li>
				</ul>
			</div>
        <div class="content">
            <table class="auto-style2"> 
                <tr>
                    <td class="auto-style8">Tên đăng nhập: </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">Mật khẩu: </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9"></td>
                    <td class="auto-style6">
                        <asp:Button ID="Button1" runat="server" Text="Đăng nhập" OnClick="Button1_Click" />
                        <asp:Button ID="Button2" runat="server" Text="Đăng ký" OnClick="Button2_Click" />
                    </td>
                    <td class="auto-style7">&nbsp;</td> 
                </tr>
            </table>
        </div>
            </div>
    </form>
</body>
</html>
