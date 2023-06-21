<%@ Page Title="" Language="C#" MasterPageFile="~/Website/Main.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="E_Shopping.Website.OrderDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!--Page Banner Start-->
    <div class="page-banner" style="background-image: url(assets/images/banner.jpg);">
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
           <div class="container">
            <div class="cart-table table-responsive">
                <asp:Repeater ID="rOrder" runat="server" OnItemDataBound="rOrder_ItemDataBound">
                    <Headertemplate>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="image">Image</th>
                                    <th class="product">Product</th>
                                    <th class="price">Price</th>
                                    <th class="quantity">Quantity</th>
                                    <th class="total">Total</th>
                                   
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
                      
                                </span>
                            </td>

                            <td class="quantity">
                                <div class="quantity d-inline-flex">
                                 
                                   
                                    <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                </div>

                            </td>
                            <td class="total">
                                <span class="total-amount">Rs
                                    <asp:Label  runat="server"><%Response.Write(Session["Total"]);%>/-</asp:Label>
                                </span>

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
                    </Footertemplate>
                </asp:Repeater>
            </div>
               </div>

</asp:Content>
