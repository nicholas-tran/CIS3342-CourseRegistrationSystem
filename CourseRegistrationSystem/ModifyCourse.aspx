<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyCourse.aspx.cs" Inherits="CourseRegistrationSystem.ModifyCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Modify Course</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <link href="styles/monitorStyle.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <style type="text/css">
    .gvCourses { border-spacing: 3px; border-collapse: separate; }
    .gvCourses > tbody > tr > th, 
    .gvCourses > tbody > tr > td { border: 2px ridge black; padding: 3px; }
  </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>Modify Course</header>
       <%-- <div class="navbar">
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
        <div class="container-fluid" id="ModifyCourse">
            <div class="row">
                <div class="col-lg-6">
                    <asp:Button ID="btnBeginModifyCourse" runat="server" Text="Show Courses" OnClick="btnBeginModifyCourse_Click" CssClass="btn btn-basic" />
                    <asp:Label ID="lblModifyCourseMessage" runat="server"></asp:Label>
                    <asp:GridView ID="gvCourses" runat="server" Visible="False" AutoGenerateColumns="False" DataKeyNames="CourseID,CreditHours,DepartmentID"
                        OnRowDeleting="gvCourses_RowDeleting" OnRowEditing="gvCourses_RowEditing"
                        OnRowUpdating="gvCourses_RowUpdating" OnRowCancelingEdit="gvCourses_RowCancelingEdit" OnRowDataBound="gvCourses_RowDataBound" 
                        BackColor="White" BorderColor="#CC9966" BorderWidth="1px" CellPadding="4" BorderStyle="None"
                        CssClass="gvCourses" GridLines="None" CellSpacing="-1">
                        <Columns>
                            <asp:BoundField DataField="CourseID" HeaderText="Course ID" ReadOnly="true" />
                            <asp:BoundField DataField="CourseTitle" HeaderText="Course Title" />
                            <%--<asp:BoundField DataField="CreditHours" HeaderText="Credit Hours" />--%>
                            <asp:TemplateField HeaderText="CreditHours">
                                <ItemTemplate>
                                    <asp:Label ID="lblCreditHours" runat="server" Text='<%# Eval("CreditHours") %>' Visible="True" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlCreditHours" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:BoundField DataField="DepartmentID" HeaderText="Department ID" />--%>
                            <asp:TemplateField HeaderText="DepartmentID">
                                <ItemTemplate>
                                    <asp:Label ID="lblDepartmentID" runat="server" Text='<%# Eval("DepartmentID") %>' Visible="True" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlDepartmentID" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CourseDescription" HeaderText="Course Description" />
                            <asp:CommandField ShowEditButton="True" ButtonType="Button">
                            <ControlStyle CssClass="btn btn-warning" />
                            </asp:CommandField>
                            <asp:CommandField ShowDeleteButton="true" ButtonType="Button" >
                            <ControlStyle CssClass="btn btn-danger" />
                            </asp:CommandField>
                        </Columns>
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <HeaderStyle BackColor="#a41e35" Font-Bold="True" ForeColor="#FFFFCC" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Right" BackColor="White" ForeColor="#330099"></RowStyle>
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <SortedAscendingCellStyle BackColor="#FEFCEB" />
                        <SortedAscendingHeaderStyle BackColor="#AF0101" />
                        <SortedDescendingCellStyle BackColor="#F6F0C0" />
                        <SortedDescendingHeaderStyle BackColor="#7E0000" />
                    </asp:GridView>
                </div>
                <div class="col-lg-6">
                    <asp:Button ID="btnCreateCourse" runat="server" Text="Create New Course" OnClick="btnCreateCourse_Click" CssClass="btn btn-basic" />
                    <asp:Table ID="tblCreateCourse" runat="server" Visible="false" BorderColor="Black" BorderStyle="Solid" GridLines="Both">
                        <asp:TableRow>
                            <asp:TableCell>
                            Enter Course Title:
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtAddCourseTitle" runat="server" MaxLength="4"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                            Enter Credit Hours:
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlAddCreditHours" runat="server" CssClass="btn">
                                    <asp:ListItem Value="1" Text="1" runat="server" />
                                    <asp:ListItem Value="2" Text="2" runat="server" />
                                    <asp:ListItem Value="3" Text="3" runat="server" />
                                    <asp:ListItem Value="4" Text="4" runat="server" />
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                            Enter Department ID:
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlAddDepartmentID" runat="server" CssClass="btn">
                                    <asp:ListItem Value="1" Text="CIS" runat="server" />
                                    <asp:ListItem Value="2" Text="PHYS" runat="server" />
                                    <asp:ListItem Value="3" Text="MIS" runat="server" />
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                            Enter Course Description:
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtAddCourseDescription" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Button ID="btnCreateCourseEnd" Text="Confirm" runat="server" OnClick="btnCreateCourseEnd_Click" CssClass="btn btn-basic" />
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button ID="btnCancelCourse" Text="Cancel" runat="server" OnClick="btnCancelCourse_Click" CssClass="btn btn-basic" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblCreateCourseMessage" runat="server"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
