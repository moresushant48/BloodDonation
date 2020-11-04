<%@ Page Title="Request Blood" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RequestBlood.aspx.cs" Inherits="BloodDonation.RequestBlood" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <main class="vh-100">
        
        <div class="myform">
    
            <p class="h2 m-2 text-left text-danger">Request Blood</p>
            <hr />

            <div class="form-group m-2">
                
                <label for="txtFirstName">First Name</label>
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                
                <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Only Characters allowed." ValidationExpression="^[A-Za-z]*$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Please Enter First Name"></asp:RequiredFieldValidator>
                
            </div>
            
            <div class="form-group m-2">
                
                <label for="txtMiddleName">Middle Name</label>
                <asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                
                <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMiddleName" ErrorMessage="Only Characters allowed." ValidationExpression="^[A-Za-z]*$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMiddleName" ErrorMessage="Please Enter Middle Name"></asp:RequiredFieldValidator>
                
            </div>
            
            <div class="form-group m-2">
                    
                <label for="txtLastName">Last Name</label>
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                
                <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtLastName" ErrorMessage="Only Characters allowed." ValidationExpression="^[A-Za-z]*$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName" ErrorMessage="Please Enter Last Name"></asp:RequiredFieldValidator>
                
            </div>

            <div class="form-group m-2">
                    
                <label for="txtEmail">Email Id</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                
                <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic"  ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter Valid Email."></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="EmailIdValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Valid Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                
            </div>

            <div class="form-group m-2">
                    
                <label for="txtMobNo">Mobile Number</label>
                <asp:TextBox ID="txtMobNo" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                
                <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMobNo" ErrorMessage="Please Enter Mobile Number"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtMobNo" ErrorMessage="Enter Valid 10 digit Mobile No." ValidationExpression="^[0-9]{10,10}$"></asp:RegularExpressionValidator>
                
            </div>

            <div class="form-group m-2">

                <label for="txtBloodGroup">Blood Group</label>
                <asp:DropDownList ID="txtBloodGroup" runat="server" CssClass="form-control">
                    <asp:ListItem>O+</asp:ListItem>
                    <asp:ListItem>O-</asp:ListItem>
                    <asp:ListItem>A+</asp:ListItem>
                    <asp:ListItem>A-</asp:ListItem>
                    <asp:ListItem>B+</asp:ListItem>
                    <asp:ListItem>B-</asp:ListItem>
                    <asp:ListItem>AB+</asp:ListItem>
                    <asp:ListItem>AB-</asp:ListItem>
                </asp:DropDownList>
      
            </div>
            
            <div class="text-center">
                <asp:Label id="fails" CssClass="text-danger" runat="server"></asp:Label>
                <asp:Label id="result" CssClass="text-success" runat="server"></asp:Label>
            </div>

            <div class="text-right">
                
                <asp:Button ID="btnSignup" runat="server" Text="Submit" 
                    OnClick="btnSignup_Click"
                    CssClass="btn btn-primary m-2" /><br />
            
            </div>

        </div>

    </main>

</asp:Content>