<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BloodDonation._Default" %>

<%@ Register Src="~/views/footer.ascx" TagPrefix="uc1" TagName="footer" %>


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

    <!-- Camps Page -->

    <asp:UpdatePanel runat="server" ID="up1" style="width:100%">
        <ContentTemplate>
        <div class="container-fluid text-center p-4">
        
            <hr />
            <br />

            <p class="h1-responsive">Upcoming Blood Donation Camps</p>

            <div>
                <div class="d-lg-flex">

                    <asp:ListView ID="lvCamps" runat="server" DataSourceID="SqlDataSource1">
                
                        <ItemTemplate>
                            <div class="col-lg-4">
                                <div class="card my-3 text-center">
                
                                    <div class="card-header d-flex text-center">
                                        <div class="col-4 m-auto">
                                            <i class="fa fa-calendar-alt text-success"></i>
                                            <br />
                                            <%# convertToIndianDate(Eval("camp_date")) %>
                        
                                        </div>
                    
                                        <div class="col-4 m-auto">
                                            <i class="fa fa-clock text-primary"></i>
                                            <br />
                                            <%#Eval("camp_time") %>
                                        </div>

                                    </div>

                                    <div class="card-body">
                                        <i class="fa fa-map-marker-alt text-danger"></i>
                                        <br />
                                        <%#Eval("camp_address") %>
                                    </div>

                                    <% if (Session["loggedIn"] != null)
                                        { %>
                                    <asp:Button ID="btnAttend" runat="server" CommandArgument='<%#Eval("id")%>' CommandName="attend" Text="Attend" CssClass="btn btn-cyan btn-block" OnClick="btnAttend_Click" Width="100%"  />
                                    <% } %>
                                </div>
                            </div>
                        </ItemTemplate>

                        <EmptyDataTemplate>
                            <h1 class="alert-warning">No upcoming blood donation camps found.</h1>
                        </EmptyDataTemplate>

                    </asp:ListView>
                </div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bloodConnectionString %>" SelectCommand="SELECT * FROM [camps] WHERE camp_date > @todays_date">
                    <SelectParameters>
                        <asp:Parameter Name="todays_date" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
            <br />
        </div>
        </ContentTemplate>
    </asp:UpdatePanel>

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
    
    <uc1:footer runat="server" id="footer" />

</asp:Content>
