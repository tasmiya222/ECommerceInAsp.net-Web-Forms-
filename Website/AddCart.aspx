<%@ Page Title="" Language="C#" MasterPageFile="~/Website/Main.Master" AutoEventWireup="true" CodeBehind="AddCart.aspx.cs" Inherits="E_Shopping.Website.AddCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Page Banner Start-->
    <div class="page-banner" style="background-image: url(assets/images/testimonial-bg.jpg);">
        <div class="container">
            <div class="page-banner-content text-center">
                <h2 class="title">Your Shopping Cart</h2>
                <ol class="breadcrumb justify-content-center">
                    <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Your Shopping Cart</li>
                </ol>
            </div>
        </div>
    </div>
    <!--Page Banner End-->
    <!--Cart Start-->
    <div class="cart-page section-padding-5">
        <div class="container">
            <div class="cart-table table-responsive">
                <asp:Repeater ID="rCart" OnItemCommand="rCart_ItemCommand" OnItemDataBound="rCart_ItemDataBound" runat="server">
                    <Headertemplate>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="image">Image</th>
                                    <th class="product">Product</th>
                                    <th class="price">Price</th>
                                    <th class="quantity">Quantity</th>
                                    <th class="total">Total</th>
                                    <th class="remove">Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                    </Headertemplate>
                    <Itemtemplate>

                        <tr>
                            <td class="image">
                                <img src='<%# E_Shopping.Utils.GetImageUrl( Eval("ImageUrl")) %>' alt="">
                            </td>
                            <td class="product">
                                <a>
                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </a>
                            </td>
                            <td class="price">
                                <span class="amount">Rs<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'>/-</asp:Label>
                                    <asp:HiddenField ID="hdnProductId" runat="server" Value='<%# Eval("PrdouctId") %>' />
                                    <asp:HiddenField ID="hdnQuantity" runat="server" Value='<%# Eval("Qty") %>' />
                                    <asp:HiddenField ID="hdnProductQuantity" Value='<%# Eval("PrdQty") %>' runat="server" />
                                </span>
                            </td>

                            <td class="quantity">
                                <div class="quantity d-inline-flex">
                                    <button type="button" class="sub"><i class="ti-minus"></i></button>
                                    <asp:TextBox ID="txtQuantity" value="1" Text='<%# Eval("Quantity") %>' runat="server"></asp:TextBox>
                                    <button type="button" class="add"><i class="ti-plus"></i></button>
                                </div>

                            </td>
                            <td class="total">
                                <span class="total-amount">Rs
                                    <asp:Label ID="lblTotalPrice" runat="server">/-</asp:Label>
                                </span>

                            </td>
                            <td class="remove">
                                <asp:LinkButton ID="btnRemove" CommandName="remove" CommandArgument='<%# Eval("PrdouctId") %>' runat="server">
                                    <i class="ti-close"></i>
                                </asp:LinkButton>

                            </td>
                        </tr>
                    </Itemtemplate>
                    <Footertemplate>
                      </tbody>
                    </table>
                     <div class="cart-btn">
                    <div class="cart-btn-left">
                        <a href="Default.aspx" class="btn btn-primary">Continue Shopping</a>
                    </div>
                    <div class="cart-btn-right">
                        <asp:LinkButton ID="lknUpdate" CommandName="updateCart" CssClass="btn" runat="server">Update Cart</asp:LinkButton>
                        
                    </div>
                </div>
                    </Footertemplate>
                </asp:Repeater>
            </div>
        <div class="row">
               <div class="col-lg-4">
                   </div>
           <div class="col-lg-4">
                        <div class="cart-coupon">
                            
                    </div>
               </div>
              <div class="col-lg-4">
                        <div class="cart-totals">
                            <div class="cart-title">
                                <h4 class="title">Cart totals</h4>
                            </div>
                            <div class="cart-total-table mt-25">
                              
                                    <table class="table">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <p class="value">Subtotal</p>
                                            </td>
                                            <td>
                                                <p class="price">Rs<%Response.Write(Session["grandTotalCart"]); %>/-</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p class="value">Shipping</p>
                                            </td>
                                            <td>
                                                 <p class="price">Rs<%Response.Write(Session["ShippinPrice"]);%>/-</p>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <p class="value">Total</p>
                                            </td>
                                            <td>
                                                <p class="price">Rs<%Response.Write(Session["Total"]); %>/-</p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                    
                            </div>
                            <div class="cart-total-btn">
                                <asp:LinkButton ID="LinkButton1" class="btn btn-primary btn-block" PostBackUrl="~/Website/Checkout.aspx" runat="server">Proceed To Checkout</asp:LinkButton>
                                </div>
                        </div>
                    </div>
        </div>
            </div>
        
    </div>
</asp:content>
