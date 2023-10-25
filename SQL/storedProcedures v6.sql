use euquero;
SET GLOBAL log_bin_trust_function_creators = 1;

Delimiter $$

-- -----------------------------------------------------
-- Verificar disponibilidade email
-- -----------------------------------------------------
Drop Function if exists VerificarDisponibilidadeEmail$$
Create Function VerificarDisponibilidadeEmail(pEmailDigitado varchar(200)) returns bool
begin
	declare pEmailCadastrado varchar(200) default null;
	Select nm_email_usuario into pEmailCadastrado from usuario where nm_email_usuario = pEmailDigitado;
	if pEmailCadastrado is null then
		return true;
	else
		return false;
	end if;
end$$

-- -----------------------------------------------------
-- Cadastrar usuário 
-- -----------------------------------------------------
Drop Procedure if exists CadastrarUsuarioFisico$$
Create Procedure CadastrarUsuarioFisico(pEmail varchar(200), pCPF bigint, pNome varchar(200), pSenha varchar(64))
begin
	insert into usuario (nm_email_usuario, cd_cpf_usuario, nm_usuario, nm_senha, ic_validado, vl_saldo, ic_banido) 
    values (pEmail, pCPF, pNome, md5(pSenha), false, 0, false);
	
    call CriarValidacao(pEmail);
end$$
Drop Procedure if exists CadastrarUsuarioJuridico$$
Create Procedure CadastrarUsuarioJuridico(pEmail varchar(200), pCNPJ bigint, pNome varchar(200), pSenha varchar(64))
begin
	insert into usuario (nm_email_usuario, cd_cnpj_usuario, nm_usuario, nm_senha, ic_validado, vl_saldo, ic_banido) 
	values (pEmail, pCNPJ, pNome, md5(pSenha), false, 0, false);
    
    call CriarValidacao(pEmail);
end$$

-- -----------------------------------------------------
-- Buscar dados do usuário para página de perfil
-- -----------------------------------------------------
Drop Procedure if Exists BuscarUsuarioPerfil$$
Create Procedure BuscarUsuarioPerfil(pEmail varchar(200))
begin
	select cd_cpf_usuario, nm_usuario, vl_saldo from usuario where nm_email_usuario = pEmail;
end$$

-- -----------------------------------------------------
-- Buscar dados do usuário para login
-- -----------------------------------------------------
Drop Procedure if Exists BuscarUsuarioLogin$$
Create Procedure BuscarUsuarioLogin(pEmail varchar(200))
begin
	select nm_email_usuario, nm_usuario from usuario where nm_email_usuario = pEmail;
end$$

-- -----------------------------------------------------
-- Cadastrar Endereço
-- -----------------------------------------------------
Drop Procedure If Exists CriarEndereço$$
Create Procedure CriarEndereço(pEmailUsuario varchar(200), pCep int, pNomeEndereço varchar(200), pNumeroEndereço int, pComplemento varchar(200), pPreferencial bool)
begin
	declare vCodigo int default 0;
	select coalesce(max(cd_endereco), 0) into vCodigo from endereco;
	set vCodigo = vCodigo + 1;
	Insert into endereco Values(vCodigo, pEmailUsuario, pCep, pNomeEndereço, pNumeroEndereço, pComplemento, pPreferencial);
end$$

-- -----------------------------------------------------
-- Listar endereços do usuário
-- -----------------------------------------------------
Drop Procedure if Exists ListarEnderecosUsuario$$
Create Procedure ListarEnderecosUsuario(pEmail varchar(200))
begin
	select cd_endereco, cd_cep_endereco, nm_endereco, cd_numero_endereco, nm_complemento, ic_preferencial from endereco where nm_email_usuario = pEmail;
end$$


-- -----------------------------------------------------
-- Criar validacao
-- -----------------------------------------------------
Drop Procedure if exists CriarValidacao$$
Create Procedure CriarValidacao(pEmail varchar(200))
begin
	delete from validacao 
    where nm_email_usuario = pEmail;
    
	insert into validacao values (pEmail, (Select FLOOR(5 + RAND()*(999999-100000))));
