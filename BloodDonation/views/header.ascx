<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="BloodDonation.views.header" %>

<li id="liHome" runat="server" class="nav-item"><a class="nav-link" runat="server" href="~/">Home</a></li>
<li id="liSignup" runat="server" class="nav-item"><a class="nav-link" runat="server" href="~/SignUp">Sign Up</a></li>
<li id="liSignin" runat="server" class="nav-item"><a class="nav-link" runat="server" href="~/SignIn">Login</a></li>

<!-- Logout -->
<li class="nav-item"><asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-dark nav-link" OnClick="btnLogout_Click" /></li>
