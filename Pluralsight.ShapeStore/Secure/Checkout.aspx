<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Pluralsight.ShapeStore.Secure.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Seroter Shape Store :: Checkout</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding: 10px 10px 10px 10px">
        <h1>Checkout</h1>
        Purchase the items in your shopping cart and get them to your door quickly!
        <h3>Customer Details</h3>
        <p>Shipping details from the account settings.</p>
        <div class="well well-large">
            <asp:Label ID="lblName" Font-Bold="true" runat="server" Text="Name"></asp:Label>
            <br />
            <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
            <br />
            <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
            <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
            <asp:Label ID="lblPostal" runat="server" Text="Postal"></asp:Label>
        </div>

        <h3>Payment Details</h3>
        Choose a credit card for payment.
        <table style="width: 750px;">
            <tr>
                <td style="font-weight:bold">Credit Card Type:</td>
                <td>
                    <asp:DropDownList ID="ddlCcType" runat="server">
                        <asp:ListItem>Visa</asp:ListItem>
                        <asp:ListItem>Mastercard</asp:ListItem>
                        <asp:ListItem>American Express</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="font-weight:bold">Credit Card Number:</td>
                <td>
                    <asp:TextBox ID="txtCcNumber" CssClass="input-large" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="font-weight:bold">Expiration Date:</td>
                <td>
                    <asp:TextBox ID="txtExpire" CssClass="input-small" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <h3>Shopping Cart</h3>
        <asp:GridView CssClass="table table-bordered table-striped" ID="gvCart" Width="600px" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField HeaderText="Product" DataField="ProductId" />
                <asp:BoundField HeaderText="Product Name" DataField="ProductName" />
                <asp:BoundField HeaderText="Quantity" DataField="Quantity" />
                <asp:BoundField HeaderText="Price" DataField="PriceWhenAdded" />
                <asp:BoundField HeaderText="Date Added" DataField="DateAdded" />
                <asp:ButtonField ButtonType="link" ControlStyle-CssClass="icon-remove" Text="" CommandName="RemoveItem" />
            </Columns>
        </asp:GridView>
        <div style=" text-align:center">
            <asp:Button ID="btnPurchase" runat="server" CssClass="btn btn-primary btn-large" Text="Buy now!" OnClick="btnPurchase_Click" />
        </div>
    </div>
</asp:Content>
