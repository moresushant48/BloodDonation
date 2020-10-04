<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BloodDonation._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- MAIN PAGE -->

        <div class="d-flex" style="height:600px; background-color:#eaeaea">

                <div class="col-6 text-center d-flex" style="
                    background-image: url('images/blood-hands.png');
                    background-size: cover;
                    background-position:center;
                    background-repeat: no-repeat;
                    ">              
                </div>
            
                <div class="col-6 bg-white d-flex">
                    
                    <div class="m-auto">

                        <h1 class="text-monospace display-2 text-left">Save <span class="text-success animated heartBeat infinite"><i class="fa fa-heartbeat"></i></span>, Donate <span class="text-danger"><i class="fa fa-tint"></i></span>.</h1>
                        <hr />
                        <p class="lead h2-responsive text-black-50">Be a <b>Blood Donor</b>, Be a <b>Hero</b> - A <b>Real One</b>.</p>
                        
                        <button class="btn border border-danger text-danger bg-white">Learn More</button>
                    
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
                    <h1 class="text-monospace">Wish to Donate Blood ?</h1>
                    
                    <i class="fa fa-quote-left my-4"></i>

                    <blockquote class="text-center">
                        <p class="lead">
                            Blood is the most precious gift that anyone can give to another person <br />
                            the gift of life. A decision to donate your blood can save a life,
                            or even several if your blood is separated into its components <br /> red cells, platelets and plasma — which can be used individually for patients with specific conditions.
                        </p>
                    </blockquote>

                    <i class="fa fa-quote-right my-4"></i>
                    <br />

                    <a href="/SignUp" class="btn btn-white animated tada slower infinite border border-danger text-danger">Become a Voluntary Blood Donor</a>

                </div>
            </div>
                

        </div>

    <footer class="d-flex text-center text-white bg-dark" style="height:80px">
        <p class="m-auto">&copy; Rutuja Patil - All Rights Reserved <%: DateTime.Now.Year %> </p>
    </footer>

    

</asp:Content>
