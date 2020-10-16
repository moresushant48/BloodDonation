<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/banks/BloodBankSidebar.master" AutoEventWireup="true" CodeBehind="Bankboard.aspx.cs" Inherits="BloodDonation.Bankboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BloodBankSidebarContent" runat="server">

    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">

        <ItemTemplate>
            
            <div class="card my-3">
                
                <div class="card-body d-flex">
                    <div class="col-11">
                        <%#Eval("camp_address") %>
                    </div>
                    
                    <div class="col-1">
                        <asp:Button runat="server" ID="DeleteCamp" Text="Delete" CommandArgument='<%#Eval("id")%>' CommandName="deleteCamp" OnClick="DeleteCamp_Click"  CssClass="btn btn-red btn-block p-1" />
                    </div>    
                </div>

                <div class="card-footer d-flex text-center">
                    <div class="col-4">
                        Date :
                        <%#Eval("camp_date") %>
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
        
    </asp:ListView>

    <asp:DataPager ID="DataPager1" PagedControlID="ListView1" PageSize="4" runat="server">
        <Fields>
            <asp:NextPreviousPagerField ButtonCssClass="btn btn-cyan"/>
        </Fields>
    </asp:DataPager>
    


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:bloodConnectionString %>" 
        SelectCommand="SELECT * FROM [camps] WHERE bank_id = @bank_id">
        <SelectParameters>
            <asp:SessionParameter Name="bank_id" SessionField="bankId" />
        </SelectParameters>
    </asp:SqlDataSource>

    


</asp:Content>
