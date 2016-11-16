<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Pluralsight.ShapeStore.Default1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Seroter Shape Store :: Home Page</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hero-unit">
        <h1>Welcome to the Shape Store!</h1>
        <p>Your one stop shop for the best variety of shapes for purchase!</p>
    </div>
    <div style="position: relative">
        <asp:ListView ID="catalogList" runat="server" GroupItemCount="4">
            <GroupTemplate>
                <ul class="thumbnails" id="groupPlaceholder" runat="server">
                    <li id="itemPlaceholder" runat="server"></li>
                </ul>
            </GroupTemplate>
            <ItemTemplate>
                <li class="span3">
                    <div class="thumbnail text-center" style="height: 330px;position:relative">
                        <img src="<%# String.Format("{0}", Eval("imageReference")) %>" alt="">
                        <h3>
                            <asp:Label runat="server" ID="label1" Text='<% #Eval("itemName")%>'></asp:Label></h3>
                        <p>
                            <asp:Label runat="server" ID="label2" Text='<% #Eval("longDescription")%>'></asp:Label>
                        </p>
                        <div style="position: absolute; bottom: 5px; left:60px">
                            <a href="<%# String.Format("Cart.aspx?itemid={0}&name={1}&price={2}", Eval("ItemId"),Eval("itemName"), Eval("UnitPrice")) %>" role="button" style="" class="btn btn-primary">Add to cart</a>
                        </div>
                    </div>
                </li>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
