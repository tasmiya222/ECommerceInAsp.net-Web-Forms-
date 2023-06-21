<%@ Page Title="" Language="C#" MasterPageFile="~/Website/Main.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="E_Shopping.Website.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <!--Page Banner Start-->
        <div class="page-banner" style="background-image: url(assets/images/banner.jpg);">
            <div class="container">
                <div class="page-banner-content text-center">
                    <h2 class="title">Register</h2>
                    <ol class="breadcrumb justify-content-center">
                        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Register</li>
                    </ol>
                </div>
            </div>
        </div>
        <!--Page Banner End-->

        <!--Register Start-->
        <div class="register-page section-padding-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <div class="login-register-content">
                            <h4 class="title">Creat New Account</h4>

                            <div class="login-register-form">
                               
                                    <div class="single-form">
                                        <label>Name *</label>
                                     <asp:TextBox ID="txt_name"  runat="server"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_name" Display="Dynamic" ErrorMessage="Name Required!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="single-form">
                                        <label>Mobile*</label>
                                        <asp:TextBox ID="txt_mobile" runat="server"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_mobile" Display="Dynamic" ErrorMessage="Mobile Required*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                 <div class="single-form">
                                        <label>Address*</label>
                                        <asp:TextBox ID="txt_address" runat="server"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_address" Display="Dynamic" ErrorMessage="Address Required!!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                 <div class="single-form">
                                        <label>Email*</label>
                                        <asp:TextBox ID="txt_email" runat="server" TextMode="Email"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_email" Display="Dynamic" ErrorMessage="Email Required!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                 <div class="single-form">
                                        <label>PostCode*</label>
                                        <asp:TextBox ID="txt_post" runat="server"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_post" Display="Dynamic" ErrorMessage="PostCode Required!!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                 <div class="single-form">
                                        <label>UserName*</label>
                                        <asp:TextBox ID="txt_user" runat="server"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_user" Display="Dynamic" ErrorMessage="Username Required!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                 <div class="single-form">
                                        <label>Password*</label>
                                        <asp:TextBox ID="txt_pass" runat="server" TextMode="Password"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_pass" Display="Dynamic" ErrorMessage="Password Required!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="single-form">
                                        <asp:Button ID="BtnRegister"   class="btn btn-primary btn-block" runat="server" Text="Register" OnClick="BtnRegister_Click" />
                                      </div>
                                   
                                    <div class="single-form">
                                        <label>Already have an account?</label>
                                        <a href="Login.aspx" class="btn btn-dark btn-block">Log in instead!</a>
                                    </div>
                                <asp:Label ID="lbl_Msg" runat="server"></asp:Label> <div class="single-form">
                                      
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Register End-->

</asp:Content>
