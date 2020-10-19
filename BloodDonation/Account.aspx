<%@ Page Title="My Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="BloodDonation.Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <main class="">

       <div style="height:300px" class="w-100 aqua-gradient py-3">

           <div class="container text-white">
               <h1 class="display-3">Hello, <asp:Label ID="lblName" runat="server"></asp:Label></h1>
               <p class="lead">This is your profile page. You can see your details and contributions.</p>
           </div>

           <div class="container my-5">
               
               <div class="card">
                   <div class="card-header bg-white">
                        <p class="h3-responsive m-auto">My Account</p>
                   </div>

                   <div class="card-body">

                       <p class="text-secondary">USER INFORMATION</p>

                       <div class="d-flex py-3">

                           <div class="col-4 form-group">
                
                               <label for="txtFirstName">First Name</label>
                               <asp:TextBox ID="txtFirstName" runat="server" Enabled="false" CssClass="card form-control" TextMode="SingleLine"></asp:TextBox>
                
                           </div>

                           <div class="col-4 form-group">
                
                               <label for="txtMiddleName">Middle Name</label>
                               <asp:TextBox ID="txtMiddleName" runat="server" Enabled="false" CssClass="card form-control" TextMode="SingleLine"></asp:TextBox>
                
                           </div>

                           <div class="col-4 form-group">
                
                               <label for="txtLastName">Last Name</label>
                               <asp:TextBox ID="txtLastName" runat="server" Enabled="false" CssClass="card form-control" TextMode="SingleLine"></asp:TextBox>
                
                           </div>

                       </div>

                       <hr />

                       <p class="text-secondary">CONTACT INFORMATION</p>

                       <div class="d-flex py-3">

                           <div class="col-4 form-group">

                               <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                   <ContentTemplate>
                                       <label for="txtEmail">Email Id</label>
                                       <asp:TextBox AutoPostBack="true" OnTextChanged="txtEmail_TextChanged" ID="txtEmail" runat="server" Enabled="true" CssClass="card form-control" TextMode="SingleLine"></asp:TextBox>

                                       <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic"  ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter Valid Email."></asp:RequiredFieldValidator>
                                       <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="EmailIdValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Valid Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                   </ContentTemplate>
                               </asp:UpdatePanel>
                               

                           </div>

                           <div class="col-4 form-group">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                       <label for="txtPhone">Mobile Number</label>
                                       <asp:TextBox AutoPostBack="true" OnTextChanged="txtPhone_TextChanged" ID="txtPhone" runat="server" Enabled="true" CssClass="card form-control" TextMode="SingleLine"></asp:TextBox>
                
                                       <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPhone" ErrorMessage="Please Enter Mobile Number"></asp:RequiredFieldValidator>
                                       <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtPhone" ErrorMessage="Enter Valid 10 digit Mobile No." ValidationExpression="^[0-9]{10,10}$"></asp:RegularExpressionValidator>
                                    </ContentTemplate>
                               </asp:UpdatePanel>
                           </div>

                           <div class="col-4 form-group">
                
                               <label for="txtBloodGroup">Blood Group</label>
                               <asp:TextBox ID="txtBloodGroup" runat="server" Enabled="false" CssClass="card form-control" TextMode="SingleLine"></asp:TextBox>
                
                           </div>

                       </div>

                       <div class="form-group m-3">
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <label for="txtAddress">Address</label>
                                    <asp:TextBox AutoPostBack="true" OnTextChanged="txtAddress_TextChanged" ID="txtAddress" runat="server" Enabled="true" CssClass="card form-control" TextMode="MultiLine"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                       </div>

                   </div>
               </div>

           </div>

       </div>

    </main>

</asp:Content>
