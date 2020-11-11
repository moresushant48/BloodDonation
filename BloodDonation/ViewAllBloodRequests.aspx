<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewAllBloodRequests.aspx.cs" Inherits="BloodDonation.ViewAllBloodRequests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="p-4">
        
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">

            <ItemTemplate>
                <div class="">
                    <div class="card my-3 text-center">
                
                        <div class="card-header d-flex text-center">
                            <div class="col-4 m-auto">
                                <i class="fa fa-phone text-success"></i>
                                <br />
                                <%# Eval("phone") %>
                        
                            </div>
                    
                            <div class="col-4 m-auto">
                                <i class="fa fa-tint text-primary"></i>
                                <br />
                                <%#Eval("blood") %>
                            </div>

                        </div>

                        <div class="card-body">
                            <i class="fa fa-user-alt text-danger"></i>
                            <br />
                            <%# String.Format("{0} {1} {2}",Eval("fname"), Eval("mname"), Eval("lname")) %>
                        </div
                    </div>
                </div>
            </ItemTemplate>
                    
            <EmptyDataTemplate>
                            
                    <p class="m-auto h3-responsive p-4 alert-danger text-center">No blood donation requests yet.</p>
                            
            </EmptyDataTemplate>

        </asp:ListView>

        <asp:DataPager ID="DataPager1" PagedControlID="ListView1" PageSize="4" runat="server">
            <Fields>
                <asp:NumericPagerField CurrentPageLabelCssClass="border border-primary p-2 mx-2"/>
            </Fields>
        </asp:DataPager>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bloodConnectionString %>" SelectCommand="SELECT * FROM [bloodreq] WHERE status = 'APPROVED'">
            
        </asp:SqlDataSource>

    </div>


</asp:Content>
