<%@ Page Title="Users" Language="C#" MasterPageFile="~/Sidebar.master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="BloodDonation.admin.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SidebarContent" runat="server">

    <div class="m-2">
        <table class="table table-borderless">

        <thead class="bg-light">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Blood</th>
                <th>Address</th>
                <th>Role</th>
            </tr>
        </thead>

        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        
            <ItemTemplate>

                <tbody>
                    <tr>
                        <td><%#Eval("id") %></td>
                        <td><%# String.Format("{0} {1} {2}",Eval("fname"), Eval("mname"), Eval("lname")) %></td>
                        <td><%#Eval("email") %></td>
                        <td><%#Eval("mobno") %></td>
                        <td><%#Eval("bgroup") %></td>
                        <td><%#Eval("address") %></td>
                        <td><%#Eval("role_name") %></td>
                    </tr>
                </tbody>
            
            </ItemTemplate>

        </asp:ListView>
    
        </table>

        <asp:DataPager ID="DataPager1" PagedControlID="ListView1" PageSize="4" runat="server">
        <Fields>
            <asp:NextPreviousPagerField ButtonCssClass="btn btn-cyan"/>
        </Fields>
    </asp:DataPager>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bloodConnectionString %>" SelectCommand="SELECT [id], [fname], [mname], [lname], [email], [mobno], [bgroup], [address], r.role_name FROM [users] u INNER JOIN roles r ON u.role_id = r.role_id  ORDER BY [id] DESC"></asp:SqlDataSource>
    </div>

</asp:Content>
