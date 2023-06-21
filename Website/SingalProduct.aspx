<%@ Page Title="" Language="C#" MasterPageFile="~/Website/Main.Master" AutoEventWireup="true" CodeBehind="SingalProduct.aspx.cs" Inherits="E_Shopping.Website.SingalProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Page Banner Start-->
    <div class="page-banner" style="background-image: url(assets/images/banner.jpg);">
        <div class="container">
            <div class="page-banner-content text-center">
                <h2 class="title">Shop Single</h2>
                <ol class="breadcrumb justify-content-center">
                    <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Shop</a></li>
                    <li class="breadcrumb-item active" aria-current="page"></li>
                </ol>
            </div>
        </div>
    </div>
    <!--Page Banner End-->

    <!--Shop Single Start-->
    <div class="shop-single-page section-padding-4">
        <div class="container">

            <asp:Repeater ID="rSingalProduct" OnItemCommand="rSingalProduct_ItemCommand" runat="server">
                <ItemTemplate>
                    <!--Shop Single Start-->
                    <div class="row justify-content-center">
                        <div class="col-lg-6 col-md-8">

                            <div class="shop-image">
                                <div class="shop-single-preview-image">
                                    <img class="product-zoom" src='<%#E_Shopping.Utils.GetImageUrl ( Eval("ImageUrl")) %>' alt="">
                                </div>
                                <div id="gallery_01" class="shop-single-thumb-image shop-thumb-active swiper-container">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide single-product-thumb">
                                            <a class="active">
                                                <img src='<%# E_Shopping.Utils.GetImageUrl ( Eval("ImageUrl"))%>' alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide single-product-thumb">
                                            <a>
                                                <img src='<%# E_Shopping.Utils.GetImageUrl ( Eval("ImageUrl")) %>' alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide single-product-thumb">
                                            <a>
                                                <img src='<%# E_Shopping.Utils.GetImageUrl ( Eval("ImageUrl")) %>' alt="">
                                            </a>
                                        </div>
                                        <div class="swiper-slide single-product-thumb">
                                            <a>
                                                <img src='<%# E_Shopping.Utils.GetImageUrl ( Eval("ImageUrl")) %>' alt="">
                                            </a>
                                        </div>
                                    </div>


                                </div>
                            </div>

                        </div>
                        <div class="col-lg-6">
                            <div class="shop-single-content">
                                <h3 class="title"><%# Eval("Name") %></h3>

                                <div class="thumb-price">
                                    <span class="current-price"><%# Eval("Price") %></span>

                                </div>
                                <p><%# Eval("Description") %>.</p>

                                <ul class="product-additional-information">
                                    <li>
                                        <button><i class="ti-ruler-pencil"></i>Size Guide</button></li>
                                    <li>
                                        <button><i class="fa fa-truck"></i>Shipping</button></li>
                                    <li>
                                        <button><i class="ti-email"></i>Ask About This product </button>
                                    </li>
                                </ul>

                                <div class="product-quantity d-flex flex-wrap align-items-center">
                                    <span class="quantity-title">Quantity: </span>
                                    <form action="#">
                                        <div class="quantity d-flex">
                                            <button type="button" class="sub"><i class="ti-minus"></i></button>
                                            <input type="text" value="1" />
                                            <button type="button" class="add"><i class="ti-plus"></i></button>
                                        </div>
                                    </form>

                                </div>
                                <br />
                                <div class="addcart-btn">
                                    <asp:LinkButton ID="lbAddToCart" runat="server" class="btn btn-primary" CommandName="addToCart" CommandArgument='<%# Eval("ProductId") %>'>
                                        Add to cart
                                    </asp:LinkButton>
                                </div>
                                <div class="social-share">
                                    <span class="share-title">Share:</span>
                                    <ul class="social">
                                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Shop Single End-->
                </ItemTemplate>
            </asp:Repeater>




        </div>
    </div>
    <!--Shop Single End-->


    <!--New Product Start-->
    <div class="new-product-area section-padding-2">
    </div>
    <!--New Product End-->



    <!--Brand Start-->
    <div class="brand-area">
    </div>
</asp:Content>
