<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CourseRegistrationSystem.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Homepage</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <link href="styles/monitorStyle.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <header>Login</header>
<%--        <div class="navbar">
            <ul class="nav">
                <li class="nav-element">
                    <asp:Button ID="btnLogin" runat="server" Text="Login Page" OnClick="btnLogin_Click" CssClass="btn-link" />
                </li>
            </ul>
        </div>--%>
        <div class="btn-group btn-group-lg">
            <asp:Button ID="btnLogin" runat="server" Text="Login Page" OnClick="btnLogin_Click" CssClass="btn btn-default" />
        </div>
        <br />
        <div id="content" class="container-fluid">
            <div class="row">
                <div class="col-md-6">
                    Select this button if you are an administrator.<br />
                    <asp:Button ID="btnAdminLogin" Text="Enter As Admin" runat="server" OnClick="btnAdminLogin_Click" CssClass="btn btn-primary"/>
                </div>
                <div class="col-md-6">
                    Enter your student ID if you are a student.<br />
                    <asp:TextBox ID="txtStudentIDLogin" runat="server"></asp:TextBox>
                    <asp:Label ID="lblModifyMessage" runat="server"></asp:Label>
                <asp:Button ID="btnStudentLogin" Text="Enter As Student" runat="server" OnClick="btnStudentLogin_Click" CssClass="btn btn-primary"/>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
