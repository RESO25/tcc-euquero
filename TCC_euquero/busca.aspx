<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="busca.aspx.cs" Inherits="TCC_euquero.busca" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/busca.css" />
    <title>Eu Quero | Busca</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="conteudo">
     
        <div class="titulo">
            <img src="imagens/header/search.png" class="iconCategoria">
            <h1>Busca por "<asp:Literal ID="litNomeBusca" runat="server"></asp:Literal>"</h1>
        </div>


        <h3><asp:Literal ID="litTotalResultados" runat="server"></asp:Literal></h3>
        
        <div class="produtosCompreJa">
            <asp:Literal ID="litCardProduto" runat="server"></asp:Literal>        
        </div>

    </div>
</asp:Content>
