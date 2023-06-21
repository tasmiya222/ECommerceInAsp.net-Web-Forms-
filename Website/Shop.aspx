<%@ Page Title="" Language="C#" MasterPageFile="~/Website/Main.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="E_Shopping.Website.Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Page Banner Start-->
    <div class="page-banner" style="background-image: url(assets/images/bannner.jpg);">
        <div class="container">
            <div class="page-banner-content text-center">
                <h2 class="title">Products</h2>
                <ol class="breadcrumb justify-content-center">
                    <li class="breadcrumb-item"><a href="Defualt.aspx">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Category</li>
                </ol>
            </div>
        </div>
    </div>
    <!--Page Banner End-->

    <!--Shop Start-->
    <div class="shop-page section-padding-6">
        <div class="container">
            <div class="align-self-end">
                <asp:Label ID="lbMsg" runat="server" visiable="false"></asp:Label>
            </div>
            <!--Shop Top Bar Start-->
            <div class="shop-top-bar d-sm-flex align-items-center justify-content-between">
                <div class="top-bar-btn">
                    <ul class="nav" role="tablist">
                        <li class="nav-item"><a class="nav-link grid active" data-toggle="tab" href="#grid" role="tab"></a></li>
                        <li class="nav-item"><a class="nav-link list" data-toggle="tab" href="#list" role="tab"></a></li>
                    </ul>
                </div>
                <div class="top-bar-sorter">
                    <div class="sorter-wrapper d-flex align-items-center">
                        <label>Sort by:</label>
                        <select class="sorter wide" name="SortBy" id="SortBy">
                            <option value="manual">Featured</option>
                            <option value="best-selling">Best Selling</option>
                            <option value="title-ascending">Alphabetically, A-Z</option>
                            <option value="title-descending">Alphabetically, Z-A</option>
                            <option value="price-ascending">Price, low to high</option>
                            <option value="price-descending">Price, high to low</option>
                            <option value="created-descending">Date, new to old</option>
                            <option value="created-ascending">Date, old to new</option>
                        </select>
                    </div>
                </div>
                <div class="top-bar-page-amount">
                    <p>Showing 1 - 9 of 10 result</p>
                </div>
            </div>
            <!--Shop Top Bar End-->


            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="grid" role="tabpanel">
                    <div class="row">
                        <asp:Repeater ID="rShop" runat="server" OnItemCommand="rShop_ItemCommand">
                            <ItemTemplate>
                                <div class="col-lg-4 col-sm-6">

                                    <div class="single-product">
                                        <div class="product-image">
                                           

                                            <asp:LinkButton ID="LinkButton2" PostBackUrl='<%# "SingalProduct.aspx?id="+Eval("ProductId") %>' runat="server">
                                             <img alt=""  src='<%# E_Shopping.Utils.GetImageUrl ( Eval("ImageUrl")) %>' />
                                        
                                            </asp:LinkButton>
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

                                            <h4 class="product-name"><a>
                                                <asp:LinkButton ID="LinkButton1" PostBackUrl='<%# "SingalProduct.aspx?id="+Eval("ProductId") %>' runat="server"><%# Eval("Name") %>


                                                </asp:LinkButton></a></h4>
                                            <div class="price-box">
                                                <span class="current-price"><%# Eval("Price") %></span>

                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
</div>
        </div>
    </div>
    <!--Shop End-->

</asp:Content>
