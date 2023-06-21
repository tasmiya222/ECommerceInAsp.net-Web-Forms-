<%@ Page Title="" Language="C#" MasterPageFile="~/Website/Main.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="E_Shopping.Website.Checkout1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            left: -1px;
            top: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--Page Banner Start-->
    <div class="page-banner" style="background-image: url(assets/images/banner.jpg);">
        <div class="container">
            <div class="page-banner-content text-center">
                <h2 class="title">Checkout</h2>
                <ol class="breadcrumb justify-content-center">
                    <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                </ol>
            </div>
        </div>
    </div>
    <!--Page Banner End-->

    <!--Register Start-->
    <div class="checkout-page section-padding-5">
        <div class="container">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>

            <div class="checkout-info mt-30">
                <p class="info-header"><i class="fa fa-exclamation-circle"></i>Returning customer? <a data-toggle="collapse" href="#login">Click here to login</a></p>

                <div class="collapse" id="login">
                    <div class="card-body">
                        <p>If you have shopped with us before, please enter your details in the boxes below. If you are a new customer, please proceed to the Billing & Shipping section.</p>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="single-form">
                                    <label>Username</label>
                                    <asp:TextBox ID="txtUser" placeholder="Enter UserName*" runat="server"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="UserName is Required*" ForeColor="Red" ControlToValidate="txtUser" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-6">
                                <div class="single-form">
                                    <label>Password</label>
                                    <asp:TextBox ID="txtPass" TextMode="Password" placeholder="Enter Password" runat="server"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is Required*" ForeColor="Red" Display="Dynamic" ControlToValidate="txtPass" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="single-form d-flex align-items-center">
                            <asp:Button ID="btnLogin" runat="server" class="btn btn-primary" Text="Login" OnClick="btnLogin_Click" CausesValidation="true" />

                        </div>
                        <div class="forget">
                        </div>

                    </div>
                </div>
            </div>

            <div class="checkout-info mt-30">
            
            </div>

         
                <div class="row">
                    <div class="col-lg-7">
                        <div class="checkout-form mt-30">
                            <div class="checkout-title">
                                <h4 class="title">Billing details</h4>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="single-form">
                                        <label>Country*</label>
                                        <asp:TextBox ID="txt_Country" Text="Pakistan" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <asp:HiddenField ID="hdnID" runat="server" Value="1" />
                                <div class="col-sm-6">
                                    <div class="single-select2">
                                        <label>Post Code *</label>
                                        <asp:TextBox ID="txt_postCode" placeholder="PostCode/Zip" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="single-form">
                                        <label>Address</label>
                                        <asp:TextBox ID="txt_address" placeholder=" House number and street name Apartment, suite, unit etc." runat="server"></asp:TextBox>
                                    </div>
                                </div>


                                <div class="col-sm-6">
                                    <div class="single-select2">
                                        <label>City *</label>
                                        <asp:TextBox ID="txt_City" placeholder="City" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                               



                            </div>
                            <div class="single-form checkout-note">
                                <label>Order notes</label>
                                <asp:TextBox ID="txt_notes" placeholder="Notes about your order, e.g. special notes for delivery." TextMode="MultiLine" runat="server"></asp:TextBox>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="checkout-review-order mt-30">
                            <div class="checkout-title">
                                <h4 class="title">Your Order</h4>
                            </div>

                            <div class="checkout-review-order-table table-responsive mt-15">
                                <asp:Repeater ID="rOder" runat="server" OnItemDataBound="rOder_ItemDataBound">
                                    <ItemTemplate>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="Product-name">Product</th>
                                                    <th class="Product-price">Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="Product-name">
                                                        <p>
                                                            <%# Eval("Name") %>×
                                                        <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                        </p>
                                                    </td>
                                                    
                                                        <asp:Label ID="lblProductId" runat="server" Visible="false" Text='<%# Eval("PrdouctId") %>'></asp:Label>
                                                       
                                                    </td>
                                                    <td class="Product-price">Rs.
                                                        <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'>
                                                       
                                                        </asp:Label>
                                                        /-
                                                    </td>
                                                </tr>

                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td class="Product-name">
                                                        <p>Subtotal</p>
                                                    </td>
                                                    <td class="Product-price">
                                                        <p>
                                                            <asp:Label ID="lblSubTotal" runat="server"></asp:Label>
                                                        </p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Product-name">
                                                        <p>Shipping</p>
                                                    </td>
                                                    <td class="Product-price">
                                                        <ul class="shipping-list">
                                                            <p>
                                                                Rs.<% Response.Write(Session["ShippinPrice"]);%>/-
                                                 
                                                        </ul>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Product-name">
                                                        <p>Total</p>
                                                    </td>
                                                    <td class="total-price">
                                                        <p>Rs. <%Response.Write(Session["Total"]); %>/-</p>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>

                            <div class="checkout-payment">
                                <ul>
                                    <li>
                                        <div class="single-payment"></div>
                                    </li>
                                    <li>
                                        <div class="single-payment"></div>
                                    </li>
                                    <li>
                                        <div class="single-payment">
                                            <div class="payment-radio cus-radio">
                                                <asp:RadioButton ID="Payment_type"   Checked="true" runat="server" />
                                                <label for="cash"><span></span>Cash On Delivery</label>


                                                <div class="payment-details">
                                                    <p>Pay with cash upon delivery.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="single-payment"></div>
                                
                                    </li>
                                </ul>

                                <div class="checkout-btn">
                                    <asp:Button ID="btnPlaceOrder" CausesValidation="false" CssClass="btn btn-primary btn-block" runat="server" Text="Place Order" OnClick="btnPlaceOrder_Click" />                       
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            
        </div>
    </div>
    <!--Register End-->
</asp:Content>
