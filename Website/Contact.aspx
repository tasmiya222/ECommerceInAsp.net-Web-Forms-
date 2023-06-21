<%@ Page Title="" Language="C#" MasterPageFile="~/Website/Main.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="E_Shopping.Website.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <!--Page Banner Start-->
        <div class="page-banner" style="background-image: url(assets/images/banner.jpg);">
            <div class="container">
                <div class="page-banner-content text-center">
                    <h2 class="title">Contact</h2>
                    <ol class="breadcrumb justify-content-center">
                        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Contact</li>
                    </ol>
                </div>
            </div>
        </div>
        <!--Page Banner End-->

        <!--Contact Map Start-->
        <div class="contact-map section-padding">
            <div id="contact-map"></div>
        </div>
        <!--Contact Map End-->

        <!--Contact Start-->
        <div class="contact-page section-padding-5">
            <div class="container">
                <div class="contact-info">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="section-title text-center">
                                <h2 class="title">Get office info</h2>
                                <p>Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima.</p>
                            </div>
                        </div>
                    </div>

                    <div class="contact-info-content">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="single-contact-info text-center">
                                    <i class="fa fa-fax"></i>
                                    <h4 class="title"> Address </h4>
                                    <p>666 5th Ave New York, <br> NY, United </p>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="single-contact-info text-center">
                                    <i class="fa fa-phone"></i>
                                    <h4 class="title"> Phone Number </h4>
                                    <p><a href="tel:7162981822">+88 716-298-1822 </a></p>
                                    <p><a href="tel:7162981822">+88 716-298-1822 </a></p>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="single-contact-info text-center">
                                    <i class="fa fa-envelope"></i>
                                    <h4 class="title"> Email Address </h4>
                                    <p><a href="mailto:info@eshop.com"> info@eshop.com </a></p>
                                    <p><a href="mailto:info@eshop.com"> info@eshop.com </a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="contact-form">
                 
                        <div class="row">
                            <div class="col-md-6">
                                <div class="single-form">
                                    <asp:TextBox ID="txt_name" placeholder="Name"  runat="server"></asp:TextBox>
                                    
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is Required*" ForeColor="Red" ControlToValidate="txt_name" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                    
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="single-form">
                                     <asp:TextBox ID="txt_subject" placeholder="Subject"  runat="server"></asp:TextBox>
                                     <br />
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Subject is Required*" ForeColor="Red" ControlToValidate="txt_subject" SetFocusOnError="true" Display="Dynamic" ></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="single-form">
                                  <asp:TextBox ID="txt_email" placeholder="Email" TextMode="Email"  runat="server"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email is Required*" ControlToValidate="txt_email" ForeColor="Red" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="single-form">
                                 <asp:TextBox ID="txt_message" placeholder="Messge"  runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Message is Requried*" ControlToValidate="txt_message" ForeColor="Red" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <p class="form-message"></p>
                            <div class="col-md-12">
                                <div class="single-form text-center">
                                    <asp:Button ID="btnSend" runat="server"   class="btn btn-dark" Text="Message Send" OnClick="btnSend_Click" />
                                   
                                </div>
                            </div>
                        </div>
                  
                </div>
            </div>
        </div>
        <!--Contact End-->


</asp:Content>
