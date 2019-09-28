<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentCourseRegistration.aspx.cs" Inherits="CourseRegistrationSystem.CourseRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Course Search</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <link href="styles/monitorStyle.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <style type="text/css">
    .gvSearchCourses { border-spacing: 3px; border-collapse: separate; }
    .gvSearchCourses > tbody > tr > th, 
    .gvSearchCourses > tbody > tr > td { border: 2px ridge black; padding: 3px; }

        .gvSearchRegister { border-spacing: 3px; border-collapse: separate; }
    .gvSearchRegister > tbody > tr > th, 
    .gvSearchRegister > tbody > tr > td { border: 2px ridge black; padding: 3px; }
  </style>

</head>
<body>
    <form id="form1" runat="server">
        <header>Course Search</header>
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
            <asp:Button ID="btnLogin" runat="server" Text="Login Page" OnClick="btnLogin_Click" CssClass="btn btn-default" />
            <asp:Button ID="btnStudentLogin" runat="server" Text="Student Homepage" OnClick="btnStudentLogin_Click" CssClass="btn btn-default" />
            <asp:Button ID="btnRegistration" runat="server" Text="Course Registration" OnClick="btnRegistration_Click" CssClass="btn btn-default" />
            <asp:Button ID="btnRoster" runat="server" Text="View Roster" OnClick="btnRoster_Click" CssClass="btn btn-default" />
        </div>
        <br />
        <br />
        <div id="content" class="container-fluid">
            <div class="col">
                <div class="col-lg-6=12">
                    <asp:Table runat="server">
                        <asp:TableHeaderRow>
                            <asp:TableHeaderCell>
                                Course Search
                            </asp:TableHeaderCell>
                        </asp:TableHeaderRow>
                        <asp:TableRow>
                            <asp:TableCell>Department:</asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="btn">
                                    <asp:ListItem Value="1" Text="CIS"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="PSY"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="MIS"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="PHYS"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="ARTU"></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Semester:</asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlSemester" runat="server" CssClass="btn">
                                    <asp:ListItem Value="0" Text="ALL SEMESTERS"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="SPRING2018"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="FALL2018"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="SPRING2019"></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Button ID="btnSearchCourses" Text="View Courses" runat="server" OnClick="btnSearchCourses_Click" CssClass="btn btn-basic"/>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <asp:GridView ID="gvSearchCourses" runat="server" Visible="False" 
                        BackColor="White" BorderColor="#CC9966" BorderWidth="1px" CellPadding="4" BorderStyle="None"
                        CssClass="gvSearchCourses" GridLines="None" CellSpacing="-1">
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#330099" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <SortedAscendingCellStyle BackColor="#FEFCEB" />
                        <SortedAscendingHeaderStyle BackColor="#AF0101" />
                        <SortedDescendingCellStyle BackColor="#F6F0C0" />
                        <SortedDescendingHeaderStyle BackColor="#7E0000" />
                    </asp:GridView>
                </div>
                <div class="col-lg-12">
                    <asp:Table runat="server">
                        <asp:TableHeaderRow>
                            <asp:TableHeaderCell>
                                Course Registration
                            </asp:TableHeaderCell>
                        </asp:TableHeaderRow>
                        <asp:TableRow>
                            <asp:TableCell>Department:</asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlDepartmentRegister" runat="server" CssClass="btn">
                                    <asp:ListItem Value="1" Text="CIS"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="PSY"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="MIS"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="PHYS"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="ARTU"></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Daycode:</asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlDayCode" runat="server" CssClass="btn">
                                    <asp:ListItem Value="MWF" Text="MWF"></asp:ListItem>
                                    <asp:ListItem Value="TR" Text="TR"></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Search for courses:
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button ID="btnSearchRegister" Text="Confirm" runat="server" OnClick="btnSearchRegister_Click" CssClass="btn btn-basic"/>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblRegisterMessage" runat="server"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <asp:GridView ID="gvSearchRegister" runat="server" Visible="False" AutoGenerateColumns="False" DataKeyNames="CourseID,SectionID,DayCode,TimeInterval" OnRowDataBound="gvSearchRegister_RowDataBound" 
                        OnRowCreated="gvSearchRegister_RowCreated"
                        BackColor="White" BorderColor="#CC9966" BorderWidth="1px" CellPadding="4" BorderStyle="None"
                        CssClass="gvSearchRegister" GridLines="None" CellSpacing="-1">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelected" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblOpenOrClosed" Text="Open" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CRN" HeaderText="CRN" />
                            <asp:BoundField DataField="CourseTitle" HeaderText="Course Title" />
                            <asp:BoundField DataField="CourseDescription" HeaderText="Description" />
                            <asp:BoundField DataField="NumberOfSeatsAvailable" HeaderText="Seats Available" />
                            <asp:BoundField DataField="MaximumSeats" HeaderText="Maximum Seats" />
                            <asp:BoundField DataField="CreditHours" HeaderText="Credit Hours" />
                            <asp:BoundField DataField="DayCode" HeaderText="Days" />
                            <asp:BoundField DataField="TimeInterval" HeaderText="Time" />
                            <asp:BoundField DataField="ProfessorName" HeaderText="Professor" />
                        </Columns>
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#330099" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <SortedAscendingCellStyle BackColor="#FEFCEB" />
                        <SortedAscendingHeaderStyle BackColor="#AF0101" />
                        <SortedDescendingCellStyle BackColor="#F6F0C0" />
                        <SortedDescendingHeaderStyle BackColor="#7E0000" />
                    </asp:GridView>
                    <asp:Button ID="btnRegister" Text="Confirm" runat="server" OnClick="btnRegister_Click" Visible="False" CssClass="btn btn-basic"/>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
