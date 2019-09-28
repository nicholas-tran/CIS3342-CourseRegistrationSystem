<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifySection.aspx.cs" Inherits="CourseRegistrationSystem.ModifySection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Modify Section</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <link href="styles/monitorStyle.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <style type="text/css">
    .gvSections { border-spacing: 3px; border-collapse: separate; }
    .gvSections > tbody > tr > th, 
    .gvSections > tbody > tr > td { border: 2px ridge black; padding: 3px; }
  </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>Modify Course</header>
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
        <div class="container-fluid" id="ModifySection">
            <div class="row">
                <div class="col-lg-6">
                    Select course to modify section:
                        <asp:DropDownList ID="ddlSelectCourse" runat="server" CssClass="btn">
                        </asp:DropDownList>
                    <asp:Button ID="btnBeginModifySection" runat="server" Text="Show Sections" OnClick="btnBeginModifySection_Click" CssClass="btn btn-basic"/>
                    <asp:Label ID="lblModifySectionMessage" runat="server"></asp:Label>
                    <asp:GridView ID="gvSections" runat="server" Visible="False" AutoGenerateColumns="False"
                        DataKeyNames="SectionID,DayCode" OnRowDeleting="gvSections_RowDeleting" OnRowEditing="gvSections_RowEditing"
                        OnRowUpdating="gvSections_RowUpdating" OnRowCancelingEdit="gvSections_RowCancelingEdit" OnRowDataBound="gvSections_RowDataBound" 
                        BackColor="White" BorderColor="#CC9966" BorderWidth="1px" CellPadding="4" BorderStyle="None"
                        CssClass="gvSections" GridLines="None" CellSpacing="-1">
                        <Columns>
                            <asp:BoundField DataField="SectionID" HeaderText="Section ID" ReadOnly="true" />
                            <asp:BoundField DataField="NumberOfSeatsAvailable" HeaderText="Seats Available" ReadOnly="true" />
                            <asp:BoundField DataField="MaximumSeats" HeaderText="Maximum Seats" ReadOnly="true" />
                            <%--<asp:BoundField DataField="DayCode" HeaderText="Day Code" />--%>
                            <asp:TemplateField HeaderText="DayCode">
                                <ItemTemplate>
                                    <asp:Label ID="lblDayCode" runat="server" Text='<%# Eval("DayCode") %>' Visible="True" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlDayCode" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:BoundField DataField="TimeInterval" HeaderText="Time" />--%>
                            <asp:TemplateField HeaderText="Time">
                                <ItemTemplate>
                                    <asp:Label ID="lblTimeInterval" runat="server" Text='<%# Eval("TimeInterval") %>' Visible="True" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlTimeInterval" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:BoundField DataField="ProfessorID" HeaderText="Professor ID" />--%>
                            <asp:TemplateField HeaderText="Professor ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblProfessorID" runat="server" Text='<%# Eval("ProfessorID") %>' Visible="True" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlProfessorID" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CRN" HeaderText="CRN" ReadOnly="true" />
                            <%--                            <asp:BoundField DataField="SemesterID" HeaderText="SemesterID" />--%>
                            <asp:TemplateField HeaderText="SemesterID">
                                <ItemTemplate>
                                    <asp:Label ID="lblSemesterID" runat="server" Text='<%# Eval("SemesterID") %>' Visible="True" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlSemesterID" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" ButtonType="Button" >
                            <ControlStyle CssClass="btn btn-warning" />
                            </asp:CommandField>
                            <asp:CommandField ShowDeleteButton="true" ButtonType="Button" >
                            <ControlStyle CssClass="btn btn-danger" />
                            </asp:CommandField>
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
                </div>
                <div class="col-lg-6">
                    Select course to add section for:<asp:DropDownList ID="ddlSelectCourseAdd" runat="server" CssClass="btn">
                    </asp:DropDownList>
                    <asp:Button ID="btnCreateSection" runat="server" Text="Create New Section" OnClick="btnCreateSection_Click" CssClass="btn btn-basic" />
                    <asp:Table ID="tblCreateSection" runat="server" Visible="false">
                        <asp:TableRow>
                            <asp:TableCell>
                            Choose a DayCode:
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlAddDayCode" runat="server" CssClass="btn">
                                    <asp:ListItem Value="MWF" Text="Mon, Wed, Fri" runat="server" />
                                    <asp:ListItem Value="TR" Text="Tue, Thur" runat="server" />
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                            Choose a Time:
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlAddTime" runat="server" CssClass="btn">
                                    <asp:ListItem Value="08:00:00-10:00:00" Text="08:00:00-10:00:00" runat="server" />
                                    <asp:ListItem Value="11:00:00-13:00:00" Text="11:00:00-13:00:00" runat="server" />
                                    <asp:ListItem Value="14:00:00-16:00:00" Text="14:00:00-16:00:00" runat="server" />
                                    <asp:ListItem Value="17:00:00-19:00:00" Text="17:00:00-19:00:00" runat="server" />
                                    <asp:ListItem Value="20:00:00-22:00:00" Text="20:00:00-22:00:00" runat="server" />
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                            Choose a Professor:
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlAddProfessor" runat="server" CssClass="btn">
                                    <asp:ListItem Value="1" Text="CIS Professor" runat="server" />
                                    <asp:ListItem Value="2" Text="PHYS Professor" runat="server" />
                                    <asp:ListItem Value="3" Text="MIS Professor" runat="server" />
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                    Enter a CRN:
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtAddCRN" runat="server" MaxLength="5"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                            Choose a Semester:
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlAddSemesterID" runat="server" CssClass="btn">
                                    <asp:ListItem Value="1" Text="SPRING 2018" runat="server" />
                                    <asp:ListItem Value="2" Text="FALL 2018" runat="server" />
                                    <asp:ListItem Value="3" Text="SPRING 2019" runat="server" />
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Button ID="btnCreateSectionEnd" Text="Confirm" runat="server" OnClick="btnCreateSectionEnd_Click" CssClass="btn btn-basic"/>
                            </asp:TableCell>
                                                        <asp:TableCell>
                                <asp:Button ID="btnCancelSection" Text="Cancel" runat="server" OnClick="btnCancelSection_Click" CssClass="btn btn-basic"/>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblCreateSectionMessage" runat="server"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
