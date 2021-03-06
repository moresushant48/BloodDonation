﻿<%@ Page Title="Users" Language="C#" MasterPageFile="~/Sidebar.master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="BloodDonation.admin.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SidebarContent" runat="server">

    <ul class="nav nav-tabs" id="myTab" role="tablist">
      
        <li class="nav-item">
            <a class="nav-link active" id="donors-tab" data-toggle="tab" href="#donors" role="tab" aria-controls="donors"
                aria-selected="true">Donors</a>
        </li>

        <li class="nav-item">
            <a class="nav-link" id="banks-tab" data-toggle="tab" href="#banks" role="tab" aria-controls="banks"
                aria-selected="false">Bankers</a>
        </li>

    </ul>
    <div class="tab-content" id="myTabContent">
      
        <div class="tab-pane fade show active" id="donors" role="tabpanel" aria-labelledby="donors-tab">
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
                            <th>Actions</th>
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
                                    <td>
                                        <asp:Button runat="server" ID="DeleteUser" Text="Delete" CommandArgument='<%#Eval("id")%>' CommandName="deleteUser" OnClick="DeleteUser_Click" OnClientClick="javascript:return confirm('Are you sure to delete record?')" CssClass="btn btn-red btn-block p-1" />
                                    </td>
                                </tr>
                            </tbody>
            
                        </ItemTemplate>

                    </asp:ListView>
    
                    </table>

                    <asp:DataPager ID="DataPager1" PagedControlID="ListView1" PageSize="5" runat="server">
                    <Fields>
                        <asp:NumericPagerField CurrentPageLabelCssClass="border border-primary p-2 mx-2"/>
                    </Fields>
                </asp:DataPager>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bloodConnectionString %>" SelectCommand="SELECT u.id, [fname], [mname], [lname], [email], [mobno], [bgroup], [address], r.role_name FROM [users] u INNER JOIN roles r ON u.role_id = r.id WHERE r.role_name = 'DONOR' ORDER BY [id] DESC"></asp:SqlDataSource>
            
            </div>
        </div>

      <div class="tab-pane fade" id="banks" role="tabpanel" aria-labelledby="banks-tab">
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
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
        
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
                                    <td>
                                        <asp:Button runat="server" ID="DeleteUser" Text="Delete" CommandArgument='<%#Eval("id")%>' CommandName="deleteUser" OnClick="DeleteUser_Click" OnClientClick="javascript:return confirm('Are you sure to delete record?')" CssClass="btn btn-red btn-block p-1" />
                                    </td>
                                </tr>
                            </tbody>
            
                        </ItemTemplate>

                    </asp:ListView>
    
                    </table>

                    <asp:DataPager ID="DataPager2" PagedControlID="ListView2" PageSize="5" runat="server">
                    <Fields>
                        <asp:NumericPagerField CurrentPageLabelCssClass="border border-primary p-2 mx-2"/>
                    </Fields>
                </asp:DataPager>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:bloodConnectionString %>" SelectCommand="SELECT u.id, [fname], [mname], [lname], [email], [mobno], [bgroup], [address], r.role_name FROM [users] u INNER JOIN roles r ON u.role_id = r.id WHERE r.role_name = 'BANK' ORDER BY [id] DESC"></asp:SqlDataSource>
            
            </div>
      </div>
      
    </div>

    

</asp:Content>
