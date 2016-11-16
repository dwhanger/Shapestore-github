<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PaymentConfirmation.aspx.cs" Inherits="Pluralsight.ShapeStore.Secure.PaymentConfirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Seroter Shape Store :: Checkout Confirmation</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding:10px 10px 10px 10px">
        <h1>Thank you for your payment!</h1>
        <p>
            <a href="../Default.aspx" class="btn btn-large btn-primary">Go Home</a>
        </p>
    </div>
</asp:Content>
