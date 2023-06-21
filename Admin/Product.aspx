<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="E_Shopping.Admin.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        <%--function ImagePerview(input) {
            if (input.files && input.file[0]) {
                var reader = FileReader();
                reader.onload = function (e) {
                    $('#'<%imgProduct.ClientID%>).prop('src', e.target.results)
                        .width(200)
                        .height(200);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }--%>

    </script>
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
                                                    <label>Product Name</label>
                                                    <div>
                                                        <asp:TextBox ID="txt_name" placeholder="Enter Product Name*" CssClass="form-control" runat="server"></asp:TextBox>
                                                        <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                                    </div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is Required!!" ControlToValidate="txt_name" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="form-group">
                                                    <label>Product Description</label>
                                                    <div>
                                                        <asp:TextBox ID="txt_description" TextMode="MultiLine" placeholder="Enter Product Decription*" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Description is Required!" ControlToValidate="txt_description" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                                </div>
                                                <div class="form-group">
                                                    <label>Product Price (Rs)</label>
                                                    <div>
                                                        <asp:TextBox ID="txt_price" placeholder="Enter Product Price*" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Price is Required!!" ControlToValidate="txt_price" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                                </div>
                                                <div class="form-group">
                                                    <label>Product Quantity</label>
                                                    <div>
                                                        <asp:TextBox ID="txt_qty" placeholder="Enter Product Quantity*" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Quantity is Required!" ControlToValidate="txt_qty" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_qty" Display="Dynamic" ErrorMessage="Quantitiy must be a non negative!!" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^([1-9]\d*|0)$"></asp:RegularExpressionValidator>

                                                </div>
                                                    <div class="form-group">
                                                    <label>Product Best Seller</label>
                                                    <div>
                                                        <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">

                                                            <asp:ListItem>Select</asp:ListItem>
                                                            <asp:ListItem>1</asp:ListItem>
                                                            <asp:ListItem>0</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Quantity is Required!" ControlToValidate="txt_qty" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                                 
                                                </div>
                                                <div class="form-group">
                                                    <label>Category ID</label>
                                                    <div>
                                                        <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                                            <asp:ListItem Value="0"> Select Category</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Category is Required!" ControlToValidate="DropDownList1" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                                </div>
                                                <div class="form-group">
                                                    <label>Image</label>
                                                    <div>

                                                        <asp:FileUpload ID="fuProductImage" onchange="ImagePerview(this);" runat="server" />
                                                    </div>

                                                </div>
                                                <div class="form-check pl-4">
                                                    <asp:CheckBox ID="cIdActive" Text="&nbsp; IsActive" CssClass="form-check-input" runat="server" />
                                                </div>
                                                <div class="pb-5">
                                                    <asp:Button ID="BtnAdd" runat="server" CssClass="btn btn-info" OnClick="btnAdd_Click" Text="Add" />
                                                      <asp:Button ID="BtnClear" runat="server" CausesValidation="false" OnClick="BtnClear_Click" CssClass="btn btn-info"  Text="Clear" />
                                                </div>
                                            </div>
                                            <asp:Image ID="imgProduct" CssClass="img-thumbnail" runat="server" />
                                        </div>
                                        <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                            <h4 class="sub-title">Category list</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <asp:Repeater ID="rProduct" runat="server" OnItemDataBound="rProduct_ItemDataBound" OnItemCommand="rProduct_ItemCommand">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover norwap">
                                                                <thead>
                                                                    <tr>
                                                                        <th scope="col">ID</th>
                                                                        <th scope="col">Name</th>
                                                                        <th scope="col">CategoryID</th>
                                                                        <th scope="col">Description</th>
                                                                        <th scope="col">Price</th>
                                                                        <th scope="col">Quantity</th>
                                                                        <th scope="col">ImageUrl</th>
                                                                        <th scope="col">IsActive</th>
                                                                        <th scope="col">Best Seller</th>
                                                                        <th scope="col">Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td><%# Eval("ProductId") %></td>
                                                                <td><%# Eval("Name") %></td>
                                                                <td><%# Eval("CategoryId") %></td>
                                                                <td><%# Eval("Description") %></td>
                                                                <td><%# Eval("Price") %></td>
                                                                <td>
                                                                    <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label></td>
                                                                <td>
                                                                    <img alt="" width="50" height="50" src="<%# E_Shopping.Utils.GetImageUrl ( Eval("ImageUrl")) %>" /></td>
                                                                <td>
                                                                    <asp:Label ID="lblActiveMsg" runat="server" Text='<%# Eval("IsActive") %>'></asp:Label></td>
                                                                 <td><%# Eval("Best_Seller") %></td>
                                                                <td>

                                                                    <%--<asp:LinkButton ID="lbl" runat="server" CommandArgument='<%# Eval("ProductId") %>' CausesValidation="false" CommandName="Edit" Visible="false" CssClass="badge badge-info">Edit</asp:LinkButton>--%>

                                                                    <asp:LinkButton ID="lknUpdate" runat="server" CommandArgument='<%# Eval("ProductId") %>' CausesValidation="false" CommandName="Edit" CssClass="badge badge-primary">Edit</asp:LinkButton>
                                                                    <asp:LinkButton ID="lknDelete" runat="server" CommandArgument='<%# Eval("ProductId") %>' CausesValidation="false" CommandName="delete" CssClass="badge badge-danger">Delete</asp:LinkButton>
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
