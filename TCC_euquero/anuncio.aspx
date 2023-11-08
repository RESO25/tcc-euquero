<%@ Page Title="" Language="C#" MasterPageFile="~/modelo.Master" AutoEventWireup="true" CodeBehind="anuncio.aspx.cs" Inherits="TCC_euquero.anuncio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/anuncio.css" />
    <link rel="stylesheet" href="css/input.css" />
    <title>Eu Quero | Anúncio</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="conteudo">
        <h1 class="tituloproduto"><asp:Literal ID="litNomeProduto" runat="server"></asp:Literal></h1>

        <div class="areaInfoProduto">
            <div class="galeriadefotos">
                <asp:Literal ID="litImgPrincipal" runat="server"></asp:Literal>
                <div class="maisfotoProduto ">
                    <asp:Literal ID="litImgExtras" runat="server"></asp:Literal>
                </div>
            </div>

            <div class="cardLeilao">
                <section class="infoDataLeilao ">
                    <section class="dataEncerramentoLeilao">
                        <h2><asp:Literal ID="litTermina" runat="server">Leilão termina em:</asp:Literal></h2>
                    </section>

                    <div class="diasHorasMinutos">
                        <section class="dias">
                            <h3><asp:Literal ID="litDiasRestantes" runat="server"></asp:Literal></h3>
                            <h3>dia(s)</h3>
                        </section>

                        <section class="horas">
                            <h3><asp:Literal ID="litHorasRestantes" runat="server"></asp:Literal></h3>
                            <h3>hora(s)</h3>
                        </section>

                        <section class="minutos">
                            <h3><asp:Literal ID="litMinutosRestantes" runat="server"></asp:Literal></h3>
                            <h3>minuto(s)</h3>
                        </section>
                    </div>   
                </section>     

                <section class="participantesLances">
                    <h4 class="participantes margins">Participantes: <asp:Literal ID="litParticipantes" runat="server"></asp:Literal></h4>    
                        
                    <h4 class="lances margins">Lances: <asp:Literal ID="litLances" runat="server"></asp:Literal></h4>
                </section>

                <section class="infoLance">
                    <div class= "parteLanceAtual"> 
                        <h5 class="lanceAtual">Lance Atual:    
                            <strong id="lanceAtual" class="valorLance">
                                <asp:Literal ID="litLanceAtual" runat="server"></asp:Literal>
                            </strong>
                        </h5>  
                    </div>

                    <div class="parteGanhadorAtual">
                        <h5 class="ganhadorAtual">Ganhador Atual: </h5>     
                        <strong><asp:Literal ID="litGanhador" runat="server"></asp:Literal></strong>
                    </div>
                </section>

                <section class="darLance">
                    <br />

                <asp:Literal ID="litMin" runat="server">
                <div class="inputMinMax">
                    <%--<asp:ImageButton ID="btnMenos" runat="server" ImageUrl="~/imagens/anuncio/botaoMenos.png" />--%>
                    <button type="button" id="menos" onclick="less()"><img src="/imagens/anuncio/botaoMenos.png" /></button>
                </asp:Literal>
                    <div>
                        <asp:TextBox ID="txtLance" runat="server" CssClass="num"></asp:TextBox>
                    </div>

                <asp:Literal ID="litMax" runat="server">
                    <%--<asp:ImageButton ID="btnMais" runat="server" ImageUrl="~/imagens/anuncio/botaoMais.png" />--%>
                    <button type="button" id="mais" onclick="more()"><img src="/imagens/anuncio/botaoMais.png" /></button>
                </div>
                </asp:Literal>
                
                <asp:Button ID="btnDarLance" runat="server" Text="Dar Lance" CssClass="btnDarLance" OnClick="btnDarLance_Click" />

                </section>

                <%--<section class="icConfirmacaoLance">
                    <label class="switch">
                        <input type="checkbox">
                        <span class="slider round"></span>
                    </label>

                    <h2 class="txtDesativaLance">Desativar Confirmação de Lance</h2>
                </section>--%>

                <section class="infoAbertura">
                    <h3 class="margins">Informações de Abertura</h3>
                    
                    <section class="leiloeiro">  
                        <h3 class="margins">Leiloeiro: </h3> 
                        
                        <h4 class="info">
                            <asp:Literal ID="litLeiloeiro" runat="server"></asp:Literal>
                        </h4>  
                    </section>

                    <section class="valorInicial">  
                        <h3 class="margins">Valor inicial: </h3> 
                        
                        <h4 class="info">
                            <asp:Literal ID="litValorInicial" runat="server"></asp:Literal>
                        </h4>   
                    </section>
                </section>  
            </div>
        </div>


        <div class="maisinfo">
            <section class="Descricao">            
                <h1> Descrição</h1>                
                <div class="boxDescricao">
                    <h2 class="txtDescricao"><asp:Literal ID="litDescricao" runat="server"></asp:Literal></h2>                    
                </div>           
            </section>
   
        </div>   

            <h1 class="tituloMaior">Compre já</h1>

            <div class="produtosCompreJa">
                <asp:Literal ID="litCardProduto" runat="server"></asp:Literal>        
            </div>
    </div>
    <script src="js/input.js"></script>
</asp:Content>
