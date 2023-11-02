<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastro.aspx.cs" Inherits="TCC_euquero.cadastro" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/cadastro.css" rel="stylesheet">
    <link href="../css/cadastro.css" rel="stylesheet">
    
    <title>Eu Quero | Cadastro</title>
</head>

    <header>
    <img class="euQueroLogo" src="../imagens/logo.png">
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
                                  <label for="email" class="labelinput">CPF</label>
                                  <input required="" type="text" id="CPF" name="CPF" class="form-field" placeholder="Coloque o CPF">
                                </div>
                            </div>
                        

                            <!-- <input type="radio" class="radioTipoPessoa" >
                            <input type="radio" class="radioTipoPessoa"> -->


                            <div>
                                <input type="radio" class="radioTipoPessoa" name="tipoPessoa" value="Física"/>
                                <label for="pessoaFisica">Pessoa Física</label>
                            </div>
                            
                            <div>    
                                <input type="radio" class="radioTipoPessoa" name="tipoPessoa" value="Jurídica"/>
                                <label for="pessoaJuridica">Pessoa Jurídica</label>
                            </div>

                        </div>

                        <div class="displaytt">
                            <!-- Nome -->
                            <div class="form-inline input">
                                <div class="form-group">
                                    <label for="email" class="labelinput">Nome</label>
                                    <input required="" type="text" id="Nome" name="Nome" class="form-field" placeholder="Nome Completo">
                                </div>
                            </div>

                            <!-- RG -->
                            <div class="form-inline input">
                                <div class="form-group">
                                    <label for="RG" class="labelinput">RG</label>
                                    <input required="" type="text" id="RG" name="RG" class="form-field" placeholder="Coloque o RG">
                                </div>
                            </div>

                            <!-- Aniversario -->
                            <div class="form-inline input">
                                <div class="form-group">
                                    <label for="RG" class="labelinput">Aniversario</label>
                                    <input required="" type="date" id="Aniversario" name="Aniversario" class="form-field" placeholder="Coloque o RG">
                                </div>
                            </div>
                        </div>

                        <div class="displaytt">
                            <!-- Email -->
                            <div class="form-inline input">
                                <div class="form-group">
                                    <label for="Email" class="labelinput">Email</label>
                                    <input required="" type="text" id="Email" name="Email" class="form-field" placeholder="Coloque o Email">
                                </div>
                            </div>
                        </div>

                        <div class="displaytt">
                            <!-- Senha -->
                            <div class="form-inline input">
                                <div class="form-group">
                                    <label for="Senha" class="labelinput">Senha</label>
                                    <input required="" type="text" id="Senha" name="Senha" class="form-field" placeholder="Crie uma Senha">
                                </div>
                            </div>

                            <!-- Repetir Senha -->
                            <div class="form-inline input">
                                <div class="form-group">
                                    <label for="Senha" class="labelinput">Repetir Senha</label>
                                    <input required="" type="text" id="Senha" name="Senha" class="form-field" placeholder="Repita a Senha">
                                </div>
                            </div>
                        </div>

                        <div class="linha"></div>

                        <div class="displaytt">
                            <!-- CEP -->
                            <div class="form-inline input">
                                <div class="form-group">
                                    <label for="Senha" class="labelinput">CEP</label>
                                    <input required="" type="number" id="CEP" name="CEP" class="form-field" placeholder="00000-000">
                                </div>
                            </div>

                            <!-- UF -->
                            <div class="form-inline input">
                                <div class="form-group">
                                    <label for="UF" class="labelinput">UF</label>
                                    <input required="" type="text" id="UF" name="UF" class="form-field" placeholder="Estado">
                                </div>
                            </div>

                            <!-- Cidade -->
                            <div class="form-inline input">
                                <div class="form-group">
                                    <label for="Cidade" class="labelinput">Cidade</label>
                                    <input required="" type="text" id="Cidade" name="Cidade" class="form-field" placeholder="Coloque a cidade">
                                </div>
                            </div>
                        </div>

                        <div class="displaytt">

                            <!-- Rua -->
                            <div class="form-inline input psrua">
                                <div class="form-group">
                                    <label for="Rua" class="labelinput">Rua</label>
                                    <input required="" type="text" id="Rua" name="Rua" class="form-field" placeholder="Coloque o nome da rua">
                                </div>
                            </div>

                            <!-- Número -->
                            <div class="form-inline input psnumero">
                                <div class="form-group">
                                    <label for="Número" class="labelinput">N°</label>
                                    <input required="" type="number" id="Número" name="Número" class="form-field" placeholder="">
                                </div>
                            </div>

                        </div>

                        <div class="displaytt">
                            

                            <!-- Complemento -->
                            <div class="form-inline input">
                                <div class="form-group">
                                    <label for="Complemento" class="labelinput">Complemento</label>
                                    <input required="" type="text" id="Complemento" name="Complemento" class="form-field" placeholder="Complemento">
                                </div>
                            </div>
                        </div>

                        <div class="linha"></div>

                        <div class="btn">
                            <button>Cadastrar</button>
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
