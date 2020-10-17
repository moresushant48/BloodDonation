<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer.ascx.cs" Inherits="BloodDonation.views.footer" %>

<div class="container py-4 d-flex">
    <div class="col-8">
        <p class="h1-responsive"> Get in Touch </p>
        <hr />
        
        <div class="w-75">
            <asp:TextBox ID="txtName" runat="server" placeholder="Name" CssClass="form-control mb-3" TextMode="SingleLine"></asp:TextBox>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email ID" CssClass="form-control mb-3" TextMode="Email"></asp:TextBox>
            <asp:TextBox ID="txtMessage" runat="server" placeholder="Message" CssClass="form-control mb-3" TextMode="MultiLine" Rows="4"></asp:TextBox>
            <asp:Button ID="btnSend" runat="server" Text="Submit" CssClass="btn btn-dark" OnClick="btnSend_Click"/>
        </div>

    </div>

    <div class="col-4">

        <p class="h1-responsive"> Other Ways </p>
        <hr />
        <p class="h5-responsive">Make sure to follow us on social media.</p>
        
        <br />
        <div class="d-flex mt-3 text-leftn">
            <a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook text-primary fa-3x col-4"></i></a>
            <a href="https://www.instagram.com" target="_blank"><i class="fab fa-instagram text-secondary fa-3x col-4"></i></a>
            <a href="https://www.twitter.com" target="_blank"><i class="fab fa-twitter text-primary fa-3x col-4"></i></a>
        </div>

        <br />
        <h5>rutujapatil@gmail.com</h5>
        <h5>+91 1234567890</h5>

    </div>

</div>

<div class="d-flex bg-dark text-white py-2">
    <p class="m-auto">&copy; Rutuja Patil - All Rights Reserved <%: DateTime.Now.Year %> </p>
</div>