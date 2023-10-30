<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="TCC_euquero.login" %>

<!DOCTYPE html>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/cadastro.css" rel="stylesheet">
      <link href="../css/login.css" rel="stylesheet">
    
    <title>Cadastro</title>
</head>

    <header>
    <img class="euQueroLogo" src="../imagens/logo.png">
    </header>

<body>
    <form id="form1" runat="server">
        <div class="bgCadastro">
            <div class="formCadastro">
                <div class="alinharConteudo">
                    <h1>Login</h1>


                    <div id="dadosLogin">      
        
                        <div id="inputs">
                            <div class="form-inline">
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <asp:TextBox ID="txtEmail" runat="server" class="form-field" placeholder="Email" ></asp:TextBox>
                                    <%--<input required="" type="text" id="email" name="email" class="form-field" placeholder="Email">--%>
                                </div>
                            </div>
                        
                            <div class="form-inline">
                                <div class="form-group">
                                    <label for="senha">Senha</label>
                                    <asp:TextBox ID="txtSenha" runat="server" class="form-field" placeholder="Senha" TextMode="Password"></asp:TextBox>
                                    <%--<input required="" type="text" id="senha" name="senha" class="form-field" placeholder="Senha">--%>
                                </div>
                            </div>
        
                            <div id="acesso">
                                <%--<asp:Button ID="btnLogin" runat="server" Text="Entrar" OnClick="btnEntrar_Click" />--%>
                                <button>Entrar</button>
                                <a><p>Esqueci minha senha</p></a>
                            </div>
        
                            <div id="criarConta">
                                <p>Ainda não tem uma conta?</p>
                                <a class="btnCadastro" href="../cadastro.aspx">Cadastrar</a>
                            </div>
                        </div>
                    </div>
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