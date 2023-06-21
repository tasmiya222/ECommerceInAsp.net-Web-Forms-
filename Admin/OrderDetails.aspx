<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="E_Shopping.Admin.OrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="pcoded-inner-content">
        <div class="align-align-self-end">
            <asp:Label ID="lblMsg" runat="server" visiable="false" ForeColor="Red" Font-Bold="True"></asp:Label>
        </div>
        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                      

                                      
                                        <div class="col-sm-6 col-md-8 col-lg-12 mobile-inputs">
                                            <h4 class="sub-title">Category list</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <asp:Repeater ID="rOrderMaster" OnItemDataBound="rOrderMaster_ItemDataBound1" runat="server">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover norwap">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Id</th>
                                                                        <th>Image</th>
                                                                        <th>Product</th>
                                                                        <th>Price</th>
                                                                        <th>Quantity</th>
                                                                        <th>Address</th>
                                                                        <th>City</th>
                                                                        <th>Total</th>

                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td><%# Eval("OrderId") %></td>
                                                                <td><%# Eval("ImageUrl") %></td>
                                                                <td><%# Eval("Name") %></td>
                                                                <td><%# Eval("Price") %>
                                                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label></td>
                                                                <td>
                                                                    <asp:Label ID="lblQty" runat="server"  Text='<%# Eval("Quantity") %>'> </asp:Label></td>
                                                                <td><%# Eval("Address") %></td>
                                                                <td><%# Eval("City") %></td>
                                                                <td><%Response.Write(Session["grandTotalCart"]);%></td>
                                                           
                                                            </tr>
                                                                

                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                        
                                                            </tbody>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                           <br />
                                                    <br />
                                                    <div class="form-group">
                                                        <div>
                                                            <h4>Order Status Conformation</h4>
                                                        </div>
                                                        <br />
                                                       
                                                        <div>
                                                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">

                                                                
                                                            </asp:DropDownList>
                                                        </div>
                                                        <br />
                                                        <br />
                                                        <div>
                                                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-info" OnClick="btnUpdate_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
