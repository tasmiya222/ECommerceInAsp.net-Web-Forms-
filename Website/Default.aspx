<%@ Page Title="" Language="C#" MasterPageFile="~/Website/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="E_Shopping.Website.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Slider Start-->
    <div class="slider-area">
        <div class="swiper-container slider-active">
            <div class="swiper-wrapper">
                <div class="single-slider swiper-slide animation-style-01" style="background-image: url(assets/images/slider/slider-2.jpg);">
                    <div class="container">
                        <div class="slider-content">
                        </div>
                    </div>
                </div>
                <div class="single-slider swiper-slide animation-style-01" style="background-image: url(assets/images/slider/slider-1.jpg);">
                    <div class="container">
                        <div class="slider-content">
                        </div>
                    </div>
                </div>
            </div>
            <!--Swiper Wrapper End-->

            <!-- Add Arrows -->
            <div class="swiper-next"><i class="fa fa-angle-right"></i></div>
            <div class="swiper-prev"><i class="fa fa-angle-left"></i></div>

            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>

        </div>
        <!--Swiper Container End-->
    </div>
    <!--Slider End-->
    <!--New Product Start-->
    <div class="new-product-area section-padding-2">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-9 col-sm-11">
                    <div class="section-title text-center">
                        <h2 class="title">New Products</h2>
                        <p>A perfect blend of creativity, ,communication, happiness and love. Let us arrange a smile for you.</p>
                    </div>
                </div>
            </div>
            <div class="product-wrapper">
                <div class="swiper-container product-active">
                    <div class="swiper-wrapper">
                        <asp:Repeater ID="rLatestProduct" OnItemCommand="rLatestProduct_ItemCommand" runat="server">
                            <ItemTemplate>
                                <div>
                                    <div class="single-product">
                                        <div class="product-image">
                                            <a>
                                                <asp:LinkButton ID="LinkButton1" PostBackUrl='<%# "SingalProduct.aspx?id="+Eval("ProductId") %>' runat="server">
                                        <img src='<%# E_Shopping.Utils.GetImageUrl(Eval("ImageUrl")) %>' alt="">
                                                </asp:LinkButton>
                                            </a>
                                            <div class="action-links">
                                                <li>
                                                    <asp:LinkButton ID="lbAddToCart" runat="server" CommandName="addToCart" CommandArgument='<%# Eval("ProductId") %>'>

                                                        <i class="icon-shopping-bag"></i>
                                                    </asp:LinkButton>
                                                </li>
                                            </div>
                                        </div>
                                        <asp:HiddenField ID="hdnQty" Value="1" runat="server" />
                                        <div class="product-content text-center">

                                            <h4 class="product-name"><a> <asp:LinkButton ID="LinkButton2" PostBackUrl='<%# "SingalProduct.aspx?id="+Eval("ProductId") %>' runat="server"><%# Eval("Name") %></asp:LinkButton></a></h4>
                                            <div class="price-box">
                                                <span class="current-price">Rs.<%# Eval("Price") %></span>
                                             
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <!-- Add Arrows -->
                    <div class="swiper-next"><i class="fa fa-angle-right"></i></div>
                    <div class="swiper-prev"><i class="fa fa-angle-left"></i></div>
                </div>
            </div>
        </div>
    </div>

    <!--New Product End-->
    <!--About Start-->
    <div class="about-area section-padding-4">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="about-image">
                        <img src="assets/images/about/Banner.png" alt="">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about-content">
                        <h2 class="title">Making Your Skin Extra Special! Let us arrange a smile For Her.</h2>
                        <p>Get that silky smooth skin in an affordable price </p>
                        <ul>
                            <li>Hand picked just for you. </li>
                            <li>Hand picked just for you. </li>
                            <li>Hand picked just for. </li>
                        </ul>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--About End-->
    <!--New Product Start-->
    <div class="features-product-area section-padding-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-9 col-sm-11">
                    <div class="section-title text-center">
                        <h2 class="title">Best Seller Items</h2>
                        <p>Don't be slow! Our prices are low.</p>
                    </div>
                </div>
            </div>
            <div class="product-wrapper">
                <div class="tab-content product-items-tab">
                    <div class="tab-pane fade show active" id="tab1" role="tabpanel">
                        <div class="swiper-container product-active">
                            <div class="swiper-wrapper">
                                <asp:Repeater ID="rBestSeller" OnItemCommand="rBestSeller_ItemCommand"  runat="server">
                                    <ItemTemplate>
                                <div >
                                    <div class="single-product">
                                        <div class="product-image">
                                            <a>
                                                <asp:LinkButton ID="LinkButton1" PostBackUrl='<%# "SingalProduct.aspx?id="+Eval("ProductId") %>' runat="server">
                                                     <img src='<%# E_Shopping.Utils.GetImageUrl(Eval("ImageUrl")) %>' alt="">
                                                </asp:LinkButton>
                                            </a>
                                            <div class="action-links">
                                                <ul>
                                                    <li>
                                                    <asp:LinkButton ID="lbAddToCart" runat="server" CommandName="addToCart" CommandArgument='<%# Eval("ProductId") %>'>
                                                        <i class="icon-shopping-bag"></i>
                                                    </asp:LinkButton>
                                                </li>
                                                   
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product-content text-center">
                                          
                                            <h4 class="product-name"><a> <asp:LinkButton ID="LinkButton2" PostBackUrl='<%# "SingalProduct.aspx?id="+Eval("ProductId") %>' runat="server"><%# Eval("Name") %></asp:LinkButton></a></h4>
                                            <div class="price-box">
                                                <span class="current-price">Rs.<%# Eval("Price") %></span>
                                              
                                            </div>
                                        </div>
                                    </div>

                                    
                                </div>
                                    </ItemTemplate>
                      </asp:Repeater>
                            </div>

                            <!-- Add Arrows -->
                            <div class="swiper-next"><i class="fa fa-angle-right"></i></div>
                            <div class="swiper-prev"><i class="fa fa-angle-left"></i></div>
                        </div>
                    </div>
            
                </div>
            </div>
        </div>
    </div>
    <!--New Product End-->



    <!--Testimonial Start-->
    <div class="testimonial-area" style="background-image: url(assets/images/b2.png);">
        <div class="container">
            <div class="swiper-container testimonial-active">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                    </div>
                    <div class="swiper-slide">
                        <div class="single-testimonial text-center">
                            <p></p>

                            <div class="testimonial-author">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Add Arrows -->

            </div>
        </div>
    </div>
    <!--Testimonial End-->

    <!--Experts Start-->
    <div class="experts-area section-padding-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-9 col-sm-11">
                    <div class="section-title text-center">
                        <h2 class="title">Makeup/SkinCare Experts</h2>
                        <p>A perfect blend of creativity, energy, communication, happiness and love. Let us arrange a smile for you.</p>
                    </div>
                </div>
            </div>
            <div class="expert-wrapper">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="single-expert text-center">
                            <div class="expert-image">
                                <img src="assets/images/experts/makeup.png" alt="">
                            </div>
                            <div class="expert-content">
                                <h4 class="name">Mussarat Misbah</h4>
                                <p>Makeup Artist</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single-expert text-center">
                            <div class="expert-image">
                                <img src="assets/images/experts/skincare.png" alt="">
                            </div>
                            <div class="expert-content">
                                <h4 class="name">Shaista Lohdi</h4>
                                <p>Skin Expert</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single-expert text-center">
                            <div class="expert-image">
                                <img src="assets/images/experts/makeup-2.png" alt="">
                            </div>
                            <div class="expert-content">
                                <h4 class="name">Kashif Aslam</h4>
                                <p>Kashee Artist</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="single-expert text-center">
                            <div class="expert-image">
                                <img src="assets/images/experts/skin.png" alt="">
                            </div>
                            <div class="expert-content">
                                <h4 class="name">Dr Bilquis Shiakh</h4>
                                <p>Skin Expert</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Experts End-->

</asp:Content>
