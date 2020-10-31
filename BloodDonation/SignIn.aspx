<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="BloodDonation.views.SignIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        
    <main class="vh-100">
        
        <div class="myform">
    
            <p class="h2 m-2 text-left text-danger">Login</p>
            <hr />
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

            <div>
                <small> 
                    <a class="text-primary m-2" data-toggle="modal" data-target="#centralModalSm">
                        Forgot Password ?
                    </a>
                </small>
            </div>
            
            <div class="text-center">
                <asp:Label id="fails" CssClass="text-danger" runat="server"></asp:Label>
                <asp:Label id="result" CssClass="text-success" runat="server"></asp:Label>
            </div>

            <div class="text-right">
                
                <asp:Button ID="btnSignup" runat="server" Text="Submit"  CssClass="btn btn-primary m-2" OnClick="btnSignin_Click"/><br />
            
            </div>

        </div>

        <!-- MODAL -->

        <div class="modal fade" id="centralModalSm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">

            <!-- Change class .modal-sm to change the size of the modal -->
            <div class="modal-dialog modal-sm" role="document">

                <div class="modal-content">
                    
                    <div class="modal-header">
                        <h4 class="modal-title w-100" id="myModalLabel">Reset Password</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                
                    <div class="modal-body">
                
                        <div class="form-group">

                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">

                                <ContentTemplate>
                                    <div class="form-group m-2">
                    
                                        <label for="txtForgotEmail">Email Id</label>
                                        <asp:TextBox ID="txtForgotEmail" AutoPostBack="false" runat="server" ValidationGroup="checkValidEmail" CssClass="form-control" TextMode="Email"></asp:TextBox>
                
                                        <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic"  ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtForgotEmail" ErrorMessage="Please enter Valid Email."></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtForgotEmail" ErrorMessage="Enter Valid Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        
                                        <div class="text-center">
                                            <small>
                                                <asp:Label ID="lblEmailSent" runat="server" CssClass="text-center text-success"></asp:Label>
                                                <asp:Label ID="lblEmailExists" runat="server" CssClass="text-center text-danger"></asp:Label>
                                            </small>
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <small><asp:Button id="btnSendSecurityCode" 
                                            ValidationGroup="checkValidEmail" runat="server" CssClass="text-primary" Text="Send Security Key" OnClick="btnSendSecurityCode_Click"/></small>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                                <ContentTemplate>

                                    <div class="form-group m-2">
                    
                                        <label for="txtSecurityCode">Security Code</label>
                                        <asp:TextBox ID="txtSecurityCode" runat="server" CssClass="form-control" TextMode="SingleLine"
                                            AutoPostBack="false"
                                            ValidationGroup="checkCodeAndPass"
                                            ></asp:TextBox>
                
                                        <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic"  ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSecurityCode" ErrorMessage="Please enter Valid Security Code."></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtSecurityCode" ErrorMessage="Enter Valid 6-digit Security Code." ValidationExpression="^[0-9]{6,6}$"></asp:RegularExpressionValidator>
                
                                        <div class="text-center">
                                            <small>
                                                <asp:Label ID="lblInvalidCode" runat="server" CssClass="text-center text-danger"></asp:Label>
                                            </small>
                                        </div>
                                    </div>

                                    <div class="form-group m-2">

                                        <label for="txtChangedPassword">Password</label>
                                        <asp:TextBox ID="txtChangedPassword" runat="server" CssClass="form-control" TextMode="Password"
                                            AutoPostBack="false"
                                            ValidationGroup="checkCodeAndPass"></asp:TextBox>
                
                                        <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtChangedPassword" ErrorMessage="Minimum 6 - Maximum 15 Alphanumeric." ValidationExpression="^[A-Za-z0-9]{6,15}$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtChangedPassword" ErrorMessage="Please Enter Password"></asp:RequiredFieldValidator>
                
                                    </div>

                                </ContentTemplate>
                               
                            </asp:UpdatePanel>

                        </div>

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <asp:Button ID="btnResetPassword" runat="server" CssClass="btn btn-primary" Text="Submit"
                            ValidationGroup="checkCodeAndPass"
                            OnClick="btnResetPassword_Click" />
                    </div>

                </div>
            </div>

        </div>

    </main>

</asp:Content>