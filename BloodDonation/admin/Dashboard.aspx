<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Sidebar.master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="BloodDonation.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SidebarContent" runat="server">
    
    <div class="m-auto">

        <div style="height:200px" class="w-100 aqua-gradient py-3 mt-3">

           <div class="container text-white">
               <h1 class="display-3">Dashboard<asp:Label ID="lblName" runat="server"></asp:Label></h1>
               <p class="lead">You can see site details and contributions.</p>
           </div>

            <div class="container">

                <div class="card">

                    <div class="d-md-flex text-center">

                        <div class="p-4 col-md-4 d-flex">
                            <div class="m-auto">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="donors" HeaderStyle-CssClass="card-header p-4" HeaderText="Total Donors" ItemStyle-CssClass="text-center h3-responsive p-4" ReadOnly="True" SortExpression="donors" />
                                    </Columns>
                                </asp:GridView>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bloodConnectionString %>" SelectCommand="SELECT COUNT(id) AS donors FROM users"></asp:SqlDataSource>
                            </div>
                        </div>

                        <div class="p-4 col-md-4 d-flex">
                            <div class="m-auto">
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                                    <Columns>
                                        <asp:BoundField DataField="camps" HeaderStyle-CssClass="card-header p-4" HeaderText="Total Camps" ItemStyle-CssClass="text-center h3-responsive p-4" ReadOnly="True" SortExpression="camps" />
                                    </Columns>
                                </asp:GridView>

                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:bloodConnectionString %>" SelectCommand="SELECT COUNT(id) AS camps FROM camps"></asp:SqlDataSource>
                            </div>
                        </div>

                        <div class="p-4 col-md-4 d-flex">
                            <div class="m-auto">
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                                    <Columns>
                                        <asp:BoundField DataField="banks" HeaderStyle-CssClass="card-header p-4" HeaderText="Total Banks" ItemStyle-CssClass="text-center h3-responsive p-4" ReadOnly="True" SortExpression="banks" />
                                    </Columns>
                                </asp:GridView>

                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:bloodConnectionString %>" SelectCommand="SELECT COUNT(id) AS banks FROM bloodbanks"></asp:SqlDataSource>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>

    </div>

</asp:Content>