end$$

-- -----------------------------------------------------
-- Consultar codigo de validacao
-- -----------------------------------------------------
Drop procedure if exists ConsultarCodigoValidacao$$
Create Procedure ConsultarCodigoValidacao(pEmail varchar(200))
begin
	Select cd_validacao from validacao 
    where nm_email_usuario = pEmail;
end$$

-- -----------------------------------------------------
-- Validar conta
-- -----------------------------------------------------
Drop Procedure if exists ValidarConta$$
Create Procedure ValidarConta(pEmail varchar(200))
begin
	update usuario set ic_validado = true 
    where nm_email_usuario = pEmail;
    
    delete from validacao 
    where nm_email_usuario = pEmail;
end$$


-- -----------------------------------------------------
-- Cadastrar Cartão
-- -----------------------------------------------------
Drop Procedure If Exists CriarCartão$$
Create Procedure CriarCartão(vEmailUsuario varchar(200), vDigito bigint(12), vNomeTitular varchar(200), vDataVencimento varchar(5), vCVV int)
begin
	Insert into cartao(nm_email_usuario, cd_digitos, nm_titular, dt_vencimento, cd_cvv, ic_usando) Values(vEmailUsuario, vDigito, vNomeTitular, vDataVencimento, vCVV, true);
end$$

-- -----------------------------------------------------
-- Buscar cartão do usuário
-- -----------------------------------------------------
Drop Procedure if Exists BuscarCartaoUsuario$$
Create Procedure BuscarCartaoUsuario(pEmail varchar(200))
begin
	select * from cartao where nm_email_usuario = pEmail;
end$$

-- -----------------------------------------------------
-- Inutilizar cartão
-- -----------------------------------------------------
Drop Procedure if Exists InutilizarCartao$$
Create Procedure InutilizarCartao(pEmail varchar(200), pDigitos int)
begin
	update cartao set ic_usando = false where cd_digitos = pDigitos and nm_email_usuario = pEmail;
end$$

-- -----------------------------------------------------
-- Utilizar cartão
-- -----------------------------------------------------
Drop Procedure if Exists UtilizarCartao$$
Create Procedure UtilizarCartao(pEmail varchar(200), pDigitos int)
begin
	update cartao set ic_usando = false where cd_digitos = pDigitos and nm_email_usuario = pEmail;
end$$

-- -----------------------------------------------------
-- Adicionar Saldo
-- -----------------------------------------------------
Drop Procedure if exists AdicionarSaldo$$
Create Procedure AdicionarSaldo(pEmail varchar(200), pValor decimal(10, 2))
begin
	declare vSaldoAtual decimal(10, 2) default 0;
    declare vNovoSaldo decimal(10, 2) default 0; 
    
    select vl_saldo into vSaldoAtual from usuario where nm_email_usuario = pEmail;
    
    set vNovoSaldo = vSaldoAtual + pValor;
    
	update usuario set vl_saldo = vNovoSaldo where nm_email_usuario = pEmail;
end$$

-- -----------------------------------------------------
-- Subtrair Saldo
-- -----------------------------------------------------
Drop Procedure if Exists SubtrairSaldo$$
Create Procedure SubtrairSaldo(pEmail varchar(200), pValor decimal(10, 2))
begin
	declare vSaldoAtual decimal(10, 2) default 0;
    declare vNovoSaldo decimal(10, 2) default 0; 
    
    select vl_saldo into vSaldoAtual from usuario where nm_email_usuario = pEmail;
    
    set vNovoSaldo = vSaldoAtual - pValor;
    
	update usuario set vl_saldo = vNovoSaldo where nm_email_usuario = pEmail;
end$$

-- -----------------------------------------------------
-- Consultar Saldo
-- -----------------------------------------------------
Drop Procedure if exists ConsultarSaldo$$
Create Procedure ConsultarSaldo(pEmail varchar(200))
begin
	select vl_saldo from usuario where nm_email_usuario = pEmail;
