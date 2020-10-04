<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BloodDonation._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- MAIN PAGE -->

        <div class="container-fluid d-flex" style="height:600px; background-color:#eaeaea">
            
            <div class="row m-auto">

                <div class="col-6 text-center">
                    <img src="images/homepage.gif" class="img-fluid"/>                
                </div>
            
                <div class="col-6 text-center m-auto">
                
                    <h1>Save a <span class="text-success">Life</span>, Donate <span class="text-danger">Blood</span>.</h1>
                    <p class="lead text-primary">Be a <b>Blood Donor</b>, Be a <b>Hero</b> - A <b>Real One</b>.</p>
                    <button class="btn border border-primary text-primary">Learn More</button>
                
                </div>

            </div>

        </div>

    <!-- Second PAGE -->

        <div class="text-center" style="
            height:600px;
            background-image: url('images/hands.jpg');
            background-repeat: no-repeat;
            background-size:cover;
            ">
            <div class="overlay text-white d-flex">
                <div class="m-auto">
                    <h1>Wish to Donate Blood ?</h1>
                    <h2 class="lead">Register as Voluntary Blood Donor.</h2>
                    <br />
                    <a href="/SignUp" class="btn border-white text-white">Register</a>
                </div>
            </div>
                

        </div>

    <footer class="d-flex text-center text-white bg-dark" style="height:80px">
        <p class="m-auto">&copy; Rutuja Patil - All Rights Reserved <%: DateTime.Now.Year %> </p>
    </footer>

    

</asp:Content>
