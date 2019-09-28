<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentLogin.aspx.cs" Inherits="CourseRegistrationSystem.StudentLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Login</title>
    <link href="styles/monitorStyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <link href="styles/monitorStyle.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
    <header>Student Login</header>
    <form id="form1" runat="server">
<%--        <div class="navbar">
            <ul class="nav">
                <li class="nav-element">
                    <asp:Button ID="btnLogin" runat="server" Text="Login Page" OnClick="btnLogin_Click" />
                </li>
                <li>
                    <asp:Button ID="btnStudentLogin" runat="server" Text="Student Homepage" OnClick="btnStudentLogin_Click" />
                </li>
                <li class="nav-element">
                    <asp:Button ID="btnRegistration" runat="server" Text="Course Registration" OnClick="btnRegistration_Click" />
                </li>
                <li class="nav-element">
                    <asp:Button ID="btnRoster" runat="server" Text="View Roster" OnClick="btnRoster_Click" />
                </li>
            </ul>
        </div>--%>
        <div class="btn-group">
            <asp:Button ID="btnLogin" runat="server" Text="Login Page" OnClick="btnLogin_Click" CssClass="btn btn-default"/>
            <asp:Button ID="btnStudentLogin" runat="server" Text="Student Homepage" OnClick="btnStudentLogin_Click" CssClass="btn btn-default"/>
            <asp:Button ID="btnRegistration" runat="server" Text="Course Registration" OnClick="btnRegistration_Click" CssClass="btn btn-default"/>
            <asp:Button ID="btnRoster" runat="server" Text="View Roster" OnClick="btnRoster_Click" CssClass="btn btn-default"/>
        </div>
    </form>
</body>
</html>
