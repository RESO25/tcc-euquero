<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="cadastroAnuncio.aspx.cs" Inherits="TCC_euquero.criaçaoAnuncio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eu Quero | Novo Anúncio</title>
    <link rel="stylesheet" href="css/cadastroAnuncio.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="conteudo">
        <div class="tituloSubtitulo">
            <h1>Criar Anúncio</h1>
            <h2 class="subtitulo">Pense em textos curtos e objetivos</h2>
        </div>    


    <div class="emailDatas">
        <div class="areaInput" id="email">
            <h3>e-mail</h3>
            <input id="txtEmail" type="text"  placeholder="insira seu e-mail" runat="server"/>
        </div>
        </div>


        <div class="datas">
            <%--<div class="areaInput" id="inputComeco">
                <h3>Data de Início</h3>
                <input type="datetime-local" id="inputData">
            </div>--%>

            <div class="areaInput">
                <h3>Data de Encerramento</h3>
                <input id="txtDataEncerramento" class="inputData" type="datetime-local" runat="server" />
            </div>    
        </div>     

    <div class="nomeDesc">
        <div class="areaInput" id="areaNome">
            <h3>Nome</h3>
            <input id="txtNomeProduto" class="nome" type="text" placeholder="Nome do produto" runat="server"/>
        </div>


        <div class="areaInput">
            <h3>Descrição do Produto</h3>
            <input id="descProduto" type="text" placeholder="pense nas principais informações do que você irá anunciar" runat="server"/>
        </div>
    </div>


        <div class="areaInput">
            <h3>Valor Mínimo</h3>
            <input id="txtValorMinimo" class="valor" type="number" placeholder="R$-,--" runat="server"/>
        </div>


        <div class="areaInput">
            <h3>Valor Máximo</h3>
            <input id="txtValorMaximo" class="valor" type="number" placeholder="R$-,--" runat="server"/>
        </div>

        <div class="areaBtn">
            <asp:Button ID="btnCriarAnuncio" class="btnCriarAnuncio" runat="server" Text="Criar" OnClick="btnCriarAnuncio_Click"/>
        </div> 
        </div>
</asp:Content>