<%@ Page Title="Camps" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewAllCamps.aspx.cs" Inherits="BloodDonation.ViewAllCamps" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="p-4">

        <div class="text-right mt-2">
            <i class="fa fa-square text-white border border-success"></i> Upcoming
            <i class="fa fa-square text-white border border-danger"></i> Finished
        </div>

        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">

            <ItemTemplate>
            
                <div class="card my-3 <%# checkIsOld(Eval("camp_date")) %>">
                
                    <div class="card-body d-flex">
                    
                        <div class="col-11">
                            <%#Eval("camp_address") %>
                        </div>
                    
                        <div class="col-1">
                            <% if (Session["loggedIn"] != null)
                                        { %>
                            <asp:Button runat="server" ID="DeleteCamp" Text="Attend" CommandArgument='<%#Eval("id")%>' CommandName="attend" OnClick="btnAttend_Click" CssClass="btn btn-red btn-block p-1" />
                            <% } %>
                        </div> 
     
                    </div>

                    <div class="card-footer d-flex text-center">
                        <div class="col-4">
                            Date :
                            <%# convertToIndianDate(Eval("camp_date")) %>
                        </div>
                    
                        <div class="col-4">
                            Expected Visitors : 
                            <%#Eval("visitors") %>
                        </div>

                        <div class="col-4">
                            Time : 
                            <%#Eval("camp_time") %>
                        </div>
                    </div>
                </div>

            </ItemTemplate>
                    
            <EmptyDataTemplate>
                            
                    <p class="m-auto h3-responsive p-4 alert-danger text-center">No upcoming blood donation camps found.<br />You can always come back.</p>
                            
            </EmptyDataTemplate>

        </asp:ListView>

        <asp:DataPager ID="DataPager1" PagedControlID="ListView1" PageSize="4" runat="server">
            <Fields>
                <asp:NumericPagerField CurrentPageLabelCssClass="border border-primary p-2 mx-2"/>
            </Fields>
        </asp:DataPager>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bloodConnectionString %>" SelectCommand="SELECT * FROM [camps] WHERE camp_date > @todays_date">
            <SelectParameters>
                <asp:Parameter Name="todays_date" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>

</asp:Content>
