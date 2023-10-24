<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="TCC_euquero.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/index.css" />
    <title>Eu Quero - Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
        <div class="banner">
            <div>
                <h1 class="tituloMaior tituloBanner">bem vindo ao site !!</h1>
                <p class="tituloMenor textoBanner">Descubra uma experiência única que irá transformar sua vida. Explore nosso site e mergulhe em um mundo de possibilidades infinitas. Não espere mais, dê o primeiro passo e comece a sua jornada conosco.</p>
                <div>
                    <button class=" btnCadastrar"> Cadastrar <img src="imagens/index/seta.png"></button>
                </div>
            </div>

            <img src="imagens/index/bannerCadastro.png" >
        </div>
    

        <div class="conteudo">
            <div class="categoriasTt">
                <h1 class="tituloMaior"> Categorias </h1>

                <div class="carrossel">
                    <section class="categorias"> 
                        <img src="imagens/index/imoveis.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Imóveis</p>
                    </section>

                    <section class="categorias"> 
                        <img src="imagens/index/armchair.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Arte e Decoração</p>
                    </section>

                    <section class="categorias"> 
                        <img src="imagens/index/car.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Veiculos</p>
                    </section>

                    <section class="categorias"> 
                        <img src="imagens/index/bus.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Caminhões e ônibus</p>
                    </section>

                    <section class="categorias"> 
                        <img src="imagens/index/ship.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Embarcações</p>
                    </section>

                    <section class="categorias"> 
                        <img src="imagens/index/microwave.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Eletro</p>
                    </section>

                    <section class="categorias"> 
                        <img src="imagens/index/tractor.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Máquinas Agrícolas</p>
                    </section>

                    <section class="categorias"> 
                        <img src="imagens/index/pc.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Tecnologia</p>
                    </section>

                    <section class="categorias"> 
                        <img src="imagens/index/reciclagem.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Reciclagem</p>
                    </section>

                    <section class="categorias"> 
                        <img src="imagens/index/factory.png" class="iconeCarrossel"> <p class="txtCategoria tituloMenor">Industrial</p>
                    </section>
                </div>
            </div>


            <h1 class="tituloMaior">Compre já</h1>
    
            <div class="produtosCompreJa">
                <asp:Literal ID="litCardProduto" runat="server"></asp:Literal>
            </div>
        </div>
</asp:Content>
