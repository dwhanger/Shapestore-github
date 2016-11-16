<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Pluralsight.ShapeStore.Cart1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Seroter Shape Store :: Shopping Cart</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding: 10px 10px 10px 10px">
        <h1>Shopping Cart</h1>
        <asp:GridView CssClass="table table-bordered table-striped" ID="gvCart" Width="600px" runat="server" AutoGenerateColumns="False" OnRowCommand="gvCart_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="Product" DataField="ProductId" />
                <asp:BoundField HeaderText="Product Name" DataField="ProductName" />
                <asp:BoundField HeaderText="Quantity" DataField="Quantity" />
                <asp:BoundField HeaderText="Price" DataField="PriceWhenAdded" />
                <asp:BoundField HeaderText="Date Added" DataField="DateAdded" />
                <asp:ButtonField ButtonType="link" ControlStyle-CssClass="icon-remove" Text="" CommandName="RemoveItem" />
            </Columns>
        </asp:GridView>
        <a href="Secure/Checkout.aspx" class="btn btn-large btn-primary">checkout!</a>
    </div>
</asp:Content>
