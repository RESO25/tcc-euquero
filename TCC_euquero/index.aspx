<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="TCC_euquero.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/index.css" />
    <title>Eu Quero | Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
        <div class="banner">
            <div>
                <h1 class="tituloMaior tituloBanner">bem vindo ao site !!</h1>
                <p class="tituloMenor textoBanner">Descubra uma experiência única que irá transformar sua vida. Explore nosso site e mergulhe em um mundo de possibilidades infinitas. Não espere mais, dê o primeiro passo e comece a sua jornada conosco.</p>
                <div>
                    <a href="cadastro.aspx" class=" btnCadastrar"> Cadastrar <img src="imagens/index/seta.png"></a>
                </div>
            </div>

            <img src="imagens/index/bannerCadastro.png" >
        </div>
    

        <div class="conteudo">
            <div class="categoriasTt">
                <h1 class="tituloMaior"> Categorias </h1>

                <div class="carrossel">
                    <section class="categorias"> 
                        <a href="categoria.aspx?cdCategoria=1"><img src="imagens/categorias/1.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Imóveis</p></a>
                    </section>

                    <section class="categorias"> 
                        <a href="categoria.aspx?cdCategoria=2"><img src="imagens/categorias/2.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Arte e Decoração</p></a>
                    </section>

                    <section class="categorias"> 
                        <a href="categoria.aspx?cdCategoria=3"><img src="imagens/categorias/3.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Veiculos</p></a>
                    </section>

                    <section class="categorias"> 
                        <a href="categoria.aspx?cdCategoria=4"><img src="imagens/categorias/4.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Caminhões e ônibus</p></a>
                    </section>

                    <section class="categorias"> 
                        <a href="categoria.aspx?cdCategoria=5"><img src="imagens/categorias/5.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Embarcações</p></a>
                    </section>

                    <section class="categorias"> 
                        <a href="categoria.aspx?cdCategoria=6"><img src="imagens/categorias/6.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Eletro</p></a>
                    </section>

                    <section class="categorias"> 
                        <a href="categoria.aspx?cdCategoria=7"><img src="imagens/categorias/7.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Máquinas Agrícolas</p></a>
                    </section>

                    <section class="categorias"> 
                        <a href="categoria.aspx?cdCategoria=8"><img src="imagens/categorias/8.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Tecnologia</p></a>
                    </section>

                    <section class="categorias"> 
                        <a href="categoria.aspx?cdCategoria=9"><img src="imagens/categorias/9.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Reciclagem</p></a>
                    </section>

                    <section class="categorias"> 
                        <a href="categoria.aspx?cdCategoria=10"><img src="imagens/categorias/10.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Industrial</p></a>
                    </section>
                </div>
            </div>


            <h1 class="tituloMaior">Compre já</h1>
    
            <div class="produtosCompreJa">
                <asp:Literal ID="litCardProduto" runat="server"></asp:Literal>
            </div>
        </div>
</asp:Content>
