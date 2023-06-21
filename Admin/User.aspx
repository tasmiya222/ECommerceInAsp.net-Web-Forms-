<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="E_Shopping.Admin.User" %>
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

                                        <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                            <h4 class="sub-title">Category list</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <asp:Repeater ID="rUser" runat="server"  OnItemCommand="rUser_ItemCommand">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover norwap">
                                                                <thead>
                                                                    <tr>
                                                                        <th scope="col">ID</th>
                                                                        <th scope="col">Name</th>
                                                                        <th scope="col">Email</th>
                                                                        <th scope="col">Mobile</th>
                                                                        <th scope="col">Username</th>
                                                                        <th scope="col">Password</th>
                                                                        <th scope="col">CreatedDate</th>
                                                                        <th scope="col">Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td><%# Eval("UserId") %></td>
                                                                <td><%# Eval("Name") %></td>
                                                                <td><%# Eval("Email") %></td>
                                                                <td><%# Eval("Mobile") %></td>
                                                                <td><%# Eval("Username") %></td>
                                                                <td><%# Eval("Password") %></td>
                                                                <td><%# Eval("CreatedDate") %></td>
                                                                <td>

                                                                    <asp:LinkButton ID="lknDelete" runat="server" CommandArgument='<%# Eval("UserId") %>' CommandName="delete" CssClass="badge badge-danger">Delete</asp:LinkButton>
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
