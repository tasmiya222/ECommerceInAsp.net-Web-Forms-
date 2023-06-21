<%@ Page Title="" Language="C#" MasterPageFile="~/Website/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="E_Shopping.Website.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <!--Page Banner Start-->
        <div class="page-banner" style="background-image: url(assets/images/banner.jpg);">
            <div class="container">
                <div class="page-banner-content text-center">
                    <h2 class="title">Login</h2>
                    <ol class="breadcrumb justify-content-center">
                        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Login</li>
                    </ol>
                </div>
            </div>
        </div>
        <!--Page Banner End-->

        <!--Login Start-->
        <div class="login-page section-padding-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <div class="login-register-content">
                            <h4 class="title">Login to Your Account</h4>

                            <div class="login-register-form">
                             
                                    <div class="single-form">
                                        <label>Username&nbsp; *</label>
                                        <asp:TextBox ID="txt_user" runat="server"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_user" Display="Dynamic" ErrorMessage="UserName Requires!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="single-form">
                                        <label>Password*</label>
                                        <asp:TextBox ID="txt_pass" runat="server" TextMode="Password"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_pass" Display="Dynamic" ErrorMessage="Password Required!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="single-form">
                                        <asp:Button ID="BtnLogin" class="btn btn-primary btn-block" runat="server" Text="Login" OnClick="BtnLogin_Click" />
                                      
                                    </div>
                                <asp:Label ID="lbl_Msg" runat="server" ></asp:Label>
                                    <div class="single-form">
                                        <label>You don't have account ?</label>
                                        <a href="Register.aspx" class="btn btn-dark btn-block">Create Account Now</a>
                                    </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Login End-->
</asp:Content>
