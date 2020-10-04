<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="BloodDonation.views.SignIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <main class="vh-100">
        
        <div class="myform">
    
            <p class="h2 mb-4 text-center">Login</p>

            <div class="form-group m-2">
                    
                <label for="txtEmail">Email Id</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                
                <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic"  ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter Valid Email."></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="EmailIdValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Valid Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                
            </div>

            <div class="form-group m-2">

                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                
                <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtPassword" ErrorMessage="Minimum 6 - Maximum 15 Alphanumeric." ValidationExpression="^[A-Za-z0-9]{6,15}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please Enter Password"></asp:RequiredFieldValidator>
                
            </div>
            
            <div class="text-center">
                <asp:Label id="fails" CssClass="text-danger" runat="server"></asp:Label>
                <asp:Label id="result" CssClass="text-success" runat="server"></asp:Label>
            </div>

            <div class="text-right">
                
                <asp:Button ID="btnSignup" runat="server" Text="Submit"  CssClass="btn btn-primary m-2" OnClick="btnSignin_Click"/><br />
            
            </div>

        </div>
       
        <asp:Timer ID="Timer1" runat="server" Enabled="false" Interval="100" OnTick="Timer1_Tick"></asp:Timer>

    </main>

</asp:Content>