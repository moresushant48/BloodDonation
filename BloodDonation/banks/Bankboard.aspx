<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/banks/BloodBankSidebar.master" AutoEventWireup="true" CodeBehind="Bankboard.aspx.cs" Inherits="BloodDonation.Bankboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BloodBankSidebarContent" runat="server">

    <div style="height:200px" class="w-100 aqua-gradient py-3 mt-3">

           <div class="container text-white">
               <h1 class="display-3">Dashboard<asp:Label ID="lblName" runat="server"></asp:Label></h1>
               <p class="lead">You can see camp details and other stuffs.</p>
           </div>

            <div class="container">

                <div class="card">

                    <div class="d-md-flex text-center">

                        <div class="p-4 col d-flex">
                            <div class="m-auto">
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
                        </div>

                    </div>
            </div>

        </div>

    </div>

</asp:Content>
