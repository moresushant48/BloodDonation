<%@ Page Title="Add Camp" Language="C#" MasterPageFile="~/banks/BloodBankSidebar.master" AutoEventWireup="true" CodeBehind="AddDonationCamp.aspx.cs" Inherits="BloodDonation.banks.AddDonationCamp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BloodBankSidebarContent" runat="server">
    
    <main class="vh-100">
        
        <div class="mt-3">
    
            <p class="h2 m-2 text-left text-danger">Add Camp Details</p>
            <hr />

            <div class="d-flex">
                <div class="form-group m-2 col">
                
                    <label for="Calendar1">Camp Date</label>
                    <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender" 
                        BackColor="White" BorderColor="#3366CC" BorderWidth="1px" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" CellPadding="1" DayNameFormat="Shortest">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" ForeColor="#CCFF99" Font-Bold="True" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>

                </div>

                <div class="form-group m-2  col">
                    
                    <label for="Calendar1">Camp Time</label>
                    <br />
                    <div class="d-flex">
                        <asp:DropDownList ID="hour" runat="server" CssClass="form-control mb-4">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="meridiem" runat="server" CssClass="form-control mb-4">
                            <asp:ListItem>PM</asp:ListItem>
                            <asp:ListItem>AM</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <label> To </label>
                    <div class="d-flex">
                        <asp:DropDownList ID="hourTo" runat="server" CssClass="form-control mb-4">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="meridiemTo" runat="server" CssClass="form-control mb-4">
                            <asp:ListItem>PM</asp:ListItem>
                            <asp:ListItem>AM</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                </div>
            </div>

            <br />

            
            <div class="form-group m-2 w-100">
                
                <label for="txtAddress">Camp Location</label>
                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="7" CssClass="form-control mb-4" ></asp:TextBox>
                
                <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtAddress" ErrorMessage="Minimum 10 & Maximum 90 Characters" ValidationExpression="^[\sA-Za-z0-9,-]{10,90}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic"  ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAddress" ErrorMessage="Please enter your valid residential address."></asp:RequiredFieldValidator>
                
            </div>
            
            <div class="text-center">
                <asp:Label id="fails" CssClass="text-danger" runat="server"></asp:Label>
                <asp:Label id="result" CssClass="text-success" runat="server"></asp:Label>
            </div>

            <div class="text-right">
                
                <asp:Button ID="btnAddCamp" runat="server" Text="Submit" OnClick="btnAddCamp_Click" CssClass="btn btn-primary m-2" /><br />
            
            </div>

        </div>
       
        <asp:Timer ID="Timer1" runat="server" Enabled="false" Interval="100"></asp:Timer>

    </main>

</asp:Content>
