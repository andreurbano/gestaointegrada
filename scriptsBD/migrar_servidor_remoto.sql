USE ferpan;

DROP TABLE usuario_modulo_bkp;
ALTER TABLE acondicionamento ENGINE = InnoDB;
ALTER TABLE bairro ENGINE = InnoDB;
ALTER TABLE cargo ENGINE = InnoDB;
ALTER TABLE classificacao ENGINE = InnoDB;
ALTER TABLE cliente ENGINE = InnoDB;
ALTER TABLE documento ENGINE = InnoDB;
ALTER TABLE doc_tipo ENGINE = InnoDB;
ALTER TABLE eleitor ENGINE = InnoDB;
ALTER TABLE empresa ENGINE = InnoDB;
ALTER TABLE endereco ENGINE = InnoDB;
ALTER TABLE end_tipo ENGINE = InnoDB;
ALTER TABLE estadofisico ENGINE = InnoDB;
ALTER TABLE fantasia ENGINE = InnoDB;
ALTER TABLE grupo ENGINE = InnoDB;
ALTER TABLE logradourotipo ENGINE = InnoDB;
ALTER TABLE logra_tipo ENGINE = InnoDB;
ALTER TABLE manifesto ENGINE = InnoDB;
ALTER TABLE manifestoestado ENGINE = InnoDB;
ALTER TABLE modulo ENGINE = InnoDB;
ALTER TABLE origem ENGINE = InnoDB;
ALTER TABLE periodonumero ENGINE = InnoDB;
ALTER TABLE pessoafisica ENGINE = InnoDB;
ALTER TABLE pessoajuridica ENGINE = InnoDB;
ALTER TABLE procedencia ENGINE = InnoDB;
ALTER TABLE residuo ENGINE = InnoDB;
ALTER TABLE responsavel ENGINE = InnoDB;
ALTER TABLE setor ENGINE = InnoDB;
ALTER TABLE sexo ENGINE = InnoDB;
ALTER TABLE situacao ENGINE = InnoDB;
ALTER TABLE telefone ENGINE = InnoDB;
ALTER TABLE tel_tipo ENGINE = InnoDB;
ALTER TABLE titrelat ENGINE = InnoDB;
ALTER TABLE tratamento ENGINE = InnoDB;
ALTER TABLE tratdisp ENGINE = InnoDB;
ALTER TABLE unidademedida ENGINE = InnoDB;
ALTER TABLE usuario ENGINE = InnoDB;
ALTER TABLE usuario_modulo ENGINE = InnoDB;


ALTER TABLE empresa ADD COLUMN InscMunic VARCHAR(9) AFTER InscEstado,
 ADD COLUMN Email VARCHAR(50) AFTER InscMunic,
 ADD COLUMN TelefoneII VARCHAR(15) AFTER Email;


CREATE TABLE orgao_emissor (
  ID_Orgao_Emissor INTEGER NOT NULL AUTO_INCREMENT,
  Descricao VARCHAR(30) NOT NULL,
  PRIMARY KEY (ID_Orgao_Emissor)
)
ENGINE = InnoDB;




ALTER TABLE logra_tipo ADD COLUMN Sigla VARCHAR(10) NOT NULL AFTER Descricao;


CREATE TABLE logradouro (
  ID_logradouro INTEGER NOT NULL AUTO_INCREMENT,
  Descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (ID_logradouro)
)
ENGINE = InnoDB;


CREATE TABLE logra_bairro (
  ID_logra_bairro INTEGER NOT NULL AUTO_INCREMENT,
  Descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (ID_logra_bairro)
)
ENGINE = InnoDB;

ALTER TABLE usuario ADD COLUMN Identidade VARCHAR(15) AFTER Email;


CREATE TABLE `ferpan`.`protoc_empresa` (
  `Id_Protoc_Empresa` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  `ProcedenciaResiduo` VARCHAR(30) NOT NULL,
  `MesAno` VARCHAR(20) NOT NULL,
  `NumManifesto` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Id_Protoc_Empresa`)
)
ENGINE = InnoDB;

CREATE  TABLE `ferpan`.`local_de_origem` (
  `ID_Local_Origem` INT NOT NULL ,
  `ID_Empresa` INT NOT NULL ,
  `Descricao` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`ID_Local_Origem`) )
ENGINE = InnoDB;


UPDATE empresa
SET Telefone   = "2124019505",
    TelefoneII = "2124018026",
    CEP        = "21720001",
    CNPJ       = "34143693000193",
    InscEstado = "82246819",
    InscMunic  = "Isento",
    Email      = "contato@ferpan.com.br"
WHERE ID_Empresa = 57;



ALTER TABLE procedencia ADD COLUMN Id_Empresa INT(11) NULL  AFTER Descricao;