end$$



-- -----------------------------------------------------
-- Verificar tentativa de login do usuário
-- -----------------------------------------------------
Drop Procedure if exists VerificarLogin$$
Create Procedure VerificarLogin(pEmail varchar(200), pSenha varchar(64))
begin
	declare vSenha varchar(200) default null;
	select nm_senha into vSenha from usuario where nm_email_usuario = pEmail;
	if vSenha is null then
		select false;
	end if;
	if vSenha = md5(pSenha) then
		select true;
	else
		select false;
	end if;
end$$


-- -----------------------------------------------------
-- Criar anúncio para leilão do produto
-- -----------------------------------------------------
Drop Procedure if exists CriarAnuncio$$
Create Procedure CriarAnuncio(pEmail varchar(200), pEncerramento datetime, pNomeProduto varchar(200), pDescricao text, pValorMin decimal(10,2), pValorMax decimal(10,2))
begin
	declare vTotal int default 0;
	declare vCodAnuncio int default 0;
    select VerificarCodigoUltimoAnuncio() into vTotal;
    set vCodAnuncio = vTotal +1;    
	insert into anuncio (cd_anuncio, nm_email_usuario, dt_anuncio, dt_encerramento_anuncio, nm_produto, ds_produto, vl_minimo, vl_maximo, ic_encerrado) 
	values (vCodAnuncio, pEmail, now(), pEncerramento, pNomeProduto, pDescricao, pValorMin, pValorMax, false);
end$$

-- -----------------------------------------------------
-- Retorna o número total de anúncios
-- -----------------------------------------------------
Drop Procedure if Exists ContarAnuncios$$
Create Procedure ContarAnuncios()
begin
	select count(cd_anuncio) as QuantidadeAnuncios
    from anuncio;
end$$

-- -----------------------------------------------------
-- Validar lance no produto
-- -----------------------------------------------------
Drop Function if Exists ValidarLance$$
Create Function ValidarLance(pCodigoAnuncio int, pValorLance decimal(10,2)) returns bool
begin
	declare vLanceAtual int default 0;
	select max(vl_lance) as ValorLance into vLanceAtual from lance
	where cd_anuncio = pCodigoAnuncio;
    
    if vLanceAtual is null then
		select vl_minimo into vLanceAtual from anuncio where cd_anuncio = pCodigoAnuncio;
    end if;
	
    if pValorLance <= vLanceAtual then
		return false; 
	else
		return true;
    end if;
end$$

-- -----------------------------------------------------
-- Dar lance no produto
-- -----------------------------------------------------
Drop Procedure if Exists DarLance$$
Create Procedure DarLance(pAnuncio int, pEmail varchar(200), pValor decimal(10,2))
begin
	declare vValidarLance bool default false;
    select ValidarLance(pAnuncio, pValor) into vValidarLance;
    
    if vValidarLance = true then
		insert into lance values (pAnuncio, pEmail, now(), pValor);
        
		call SubtrairSaldo(pEmail, pValor);
    end if;
end$$

-- -----------------------------------------------------
-- Buscar lance atual do anúncio
-- -----------------------------------------------------
drop procedure if exists BuscarLanceAtual$$
Create Procedure BuscarLanceAtual(pAnuncio int)
begin	
   declare vValorMin decimal(10,2) default 0;
    select vl_minimo into vValorMin from anuncio where cd_anuncio = pAnuncio;
    
	select coalesce(max(vl_lance), vValorMin) as ValorLance from lance
	where cd_anuncio = pAnuncio;
end$$

-- -----------------------------------------------------
-- Listar anúncios em forma de card 
-- -----------------------------------------------------
Drop procedure if exists ListarAnunciosCard$$
Create Procedure ListarAnunciosCard()
begin	
   select cd_anuncio as CodigoAnuncio, nm_produto as NomeProduto, dt_encerramento_anuncio as DataEncerramento, vl_minimo as ValorMinimo, (select max(vl_lance) from lance join anuncio on (lance.cd_anuncio = anuncio.cd_anuncio) where lance.cd_anuncio = CodigoAnuncio) as LanceAtual
   from anuncio
   where ic_encerrado = false;
