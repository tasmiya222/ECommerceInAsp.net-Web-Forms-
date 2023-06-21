<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="OrderMaster.aspx.cs" Inherits="E_Shopping.Admin.OrderMaster" %>

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
                                                    <asp:Repeater ID="rOrderMaster" runat="server">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover norwap">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Order</th>
                                                                        <th>Date</th>
                                                                        <th>Payment Type</th>
                                                                        <th>Order Status</th>
                                                                        <th>Total</th>
                                                                        <th>Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td><%# Eval("Id") %></td>
                                                                <td><%# Eval("createdDate") %></td>
                                                                <td><%# Eval("PaymentType") %></td>
                                                                <td><%# Eval("OrderStatus") %></td>
                                                                <td><%# Eval("totalPrice") %></td>

                                                                <td>
                                                                    <asp:LinkButton ID="lknUpdate" runat="server" CssClass="badge badge-primary" PostBackUrl='<%# "OrderDetails.aspx?id=" + Eval("Id")%>'>Order Details</asp:LinkButton>
                                                                </td>

                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                   
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
