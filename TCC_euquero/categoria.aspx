<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="categoria.aspx.cs" Inherits="TCC_euquero.categoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><asp:Literal ID="litTitle" runat="server"></asp:Literal></title>
    <link rel="stylesheet" href="css/categoria.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <div class="conteudo">
     
        <div class="titulo">
            <%--<img src="img\categoriasIcons\imoveis.png" class="iconCategoria">--%>
            <asp:Literal ID="litImgCategoria" runat="server"></asp:Literal>
            <h1><asp:Literal ID="litNomeCategoria" runat="server"></asp:Literal></h1>
        </div>


        <div class="filtrosBusca">

            <div class="areaInput">
                <h2>Tipo de Evento</h2>
                <select id="tipoEvento" name="tipoEvento" class="input">
                    <option value="todosEventos">Todos os Eventos</option>
                    <option value="compreJa">Compre Já</option>
                    <option value="leilao">Leilão</option>
                </select>            
            </div>


            <div class="areaInput">
                <h2>CEP</h2>        
                <input type="number" placeholder="digite o cep" class="input">
            </div>   
            

            <div class="areaInput">
                <h2>Busque pelo Raio</h2>        
                <input type="text" placeholder="apenas essa área" class="input">
            </div>


            <div class="areaInput">
                <h2>Preço</h2>        
                <input type="number" placeholder="todos os preços" class="input">
            </div>


            <div class="areaBtn">
                <button class="btnAdicionarSaldo">Buscar</button>
            </div>  


        </div>


        <h3>Foram Encontrados <asp:Literal ID="litTotalResultados" runat="server"></asp:Literal> resultados</h3>

    </div>
</asp:Content>
