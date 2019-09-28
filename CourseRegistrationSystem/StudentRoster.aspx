<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentRoster.aspx.cs" Inherits="CourseRegistrationSystem.StudentRoster" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Roster</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <link href="styles/monitorStyle.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <style type="text/css">
    .gvStudentRoster { border-spacing: 3px; border-collapse: separate; }
    .gvStudentRoster > tbody > tr > th, 
    .gvStudentRoster > tbody > tr > td { border: 2px ridge black; padding: 3px; }

    .gvStudentNextRoster { border-spacing: 3px; border-collapse: separate; }
    .gvStudentNextRoster > tbody > tr > th, 
    .gvStudentNextRoster > tbody > tr > td { border: 2px ridge black; padding: 3px; }
  </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>View Roster</header>
        <br />
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
        <br />
        <br />
        <div id="viewStudent">
            <asp:Table runat="server" Visible="true">
                <asp:TableRow>
                    <asp:TableCell>Semester:</asp:TableCell>
                    <asp:TableCell>
                        <asp:DropdownList ID="ddlRosterSemester" runat="server" CssClass="btn">
                            <asp:ListItem Value="1" Text="Spring 2018"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Fall 2018"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Spring 2019"></asp:ListItem>
                        </asp:DropdownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnShowRoster" runat="server" Text="View Roster" OnClick="btnShowRoster_Click" CssClass="btn btn-basic"/>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Label ID="lblRosterMessage" runat="server"></asp:Label>
            <asp:GridView ID="gvStudentRoster" runat="server" Visible="False" DataKeyNames="CourseID,SectionID"
                 BackColor="White" BorderColor="#CC9966" BorderWidth="1px" CellPadding="4" BorderStyle="None"
                        CssClass="gvStudentRoster" GridLines="None" CellSpacing="-1">
                <Columns>
                    <asp:BoundField DataField="CRN" HeaderText="CRN" />
                    <asp:BoundField DataField="CourseTitle" HeaderText="Course Title" />
                    <asp:BoundField DataField="CourseDescription" HeaderText="Description" />
                    <asp:BoundField DataField="CreditHours" HeaderText="Credit Hours" />
                    <asp:BoundField DataField="DayCode" HeaderText="Days" />
                    <asp:BoundField DataField="TimeInterval" HeaderText="Time" />
                    <asp:BoundField DataField="ProfessorName" HeaderText="Professor" />
                    <asp:TemplateField HeaderText="Tuition">
                        <ItemTemplate>
                            <asp:Label ID="lblTuition" Text='<%# Convert.ToInt32(Eval("CreditHours")) * 1000 %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
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
            <asp:GridView ID="gvStudentNextRoster" runat="server" Visible="False" AutoGenerateColumns="False" DataKeyNames="CourseID,SectionID" ShowFooter="true"
                 BackColor="White" BorderColor="#CC9966" BorderWidth="1px" CellPadding="4" BorderStyle="None"
                        CssClass="gvStudentNextRoster" GridLines="None" CellSpacing="-1">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelected" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CRN" HeaderText="CRN" />
                    <asp:BoundField DataField="CourseTitle" HeaderText="Course Title" />
                    <asp:BoundField DataField="CourseDescription" HeaderText="Description" />
                    <asp:BoundField DataField="CreditHours" HeaderText="Credit Hours" />
                    <asp:BoundField DataField="DayCode" HeaderText="Days" />
                    <asp:BoundField DataField="TimeInterval" HeaderText="Time" />
                    <asp:BoundField DataField="ProfessorName" HeaderText="Professor" />
                    <asp:TemplateField HeaderText="Tuition">
                        <ItemTemplate>
                            <asp:Label ID="lblTuition" Text='<%# Convert.ToInt32(Eval("CreditHours")) * 1000 %>' runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:BoundField DataField="Tuition" HeaderText="Professor" />--%>
                </Columns>
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
            <asp:Button ID="btnDropClass" runat="server" Text="Drop Classes" Visible="false" OnClick="btnDropClass_Click" CssClass="btn btn-basic"/>
        </div>
    </form>
</body>
</html>
