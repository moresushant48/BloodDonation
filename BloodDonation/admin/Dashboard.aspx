<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Sidebar.master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="BloodDonation.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SidebarContent" runat="server">
    
    <div class="p-4">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="donors" HeaderStyle-CssClass="alert-success p-4" HeaderText="Total Donors" ItemStyle-CssClass="text-center border border-success h3-responsive p-4 text-" ReadOnly="True" SortExpression="donors" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bloodConnectionString %>" SelectCommand="SELECT COUNT(id) AS donors FROM users"></asp:SqlDataSource>
    </div>

</asp:Content>