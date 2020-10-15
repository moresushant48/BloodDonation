<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BecomeBank.aspx.cs" Inherits="BloodDonation.BecomeBank" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <main class="vh-100">
        
        <div class="myform mx-auto" style="width:600px">

            <p class="h2 m-2 text-left text-danger">Become Blood Bank Partner</p>
            <hr />
            
            <div class="form-group m-2">
                
                <label for="txtBloodBankName">Blood Bank Name</label>
                <asp:TextBox ID="txtBloodBankName" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                
                <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtBloodBankName" ErrorMessage="Only Characters allowed." ValidationExpression="^[\sA-Za-z,-]{10,90}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBloodBankName" ErrorMessage="Please Enter Blood Bank Name"></asp:RequiredFieldValidator>
                
            </div>          

            <div class="form-group m-2">
                
                <label for="txtBloodBankAddress">Blood Bank Address</label>
                <asp:TextBox ID="txtBloodBankAddress" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control mb-4" ></asp:TextBox>
                
                <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtBloodBankAddress" ErrorMessage="Minimum 10 & Maximum 90 Characters" ValidationExpression="^[\sA-Za-z0-9,-]{10,90}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic"  ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtBloodBankAddress" ErrorMessage="Please enter your valid residential address."></asp:RequiredFieldValidator>
                
            </div>

            <div class="text-center">
                <asp:Label id="fails" CssClass="text-danger" runat="server"></asp:Label>
                <asp:Label id="result" CssClass="text-success" runat="server"></asp:Label>
            </div>

            <div class="text-right">
                
                <asp:Button ID="btnApplyForBank" runat="server" Text="Submit"  CssClass="btn btn-primary m-2" OnClick="btnApplyForBank_Click"/><br />
            
            </div>

        </div>

    </main>

</asp:Content>
