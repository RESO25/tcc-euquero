DROP SCHEMA IF EXISTS euquero;
CREATE SCHEMA IF NOT EXISTS euquero;
USE euquero;

-- -----------------------------------------------------
-- Table usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS usuario (
  nm_email_usuario varchar(200) ,
  cd_cpf_usuario bigint,
  cd_cnpj_usuario bigint,
  nm_usuario varchar(200),
  nm_senha varchar(64),
  ic_validado bool,
  vl_saldo decimal(10, 2),
  ic_banido tinyint(1),
  cd_telefone bigint(11),
  PRIMARY KEY (nm_email_usuario)
);

-- -----------------------------------------------------
-- Table validacao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS validacao (
	nm_email_usuario varchar(200),
	cd_validacao int,
	PRIMARY KEY (nm_email_usuario, cd_validacao),
	CONSTRAINT fk_validacao
		FOREIGN KEY (nm_email_usuario)
		REFERENCES usuario (nm_email_usuario)
);

-- -----------------------------------------------------
-- Table endereco
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS endereco (
  cd_endereco INT ,
  nm_email_usuario varchar(200) ,
  cd_cep_endereco INT,
  nm_endereco varchar(200),
  cd_numero_endereco varchar(200),
  nm_complemento varchar(200),
  ic_preferencial INT,
  PRIMARY KEY (cd_endereco) ,
  CONSTRAINT fk_endereco_usuario1
    FOREIGN KEY (nm_email_usuario )
    REFERENCES usuario (nm_email_usuario )
);

-- -----------------------------------------------------
-- Table anuncio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS anuncio (
  cd_anuncio INT AUTO_INCREMENT ,
  nm_email_usuario varchar(200) ,
  dt_anuncio DATETIME,
  dt_encerramento_anuncio DATETIME,
  nm_produto varchar(200),
  ds_produto text,
  vl_minimo DECIMAL(10,2),
  vl_maximo DECIMAL(10,2),
  ic_encerrado BOOL,
  PRIMARY KEY (cd_anuncio) ,
  CONSTRAINT fk_anuncio_usuario1
    FOREIGN KEY (nm_email_usuario )
    REFERENCES usuario (nm_email_usuario )
);

-- -----------------------------------------------------
-- Table lance
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS lance (
  cd_anuncio INT ,
  nm_email_usuario_cliente varchar(200) ,
  dt_lance DATETIME ,
  vl_lance DECIMAL(10,2),
  PRIMARY KEY (cd_anuncio, nm_email_usuario_cliente, dt_lance) ,
  CONSTRAINT fk_usuario_anuncio_usuario1
    FOREIGN KEY (nm_email_usuario_cliente )
    REFERENCES usuario (nm_email_usuario ),
  CONSTRAINT fk_usuario_anuncio_anuncio1
    FOREIGN KEY (cd_anuncio )
    REFERENCES anuncio (cd_anuncio )
);

-- -----------------------------------------------------
-- Table comentario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS comentario (
  cd_comentario INT ,
  cd_anuncio INT ,
  nm_email_usuario varchar(200) ,
  cd_comentario_pai INT ,
  dt_comentario DATETIME,
  ds_comentario varchar(200),
  PRIMARY KEY (cd_comentario) ,
  CONSTRAINT fk_comentario_anuncio1
    FOREIGN KEY (cd_anuncio )
    REFERENCES anuncio (cd_anuncio ),
  CONSTRAINT fk_comentario_usuario1
    FOREIGN KEY (nm_email_usuario )
    REFERENCES usuario (nm_email_usuario ),
  CONSTRAINT fk_comentario_comentario1
    FOREIGN KEY (cd_comentario_pai )
    REFERENCES comentario (cd_comentario )
);

-- -----------------------------------------------------
-- Table mensagem
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mensagem (
  cd_anuncio INT ,
  cd_anuncio_lance INT ,
  nm_email_usuario_cliente_lance varchar(200) ,
  dt_lance DATETIME ,
  dt_mensagem DATETIME,
  ds_mensagem TEXT,
  ic_lido INT,
  PRIMARY KEY (cd_anuncio, cd_anuncio_lance, nm_email_usuario_cliente_lance, dt_lance) ,
  CONSTRAINT fk_anuncio_lance_anuncio1
    FOREIGN KEY (cd_anuncio )
    REFERENCES anuncio (cd_anuncio ),
  CONSTRAINT fk_anuncio_lance_lance1
    FOREIGN KEY (cd_anuncio_lance , nm_email_usuario_cliente_lance , dt_lance )
    REFERENCES lance (cd_anuncio , nm_email_usuario_cliente , dt_lance )
);

-- -----------------------------------------------------
-- Table denuncia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS denuncia (
  dt_denuncia DATETIME ,
  nm_email_usuario varchar(200) ,
  ds_denuncia varchar(200),
  ic_verificada tinyint(1),
  PRIMARY KEY (dt_denuncia, nm_email_usuario) ,
  CONSTRAINT fk_denuncia_usuario1
    FOREIGN KEY (nm_email_usuario )
    REFERENCES usuario (nm_email_usuario )
);


-- -----------------------------------------------------
-- Table imagem
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS imagem (
  cd_anuncio INT ,
  cd_numero_imagem INT ,
  img BLOB,
  PRIMARY KEY (cd_anuncio, cd_numero_imagem) ,
  CONSTRAINT fk_imagem_anuncio1
    FOREIGN KEY (cd_anuncio )
    REFERENCES anuncio (cd_anuncio )
);

-- -----------------------------------------------------
-- Table cartao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cartao (
  nm_email_usuario varchar(200) ,
  cd_digitos bigint(12) ,
  nm_titular varchar(200),
  dt_vencimento varchar(5),
  cd_cvv INT,
  ic_usando bool,
  PRIMARY KEY (cd_digitos, nm_email_usuario) ,
  CONSTRAINT fk_cartao_usuario1
    FOREIGN KEY (nm_email_usuario )
    REFERENCES usuario (nm_email_usuario )
);

-- -----------------------------------------------------
-- Table categoria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS categoria (
  cd_categoria INT ,
  nm_categoria varchar(200),
  PRIMARY KEY (cd_categoria)
);

-- -----------------------------------------------------
-- Table anuncio_subcategoria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS anuncio_categoria (
  cd_anuncio INT,
  cd_categoria INT,
  PRIMARY KEY (cd_anuncio,  cd_categoria),
  Constraint fk_anuncio_categoria_anuncio Foreign Key (cd_anuncio) references anuncio (cd_anuncio),
  Constraint fk_anuncio_categoria_categoria Foreign Key (cd_categoria) references categoria (cd_categoria)
);