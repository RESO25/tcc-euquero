<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="perfil.aspx.cs" Inherits="TCC_euquero.perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/perfil.css" />
    <title>Eu Quero | Perfil</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
        <div class="conteudo">
        <h1 class="h1Perfil">Perfil</h1>
            <div class="cardsPai">
                    <div class="dadosPessoais">

                        <%-- Dados básicos ---------------------------------------------------------------------------------------------------%>
                            
                        <div class="primeiraSessao">
                                <div class="foto">
                                    <asp:Literal ID="litFotoPerfil" runat="server"></asp:Literal>
                                </div>

                                <div class="nomeEmail">
                                    <h1 class="nomeUsuario"><asp:Literal ID="litNomeUsuario" runat="server"></asp:Literal></h1>
                                    <h1 class="emailUsuario"><asp:Literal ID="litEmailUsuario" runat="server"></asp:Literal></h1>
                                </div>
                            </div>    

                            <%-- Dados Detalhados ---------------------------------------------------------------------------------------------------%>

                            <div class="sessaoDados">
                                <h1 class="titulo">Dados</h1>
                                <br>


                                <div class="nomeAniversario">
                                    <h1 class="info">Nome: </h1> <h1 class="dadoInicial"><asp:Literal ID="litNomeCompletoUsuario" runat="server"></asp:Literal></h1>
                                </div>


                                <div class="CPF_RG">
                                    <h1 class="info">CPF: </h1> <h1 class="dadoInicial"><asp:Literal ID="litCPF" runat="server"></asp:Literal></h1>
                                </div>    
                            </div>

                            <%-- Endereços ---------------------------------------------------------------------------------------------------%>

                            <div class="sessaoDados2">
                                    <h1 class="titulo">Endereço</h1>
                                    <br>


                                    <div class="CEP_Pais_UF_Cidade">
                                        <h1 class="info">CEP: </h1> <h1 class="dadoInicial">
                                            <asp:Literal ID="litCep" runat="server"></asp:Literal></h1>

                                        <h1 class="info">País: </h1> <h1 class="dadoInicial">Brasil</h1>

                                        <h1 class="info">UF: </h1> <h1 class="dadoInicial">
                                            <asp:Literal ID="litUf" runat="server"></asp:Literal></h1>

                                        <h1 class="info">Cidade: </h1> <h1 class="dado">
                                            <asp:Literal ID="litCidade" runat="server"></asp:Literal></h1>
                                    </div>    

                                    <div class="RuaNumeroBloco">
                                        <h1 class="info">Rua: </h1> <h1 class="dadoInicial">
                                            <asp:Literal ID="litRua" runat="server"></asp:Literal></h1>

                                        <h1 class="info">Número: </h1> <h1 class="dadoInicial">
                                            <asp:Literal ID="litNumero" runat="server"></asp:Literal></h1>

                                        <h1 class="info">Complemento: </h1> <h1 class="dado">
                                            <asp:Literal ID="litComplemento" runat="server"></asp:Literal></h1>
                                    </div>    
                            </div>


                            <div class="botoes">
                                <button class="btnEditarEndereco">Editar Endereço</button>

                                <button class="btnSelecionarEndereco">Selecionar Endereço</button>
                            </div>

                    </div>

                    <%-- Dados do saldo ---------------------------------------------------------------------------------------------------%>

                    <div class="cardsdireita">
                            <div class="cardCarteira">
                                <div class="areaSaldoCarteira">
                                        <h1 class="titulo">Carteira</h1>

                                        <div class="infoSaldo">

                                        <h1 class="info">Saldo: </h1> <h1 class="dado"><asp:Literal ID="litSaldo" runat="server"></asp:Literal></h1>
                                    </div>
                                            
                                </div>
                            </div>           

                            <div class="cardCarteira2">
                                <div class="areaCartao">
                                    <h1 class="titulo">Cartão Cadastrado</h1>
                                    
                                    <div class="numeroCartao">
                                        <h1 class="info">Número do Cartão: </h1> <h1 class="dadoInicial"><asp:Literal ID="litNumeroCartao" runat="server"></asp:Literal></h1>
                                    </div>

                                    <div class="CVV">
                                        <h1 class="info">CVV: </h1> <h1 class="dadoInicial"><asp:Literal ID="litCVV" runat="server"></asp:Literal></h1>
                                    </div>

                                    <div class="titular">
                                        <h1 class="info">Titular: </h1> <h1 class="dadoInicial"><asp:Literal ID="litNomeTitular" runat="server"></asp:Literal></h1>
                                    </div>

                                    <div class="dataVencimento">
                                        <h1 class="info">Data de Vencimento: </h1> <h1 class="dadoInicial">
                                            <asp:Literal ID="litDataVencimento" runat="server"></asp:Literal></h1>
                                    </div>

                                </div>                                    
                                    
                                <div class="btns">
                                    <button class="btnSelecionarCartao">Selecionar Cartão</button> 
                                    <button class="btnAdicionarSaldo">Adicionar Saldo</button>
                                </div>    


                            </div>
                            <div>
                                <asp:Button ID="btnSair" CssClass="btnsair" runat="server" Text="Sair" OnClick="btnSair_Click" />
                            </div>
                    </div>
        </div>
        
        <%-- Meus Anúncios --------------------------------------------------------------------------------------------------------------------------------------------%>

        <h2 class="Ttmp"> <a href="cadastroAnuncio.aspx">Meus anúncios</a></h2>

        <div class="produtosCompreJa">
            <asp:Literal ID="litMeusAnuncios" runat="server"></asp:Literal>
        </div>
            
        <%-- Anúncios que participo --------------------------------------------------------------------------------------------------------------------------------------------%>

        <h2 class="Ttmp"> Anúncios que participo</h2>

        <div class="produtosCompreJa">
            <asp:Literal ID="litAnunciosParticipo" runat="server"></asp:Literal>
        </div>

    </div>
</asp:Content>
