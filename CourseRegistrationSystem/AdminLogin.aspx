<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="CourseRegistrationSystem.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <link href="styles/monitorStyle.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>

    <form id="form1" runat="server">
        <header>Admin Login</header>
<%--        <div class="navbar">
            <ul class="nav">
                <li class="nav-element">
                    <asp:Button ID="btnLogin" runat="server" Text="Login Page" OnClick="btnLogin_Click" />
                </li>
                <li class="nav-element">
                    <asp:Button ID="btnAdminLogin" runat="server" Text="Admin Homepage" OnClick="btnAdminLogin_Click" />
                </li>
                <li class="nav-element">
                    <asp:Button ID="btnManageStudent" runat="server" Text="Add Student" OnClick="btnManageStudent_Click" />
                </li>
                <li class="nav-element">
                    <asp:Button ID="btnManageCourse" runat="server" Text="Modify Course" OnClick="btnManageCourse_Click" />
                </li>
                <li class="nav-element">
                    <asp:Button ID="btnManageSection" runat="server" Text="Modify Section" OnClick="btnManageSection_Click" />
                </li>
                <li class="nav-element">
                    <asp:Button ID="btnManagePrerequisite" runat="server" Text="Modify Prerequisite" OnClick="btnManagePrerequisite_Click" />
                </li>
            </ul>
        </div>--%>
        <div class="btn-group btn-group-lg">
            <asp:Button ID="btnLogin" runat="server" Text="Login Page" OnClick="btnLogin_Click" CssClass="btn btn-default" />
            <asp:Button ID="btnAdminLogin" runat="server" Text="Admin Homepage" OnClick="btnAdminLogin_Click" CssClass="btn btn-default" />
            <asp:Button ID="btnManageStudent" runat="server" Text="Add Student" OnClick="btnManageStudent_Click" CssClass="btn btn-default" />
            <asp:Button ID="btnManageCourse" runat="server" Text="Modify Course" OnClick="btnManageCourse_Click" CssClass="btn btn-default" />
            <asp:Button ID="btnManageSection" runat="server" Text="Modify Section" OnClick="btnManageSection_Click" CssClass="btn btn-default" />
            <asp:Button ID="btnManagePrerequisite" runat="server" Text="Modify Prerequisite" OnClick="btnManagePrerequisite_Click" CssClass="btn btn-default" />
        </div>
    </form>
</body>
</html>