end$$

-- -----------------------------------------------------
-- Listar dados do anúncio na página de anúncio
-- -----------------------------------------------------
Drop Procedure If Exists ListarDadosAnuncioComLance$$
Create Procedure ListarDadosAnuncioComLance(pCodigoAnuncio int)
begin
	select a.nm_produto, a.ds_produto, a.dt_encerramento_anuncio, a.vl_minimo, max(l.vl_lance) as vl_lance_atual, u.nm_usuario, 
(select count(vl_lance) from lance where cd_anuncio = pCodigoAnuncio) as qt_lances, 
(select count(distinct(nm_email_usuario_cliente)) from lance where cd_anuncio = pCodigoAnuncio) as qt_participantes, 
(select u.nm_usuario from lance l join usuario u on (l.nm_email_usuario_cliente = u. nm_email_usuario) where cd_anuncio = pCodigoAnuncio order by vl_lance desc limit 1) as nm_ganhador
	from anuncio a
join lance l on (a.cd_anuncio = l.cd_anuncio)
join usuario u on (a.nm_email_usuario = u.nm_email_usuario)
join usuario uu on (l.nm_email_usuario_cliente = uu.nm_email_usuario)
	where a.cd_anuncio = pCodigoAnuncio;
end$$
Drop Procedure If Exists ListarDadosAnuncioSemLance$$
Create Procedure ListarDadosAnuncioSemLance(pCodigoAnuncio int)
begin
	select a.nm_produto, a.ds_produto, a.dt_encerramento_anuncio, a.vl_minimo, a.vl_minimo vl_lance_atual, u.nm_usuario, 0 qt_lances, 0 qt_participantes, "---" nm_ganhador
	from anuncio a
    join usuario u on (a.nm_email_usuario = u.nm_email_usuario)
	where cd_anuncio = pCodigoAnuncio;
end$$

Drop Procedure If Exists ListarDadosAnuncio$$
Create Procedure ListarDadosAnuncio(pCodigoAnuncio int)
begin
	declare vLances int default 0;
    
    select count(vl_lance) into vLances from lance where cd_anuncio = pCodigoAnuncio;
    if (vLances = 0) then
		call ListarDadosAnuncioSemLance(pCodigoAnuncio);
    else
		call ListarDadosAnuncioComLance(pCodigoAnuncio);
	end if;
end$$

-- -----------------------------------------------------
-- Consultar estado do anuncio
-- -----------------------------------------------------
Drop Procedure if Exists ConsultarEstadoAnuncio$$
Create Procedure ConsultarEstadoAnuncio(pCodigoAnuncio int)
begin
	select ic_encerrado as EstadoAnuncio 
    from anuncio 
    where cd_anuncio = pCodigoAnuncio;
end$$

-- -------------------
-- Encerrar anúncio
-- -----------------------------------------------------
Drop Procedure if Exists EncerrarAnuncio$$
Create Procedure EncerrarAnuncio(pCodigoAnuncio int)
begin
	update anuncio set ic_encerrado = true 
    where cd_anuncio = pCodigoAnuncio;
end$$

-- -----------------------------------------------------
-- Retorna o número total de anúncios
-- -----------------------------------------------------
Drop Procedure if Exists ContarAnuncios$$
Create Procedure ContarAnuncios()
begin
	select count(cd_anuncio) as TotalAnuncios from anuncio;
end$$

Drop Function if Exists VerificarCodigoUltimoAnuncio$$
Create Function VerificarCodigoUltimoAnuncio() returns int
begin
	declare vTotal int default 0;
	select count(cd_anuncio) into vTotal from anuncio;
    return vTotal;
end$$

Delimiter ;