<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyPrerequisite.aspx.cs" Inherits="CourseRegistrationSystem.ModifyPrerequisite" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Modify Prerequisite</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <link href="styles/monitorStyle.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <header>Modify Prerequisite</header>
<%--        <div class="navbar">
            <ul class="nav">
                <li class="nav-element">
                    <asp:Button ID="btnLogin" runat="server" Text="Login Page" OnClick="btnLogin_Click" CssClass="btn btn-default" />
                </li>
                <li>
                    <asp:Button ID="btnAdminLogin" runat="server" Text="Admin Homepage" OnClick="btnAdminLogin_Click" CssClass="btn btn-default" />
                </li>
                <li class="nav-element">
                    <asp:Button ID="btnManageStudent" runat="server" Text="Add Student" OnClick="btnManageStudent_Click" CssClass="btn btn-default" />
                </li>
                <li class="nav-element">
                    <asp:Button ID="btnManageCourse" runat="server" Text="Modify Course" OnClick="btnManageCourse_Click" CssClass="btn btn-default" />
                </li>
                <li class="nav-element">
                    <asp:Button ID="btnManageSection" runat="server" Text="Modify Section" OnClick="btnManageSection_Click" CssClass="btn btn-default" />
                </li>
                <li class="nav-element">
                    <asp:Button ID="btnManagePrerequisite" runat="server" Text="Modify Prerequisite" OnClick="btnManagePrerequisite_Click" CssClass="btn btn-default" />
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
        <br />
        <br />
        <div class="container-fluid" id="AddPrerequisite">
            <div class="row">
                <div class="col-lg-12">
                    Select course to add prerequisite:
                        <asp:DropDownList ID="ddlSelectCoursePrerequisite" runat="server" CssClass="btn">
                        </asp:DropDownList>
                    <asp:Button ID="btnBeginAddPrerequisite" runat="server" Text="Show Prerequisite Courses" OnClick="btnBeginAddPrerequisite_Click" CssClass="btn btn-basic"/>
                    <asp:Table ID="tblAddPrerequisite" runat="server" Visible="false">
                        <asp:TableRow>
                            <asp:TableCell>Choose course as prerequisite:</asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlCourseAsPrerequisite" runat="server" CssClass="btn"></asp:DropDownList></asp:TableCell>
                            <asp:TableCell>
                                <asp:Button ID="btnAddPrerequisite" Text="Confirm" runat="server" OnClick="btnAddPrerequisite_Click" CssClass="btn btn-basic"/></asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblAddPrerequisiteMessage" runat="server"></asp:Label></asp:TableCell>
                            <asp:TableCell>
                                <asp:Button ID="btnCancelPrerequisite" Text="Cancel" runat="server" OnClick="btnCancelPrerequisite_Click" CssClass="btn btn-basic"/></asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
