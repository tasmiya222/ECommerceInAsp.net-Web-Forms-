<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="E_Shopping.Admin.Category" %>

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
                                        <div class="col-sm-6 col-md-4 col-lg-4">
                                            <h4 class="sub-title">Category</h4>
                                            <div>
                                                <div class="form-group">
                                                    <label>Category Name</label>
                                                    <div>
                                                        <asp:TextBox ID="txt_name" placeholder="Enter Category Name*" CssClass="form-control" runat="server"></asp:TextBox>
                                                        <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                                    </div>
                                                </div>
                                                <div class="form-check pl-4">
                                                    <asp:CheckBox ID="cIdActive" Text="&nbsp; IsActive" CssClass="form-check-input" runat="server" />
                                                </div>
                                                <div class="pb-5">
                                                    <asp:Button ID="BtnAdd" runat="server" CssClass="btn btn-info" OnClick="btnAdd_Click" Text="Add" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                            <h4 class="sub-title">Category list</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <asp:Repeater ID="rCategory" runat="server" OnItemDataBound="rCategory_DataBound" OnItemCommand="rCategory_ItemCommand1">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover norwap">
                                                                <thead>
                                                                    <tr>
                                                                        <th scope="col">ID</th>
                                                                        <th scope="col">Category</th>
                                                                        <th scope="col">IsActive</th>
                                                                        <th scope="col">Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td><%# Eval("id") %></td>
                                                                <td><%# Eval("category") %></td>
                                                                <td>
                                                                <asp:Label ID="lblActiveMsg" runat="server" Text='<%# Eval("IsActive") %>'></asp:Label></td>
                                                                <td>
                                                                    <asp:LinkButton ID="lknUpdate" runat="server" PostBackUrl='<%# "Category.aspx?type=edit&id="+Eval("id") %>' CssClass="badge badge-primary">Edit</asp:LinkButton>
                                                                    <asp:LinkButton ID="lknDelete" runat="server" CommandArgument='<%# Eval("id") %>' CommandName="delete" CssClass="badge badge-danger">Delete</asp:LinkButton>
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
