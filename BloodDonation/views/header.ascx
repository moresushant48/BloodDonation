<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="BloodDonation.views.header" %>

<li id="liHome" runat="server" class="nav-item m-auto"><a class="nav-link" runat="server" href="~/">Home</a></li>
<li id="liSignup" runat="server" class="nav-item m-auto"><a class="nav-link" runat="server" href="~/SignUp">Sign Up</a></li>
<li id="liSignin" runat="server" class="nav-item m-auto"><a class="nav-link" runat="server" href="~/SignIn">Login</a></li>
<li id="liDashboard" runat="server" class="nav-item m-auto"><a class="nav-link" runat="server" href="~/admin/Dashboard">Admin</a></li>
<li id="liBankboard" runat="server" class="nav-item m-auto"><a class="nav-link" runat="server" href="~/banks/Bankboard">Dashboard</a></li>
<li id="liAccount" runat="server" class="nav-item m-auto"><a class="nav-link" runat="server" href="~/Account">Account</a></li>

<!-- Logout -->
<li class="nav-item"><asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-dark nav-link" OnClick="btnLogout_Click" /></li>
