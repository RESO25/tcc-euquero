<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastro.aspx.cs" Inherits="TCC_euquero.cadastro" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="/imagens/U.png">
    <link href="../css/cadastro.css" rel="stylesheet">
    
    <title>Eu Quero | Cadastro</title>
</head>

    <header>
    <a href="index.aspx"><img class="euQueroLogo" src="../imagens/logo.png"></a>
    </header>

<body>
    <form id="form1" runat="server">
        <div class="bgCadastro">
            <div class="formCadastro">
                <div class="alinharConteudo">

                        <h1> Cadastrar </h1>

                        <div class="paisPessoaFisicaJuridica   espaçoDF displaytt">

                            <div class="form-inline">
                                <div class="form-group">
                                    <label for="CPF" class="labelinput">CPF</label>
                                    <input required="" id="CPF" type="number" name="CPF" class="form-field" placeholder="Coloque o CPF" runat="server"/>
                                </div>
                            </div>
                        

                            <!-- <input type="radio" class="radioTipoPessoa" >
                            <input type="radio" class="radioTipoPessoa"> -->


                            <div>
                                <input id="PessoaFisica" type="radio" name="tipoPessoa" class="radioTipoPessoa" value="Física" runat="server"/>
                                <label for="pessoaFisica">Pessoa Física</label>
                            </div>
                            
                            <div>    
                                <input id="PessoaJuridica" type="radio" name="tipoPessoa" class="radioTipoPessoa" value="Jurídica" runat="server"/>
                                <label for="pessoaJuridica">Pessoa Jurídica</label>
                            </div>

                        </div>

                        <div class="displaytt">
                            <!-- Nome -->
                            <div class="form-inline input">
                                <div class="form-group">
                                    <label for="Nome" class="labelinput">Nome</label>
                                    <input required="" id="Nome" type="text" name="Nome" class="form-field" placeholder="Nome Completo" runat="server"/>
                                </div>
                            </div>

                            <!-- Telefone -->
                            <div class="form-inline input">
                                <div class="form-group">
                                    <label for="Telefone" class="labelinput">Telefone</label>
                                    <input required="" type="number" id="Telefone" name="Telefone" class="form-field" placeholder="Coloque o seu Telefone" runat="server">
                                </div>
                            </div>

                            <!-- Aniversario -->
                            <%--<div class="form-inline input">
                                <div class="form-group">
                                    <label for="RG" class="labelinput">Aniversario</label>
                                    <input required="" type="date" id="Aniversario" name="Aniversario" class="form-field" placeholder="Coloque o RG">
                                </div>
                            </div>--%>
                        </div>

                        <div class="displaytt">
                            <!-- Email -->
                            <div class="form-inline input">
                                <div class="form-group">
                                    <label for="Email" class="labelinput">Email</label>
                                    <input required="" id="Email" type="text" name="Email" class="form-field" placeholder="Coloque o Email" runat="server"/>
                                </div>
                            </div>
                        </div>

                        <div class="displaytt">
                            <!-- Senha -->
                            <div class="form-inline input">
                                <div class="form-group">
                                    <label for="Senha" class="labelinput">Senha</label>
                                    <input required="" id="Senha" type="password" name="Senha" class="form-field" placeholder="Crie uma Senha" runat="server"/>
                                </div>
                            </div>

                            <!-- Repetir Senha -->
                            <div class="form-inline input">
                                <div class="form-group">
                                    <label for="RepetirSenha" class="labelinput">Repetir Senha</label>
                                    <input required="" id="RepetirSenha" type="password" name="RepetirSenha" class="form-field" placeholder="Repita a Senha" runat="server"/>
                                </div>
                            </div>
                        </div>

                        <div class="linha"></div>

                        <div class="displaytt">
                            <!-- CEP -->
                            <div class="form-inline input">
                                <div class="form-group">
                                    <label for="CEP" class="labelinput">CEP</label>
                                    <asp:TextBox ID="CEP" name="CEP" class="form-field" placeholder="00000-000" runat="server" OnTextChanged="CEP_TextChanged" AutoPostBack="true"></asp:TextBox>
                                </div>
                            </div>

                            <!-- UF -->
                            <div class="form-inline input">
                                <div class="form-group">
                                    <label for="UF" class="labelinput">UF</label>
                                    <input required="" id="UF" type="text" name="UF" class="form-field" placeholder="Estado" runat="server"/>
                                </div>
                            </div>

                            <!-- Cidade -->
                            <div class="form-inline input">
                                <div class="form-group">
                                    <label for="Cidade" class="labelinput">Cidade</label>
                                    <input required="" id="Cidade" type="text" name="Cidade" class="form-field" placeholder="Coloque a cidade" runat="server"/>
                                </div>
                            </div>
                        </div>

                        <div class="displaytt">

                            <!-- Rua -->
                            <div class="form-inline input psrua">
                                <div class="form-group">
                                    <label for="Rua" class="labelinput">Rua</label>
                                    <input required="" id="Rua" type="text" name="Rua" class="form-field" placeholder="Coloque o nome da rua" runat="server"/>
                                </div>
                            </div>

                            <!-- Número -->
                            <div class="form-inline input psnumero">
                                <div class="form-group">
                                    <label for="Número" class="labelinput">N°</label>
                                    <input id="Número" type="text" name="Número" class="form-field" placeholder="" runat="server"/>
                                </div>
                            </div>

                        </div>

                        <div class="displaytt">
                            <!-- Complemento -->
                            <div class="form-inline input">
                                <div class="form-group">
                                    <label for="Complemento" class="labelinput">Complemento</label>
                                    <input id="Complemento" type="text" name="Complemento" class="form-field" placeholder="Complemento" runat="server"/>
                                </div>
                            </div>
                        </div>

                        <div class="linha"></div>

                        <asp:Literal ID="litRespostaSistema" runat="server">-</asp:Literal>

                        <div class="btn">
                            <asp:Button ID="btnCadastrar" runat="server" Text="Próximo" OnClick="btnCadastrar_Click"/>
                        </div>
                </div>     
            </div>
        </div>
    </form>
</body>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

</html>