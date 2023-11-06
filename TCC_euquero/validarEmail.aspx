<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="validarEmail.aspx.cs" Inherits="TCC_euquero.validarEmail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="/imagens/U.png">
    <link href="../css/validarEmail.css" rel="stylesheet">
    
    <title>Eu Quero | Validar Email</title>
</head>

    <header>
    <a href="index.aspx"><img class="euQueroLogo" src="../imagens/logo.png"></a>
    </header>

<body>

    <form id="form1" runat="server">
        <div class="bgCadastro">
            <div class="formCadastro">
                <div class="alinharConteudo">
                    <h1>Validar Email</h1>

                    <p class="texto marginTop">Um código de verificação foi enviado ao email <asp:Literal ID="litEmailConfirmacao" runat="server"></asp:Literal> Insira-o abaixo para efetivar seu cadastro.</p>

                    <div class="form-inline marginTop">
                        <div class="form-group">
                            <label for="Codigo" class="labelinput">Código</label>
                            <input required="" id="Codigo" type="number" name="Codigo" class="form-field" placeholder="123456" max="999999" runat="server"/>
                        </div>
                    </div>

                    <asp:Literal ID="litRespostaSistema" runat="server"></asp:Literal>

                    <div class="linha marginTop"></div>

                    <asp:Button ID="btnValidar" runat="server" Text="Validar" CssClass="marginTop" OnClick="btnValidar_Click" />

                </div>
            </div>
        </div>
    </form>
</body>
</html>
