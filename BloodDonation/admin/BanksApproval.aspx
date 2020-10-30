<%@ Page Title="" Language="C#" MasterPageFile="~/Sidebar.master" AutoEventWireup="true" CodeBehind="BanksApproval.aspx.cs" Inherits="BloodDonation.admin.BanksApproval" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SidebarContent" runat="server">
    
    <div class="m-2">
                <table class="table table-borderless">

                    <thead class="bg-light">
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>Mobile</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        
                        <ItemTemplate>

                            <tbody>
                                <tr>
                                    <td><%#Eval("id") %></td>
                                    <td><%#Eval("bank_name") %></td>
                                    <td><%#Eval("bank_address") %></td>
                                    <td><%#Eval("email") %></td>
                                    <td><%#Eval("mobno") %></td>
                                    <td><%#Eval("status") %></td>
                                    <td>
                                        <asp:Button runat="server" ID="Approve" Text="Approve" CommandArgument='<%#Eval("user_id")%>' CommandName="approve" OnClick="Approve_Click" CssClass="btn btn-green btn-block p-1" />
                                        <asp:Button runat="server" ID="Deny" Text="Deny" CommandArgument='<%#Eval("user_id")%>' CommandName="deny" OnClick="Deny_Click" CssClass="btn btn-red btn-block p-1" />
                                    </td>
                                </tr>
                            </tbody>
            
                        </ItemTemplate>

                    </asp:ListView>
    
                    </table>

                    <asp:DataPager ID="DataPager1" PagedControlID="ListView1" PageSize="4" runat="server">
                    <Fields>
                        <asp:NumericPagerField CurrentPageLabelCssClass="border border-primary p-2 mx-2"/>
                    </Fields>
                </asp:DataPager>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bloodConnectionString %>" SelectCommand="SELECT b.id, [bank_name], [bank_address], u.email, u.mobno, [status], b.user_id FROM bloodbanks b INNER JOIN users u ON (u.id=b.user_id)"></asp:SqlDataSource>
            
            </div>

</asp:Content>