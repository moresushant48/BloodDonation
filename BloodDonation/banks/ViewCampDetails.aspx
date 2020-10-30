<%@ Page Title="Camp Details" Language="C#" MasterPageFile="~/banks/BloodBankSidebar.master" AutoEventWireup="true" CodeBehind="ViewCampDetails.aspx.cs" Inherits="BloodDonation.banks.ViewCampDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BloodBankSidebarContent" runat="server">

    <main class="vh-100">
        

        <!-- Button trigger modal -->
        <div>
            
            <!-- Camp Details -->
          
            <asp:ListView ID="lvCampDetails" runat="server" DataSourceID="SqlDataSource2">

                <ItemTemplate>
            
                    <div class="card">

                        <div class="card-header d-flex text-center">
                            <div class="col">
                                Date :
                                <%#Eval("camp_date") %>
                            </div>

                            <div class="col">
                                Time : 
                                <%#Eval("camp_time") %>
                            </div>
                        </div>

                        <div class="card-body d-flex">
                            <div class="col-10">
                                <%#Eval("camp_address") %>
                            </div>

                            <div class="col-2">
                                <button type="button" class="btn btn-primary btn-block p-1" data-toggle="modal" data-target="#centralModalSm">
                                    New Donor
                                </button>
                                    
                            </div>    
                        </div>

                    </div>

                </ItemTemplate>
        
            </asp:ListView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:bloodConnectionString %>" 
                SelectCommand="SELECT * FROM [camps] WHERE id = @campId ORDER BY id desc" >
                <SelectParameters>
                    <asp:QueryStringParameter Name="campId" QueryStringField="campId" DbType="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        

        <!-- MODAL -->

        <div class="modal fade" id="centralModalSm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">

            <!-- Change class .modal-sm to change the size of the modal -->
            <div class="modal-dialog modal-lg" role="document">

                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title w-100" id="myModalLabel">Add Donor</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                
                    <div class="modal-body">
                
                    <div class="mx-auto" style="width:600px">

                        <div class="d-flex">
            
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
            
                        </div>

                        <div class="d-flex">
            
                            <div class="form-group m-2">
                    
                                <label for="txtGender">Gender</label>
                                <asp:DropDownList ID="txtGender" runat="server" CssClass="form-control">
                                    <asp:ListItem>M</asp:ListItem>
                                    <asp:ListItem>F</asp:ListItem>
                                </asp:DropDownList>
                
                            </div>

                            <div class="form-group m-2">
                    
                                <label for="txtMobNo">Mobile Number</label>
                                <asp:TextBox ID="txtMobNo" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                
                                <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMobNo" ErrorMessage="Please Enter Mobile Number"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtMobNo" ErrorMessage="Enter Valid 10 digit Mobile No." ValidationExpression="^[0-9]{10,10}$"></asp:RegularExpressionValidator>
                
                            </div>

                            <div class="form-group m-2">

                                <label for="txtAge">Age</label>
                                <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                
                                <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAge" ErrorMessage="Please Enter Age."></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator1" ForeColor="Red" MinimumValue="18" MaximumValue="65" runat="server" ControlToValidate="txtAge" ErrorMessage="Person needs to be between 18 to 65."></asp:RangeValidator>
                
                            </div>
            
                        </div>

                        <div class="d-flex">

                            <div class="form-group col-6">

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

                            <div class="form-group col-6">
                    
                                <label for="txtBloodQuantity">Quantity</label>
                                <asp:DropDownList ID="txtBloodQuantity" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="350">350 ml</asp:ListItem>
                                    <asp:ListItem Value="450">450 ml</asp:ListItem>
                                </asp:DropDownList>
                
                            </div>

                        </div>

                        <div class="form-group m-2">
                
                            <label for="txtAddress">Residential Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control mb-4" ></asp:TextBox>
                
                            <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtAddress" ErrorMessage="Minimum 10 & Maximum 90 Characters" ValidationExpression="^[\sA-Za-z0-9,-.:/]{10,90}$"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic"  ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAddress" ErrorMessage="Please enter your valid residential address."></asp:RequiredFieldValidator>
                
                        </div>

                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnAddDonor" runat="server" Text="Add"  CssClass="btn btn-primary" OnClick="btnAddDonor_Click"/>
                </div>

            </div>

        </div>

        </div>
        <!-- Central Modal -->
       
        <div class="m-2">
            
            <table class="table table-borderless">
                
                <thead class="bg-light">
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Gender</th>
                        <th>Mobile</th>
                        <th>Blood</th>
                        <th>Quantity</th>
                        <th>Address</th>
                        <th>Actions</th>
                    </tr>
                </thead>

                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        
                    <ItemTemplate>

                        <tbody>
                            <tr>
                                <td><%#Eval("id") %></td>
                                <td><%# String.Format("{0} {1} {2}",Eval("first_name"), Eval("middle_name"), Eval("last_name")) %></td>
                                <td><%#Eval("age") %></td>
                                <td><%#Eval("gender") %></td>
                                <td><%#Eval("phone") %></td>
                                <td><%#Eval("blood") %></td>
                                <td><%#Eval("quantity") %> ml</td>
                                <td><%#Eval("address") %></td>
                                <td>
                                    <asp:Button runat="server" ID="DeleteDonor" Text="Delete" CommandArgument='<%#Eval("id")%>' CommandName="deleteDonor" OnClick="DeleteDonor_Click" OnClientClick="javascript:return confirm('Are you sure to delete record?')" CssClass="btn btn-red btn-block p-1" />
                                </td>
                            </tr>
                        </tbody>
            
                    </ItemTemplate>

                    <EmptyDataTemplate>
                        <div class="text-center alert-danger">No Donor details found for this camp.</div>
                    </EmptyDataTemplate>

                </asp:ListView>
    
                </table>

                <asp:DataPager ID="DataPager1" PagedControlID="ListView1" PageSize="5" runat="server">
                <Fields>
                    <asp:NumericPagerField CurrentPageLabelCssClass="border border-primary p-2 mx-2"/>
                </Fields>
            </asp:DataPager>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bloodConnectionString %>" SelectCommand="SELECT * FROM [visitdetails] WHERE camp_id = @campId ORDER BY [id] DESC">

                <SelectParameters>
                    <asp:QueryStringParameter Name="campId" QueryStringField="campId" DbType="Int32" />
                </SelectParameters>

            </asp:SqlDataSource>
            
        </div>

    </main>

</asp:Content>
