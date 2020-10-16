<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/banks/BloodBankSidebar.master" AutoEventWireup="true" CodeBehind="Bankboard.aspx.cs" Inherits="BloodDonation.Bankboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BloodBankSidebarContent" runat="server">

    <div class="p-4">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="camps" HeaderStyle-CssClass="alert-success p-4" HeaderText="Total Camps" ItemStyle-CssClass="text-center border border-success h3-responsive p-4 text-" ReadOnly="True" SortExpression="camps" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bloodConnectionString %>" SelectCommand="SELECT COUNT(id) AS camps FROM camps WHERE bank_id = @bank_id" >
        <SelectParameters>
            <asp:SessionParameter Name="bank_id" SessionField="bankId" />
        </SelectParameters>

    </asp:SqlDataSource>
    </div>

</asp:Content>
