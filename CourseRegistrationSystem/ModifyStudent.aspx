<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyStudent.aspx.cs" Inherits="CourseRegistrationSystem.ModifyStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Homepage</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <link href="styles/monitorStyle.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script></head>
        <style type="text/css">
    .gvCreatedStudent { border-spacing: 3px; border-collapse: separate; }
    .gvCreatedStudent > tbody > tr > th, 
    .gvCreatedStudent > tbody > tr > td { border: 2px ridge black; padding: 3px; }
  </style>
<body>
    <form id="form1" runat="server">
        <header>Modify Students</header>
<%--        <div class="navbar">
            <ul class="nav">
                <li class="nav-element">
                    <asp:Button ID="btnLogin" runat="server" Text="Login Page" OnClick="btnLogin_Click" />
                </li>
                <li>
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
            <asp:Button ID="btnLogin" runat="server" Text="Login Page" OnClick="btnLogin_Click" CssClass="btn btn-default"/>
            <asp:Button ID="btnAdminLogin" runat="server" Text="Admin Homepage" OnClick="btnAdminLogin_Click" CssClass="btn btn-default"/>
            <asp:Button ID="btnManageStudent" runat="server" Text="Add Student" OnClick="btnManageStudent_Click" CssClass="btn btn-default"/>
            <asp:Button ID="btnManageCourse" runat="server" Text="Modify Course" OnClick="btnManageCourse_Click" CssClass="btn btn-default"/>
            <asp:Button ID="btnManageSection" runat="server" Text="Modify Section" OnClick="btnManageSection_Click" CssClass="btn btn-default"/>
            <asp:Button ID="btnManagePrerequisite" runat="server" Text="Modify Prerequisite" OnClick="btnManagePrerequisite_Click" CssClass="btn btn-default"/>
        </div>
        <br />
        <br />
        <div id="addStudent">
            <asp:Button ID="btnManageStudentStart" runat="server" Text="Create Student" OnClick="btnManageStudentStart_Click" CssClass="btn btn-basic"/>
            <asp:Table ID="tblCreateStudent" runat="server" Visible="false">
                <asp:TableRow>
                    <asp:TableCell>Enter an Student ID:</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtStudentID" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Enter a Name:</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Enter a Major:</asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlMajor" runat="server" CssClass="btn">
                            <asp:ListItem Value="1">CIS</asp:ListItem>
                            <asp:ListItem Value="2">PSY</asp:ListItem>
                            <asp:ListItem Value="3">MIS</asp:ListItem>
                            <asp:ListItem Value="4">PHYS</asp:ListItem>
                            <asp:ListItem Value="5">ARTU</asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblModifyMessage" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnManageStudentEnd" runat="server" Text="Add Student" OnClick="btnManageStudentEnd_Click" CssClass="btn btn-basic" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:GridView ID="gvCreatedStudent" runat="server" Visible="False" 
                BackColor="White" BorderColor="#CC9966" BorderWidth="1px" CellPadding="4" BorderStyle="None" CssClass="gvCreatedStudent">
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#a41e35" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
