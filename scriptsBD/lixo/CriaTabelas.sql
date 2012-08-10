/* Rodar os comandos a baixo na ferpan
ALTER TABLE MANIFESTO ADD COLUMN ID_Gerador  INT  NOT NULL;
ALTER TABLE MANIFESTO ADD COLUMN ID_Transportador  INT  NOT NULL;
ALTER TABLE MANIFESTO ADD COLUMN ID_Receptor  INT  NOT NULL;
ALTER TABLE PESSOAFISICA ADD COLUMN ID_Cargo INT NOT NULL;
ALTER TABLE GERADOR DROP COLUMN ID_Cargo;
ALTER TABLE PESSOAFISICA DROP COLUMN ID_EndCobranca;
ALTER TABLE PESSOAFISICA DROP COLUMN ID_EndContato;
ALTER TABLE PESSOAFISICA DROP COLUMN ID_EndCorresp;


*** RODAR NA SEGUNDA-FEIRA 22/11/2004 ***
ALTER TABLE MANIFESTO ADD COLUMN Obs BLOB;
ALTER TABLE MANIFESTO MODIFY COLUMN NumCertificado INT NULL;
ALTER TABLE EMPRESA   MODIFY COLUMN Endereco VARCHAR(80)  NOT NULL;
ALTER TABLE EMPRESA   MODIFY COLUMN Telefone VARCHAR(15)  NULL;
ALTER TABLE EMPRESA   ADD COLUMN ValorContrato NUMERIC(12,2) NULL;
ALTER TABLE EMPRESA   ADD COLUMN ValorTonelada NUMERIC(12,2) NULL;
ALTER TABLE RESIDUO   MODIFY COLUMN Descricao VARCHAR(50)  NOT NULL;
ALTER TABLE RESIDUO   ADD COLUMN FlagContaminado CHAR(1) NOT NULL;
ALTER TABLE RESPONSAVEL ADD COLUMN ID_Tratamento INT NOT NULL;
ALTER TABLE RESIDUO   ADD COLUMN FlagContaminado CHAR(1) NOT NULL;
ALTER TABLE EMPRESA   ADD COLUMN ValorContrato NUMERIC(12,2) NULL;
ALTER TABLE EMPRESA   ADD COLUMN ValorTonelada NUMERIC(12,2) NULL;


*** RODAR NA SEGUNDA-FEIRA 29/11/2004 ***
INSERT INTO GRUPO(
ID_Grupo,
Descricao)
VALUES(
2,
'Processos');

INSERT INTO GRUPO(
ID_Grupo,
Descricao)
VALUES(
3,
'Relat�rios');


ALTER TABLE manifesto ADD COLUMN DtChegou     DATETIME NOT NULL;
ALTER TABLE manifesto ADD COLUMN DtEnvio      DATETIME NULL;
ALTER TABLE manifesto ADD COLUMN ID_Situacao  INT      NOT NULL;
ALTER TABLE manifesto ADD COLUMN ID_LoteEnvio INT      NULL;


CREATE TABLE situacao
(
ID_Situacao  INT         NOT NULL AUTO_INCREMENT,
Descricao    VARCHAR(30) NOT NULL,
PRIMARY KEY (ID_Situacao)
);

INSERT INTO situacao(
ID_Situacao,
Descricao)
VALUES(
1,
'Todos');

INSERT INTO situacao(
ID_Situacao,
Descricao)
VALUES(
2,
'Em aberto');

INSERT INTO situacao(
ID_Situacao,
Descricao)
VALUES(
3,
'Efetivado');

INSERT INTO situacao(
ID_Situacao,
Descricao)
VALUES(
4,
'Impresso e enviado');

UPDATE manifesto SET ID_situacao = 2
UPDATE manifesto SET DtChegou = curdate()




*** Cadastrar os m�dulos abaixo ***
------------------------------------------------------------
    NOME DO FORM               DESCRI��O
------------------------------------------------------------
1 - frmRelatRetiradaResiduo  - Retirada de Res�duo
2 - frmEfetivaEnvioManifesto - Efetiva Envio do Manifesto


******************************************************************

*** RODAR NA TER�A-FEIRA 30/11/2004 ***
*** Cadastrar os m�dulos abaixo ***
------------------------------------------------------------
    NOME DO FORM               DESCRI��O
------------------------------------------------------------
1 - frmCancEfetivaEnvioManif  - 02 - Cancela Envio do Manif.
                                01 - Efetiva Envio do Manif.

ALTER TABLE residuo   MODIFY COLUMN FlagContaminado CHAR(1) NOT NULL DEFAULT 'F' ;
ALTER TABLE residuo   ADD COLUMN    ValorMercado NUMERIC(12,2) NULL;
ALTER TABLE empresa   ADD COLUMN    FlagRelContaminado CHAR(1) NOT NULL DEFAULT 'F' ;
ALTER TABLE empresa   ADD COLUMN    FlagRelReciclavel CHAR(1) NOT NULL DEFAULT 'F' ;
ALTER TABLE empresa   ADD COLUMN    FlagRelSucata CHAR(1) NOT NULL DEFAULT 'F' ;
ALTER TABLE manifesto MODIFY COLUMN GerDtEntrega DATETIME NULL;
ALTER TABLE manifesto MODIFY COLUMN TransDtReceb DATETIME NULL;
ALTER TABLE manifesto MODIFY COLUMN RecepDtReceb DATETIME NULL;


*** RODAR NA QUINTA-FEIRA 02/12/2004 ***
ALTER TABLE empresa   ADD COLUMN    TipoResumoGeral INT NOT NULL DEFAULT 0;

CREATE TABLE PeriodoNumero
(
ID_PeriodoNumero   INT           NOT NULL AUTO_INCREMENT,
ID_Empresa         INT           NOT NULL,
Inicio             INT           NOT NULL,
Fim                INT           NOT NULL,
Completo           VARCHAR(20)   NULL,
PRIMARY KEY (ID_PeriodoNumero)
);


,

ALTER TABLE empresa   ADD COLUMN Obs BLOB;

/*******************************************************************************
*                                                                              *
* Cria o banco de dados SGE e coloca em usu.                                   *
*                                                                              *
******************************************************************************
CREATE DATABASE SGE;
USE SGE;
*/
/*******************************************************************************
*                                                                              *
* Cria a tabela USUARIO                                                        *
*                                                                              *
*******************************************************************************/
CREATE TABLE USUARIO
(
ID_Usuario   INT           NOT NULL AUTO_INCREMENT,
Login        VARCHAR(20)   NOT NULL,
Senha        VARCHAR(20)   NOT NULL,
Nome         VARCHAR(50)   NOT NULL,
ID_Setor     INT           NOT NULL,
Ramal        VARCHAR(4),
Email        VARCHAR(30),
PRIMARY KEY (ID_Usuario)
);

/*******************************************************************************
*                                                                              *
* Inclui o usu�rio Administrador                                               *
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO (
ID_Usuario,
Login,
Senha,
Nome,
ID_Setor)
VALUES (
1,
'ADM',
'ADM',
'Administrador',
1);

/*******************************************************************************
*                                                                              *
* Cria a tabela USUARIO_MODULO                                                 *
*                                                                              *
*******************************************************************************/
CREATE TABLE USUARIO_MODULO
(
ID_Usuario_Modulo	INT    NOT NULL AUTO_INCREMENT,
ID_Usuario	      INT    NOT NULL,
ID_Modulo 	      INT    NOT NULL,
PRIMARY KEY (ID_Usuario_Modulo)
);

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cadastro de Usu�rios    *
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
1,
1, /* Usu�rio Administrador */
1) /* M�dulo Cadastro de Usu�rios */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cadastro de Setores     *
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
2,
1, /* Usu�rio Administrador */
2) /* M�dulo Cadastro de Setores */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cadastro de M�dulos     *
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
3,
1, /* Usu�rio Administrador */
3) /* M�dulo Cadastro de M�dulos */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cadastro de Grupos      *
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
4,
1, /* Usu�rio Administrador */
4) /* M�dulo Cadastro de Grupos */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cadastro de M�d. para Usu�rios. *
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
5,
1, /* Usu�rio Administrador */
5) /* M�dulo Cadastro de M�d. para Usu�rios */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cadastro de Clientes.   *
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
6,
1, /* Usu�rio Administrador */
6) /* M�dulo Cadastro de Clientes */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cadastro de Sexos.      *
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
7,
1, /* Usu�rio Administrador */
7) /* M�dulo Cadastro de Sexos */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cadastro de Residuos.   *
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
8,
1, /* Usu�rio Administrador */
8) /* M�dulo Cadastro de Res�duos */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cadastro de Estados F�s.*
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
9,
1, /* Usu�rio Administrador */
9) /* M�dulo Cadastro de Estados F�sico */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cadastro de Acondiciona.*
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
10,
1, /* Usu�rio Administrador */
10) /* M�dulo Cadastro de Acondicionamento */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cadastro de Origem      *
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
11,
1, /* Usu�rio Administrador */
11) /* M�dulo Cadastro de Origem */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cadastro de Proced�ncia *
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
12,
1, /* Usu�rio Administrador */
12) /* M�dulo Cadastro de Proced�ncia */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cad. de Tratamento/Disp.*
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
13,
1, /* Usu�rio Administrador */
13) /* M�dulo Cadastro de Tratamento/Disposi��o */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cad. de Manifesto       *
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
14,
1, /* Usu�rio Administrador */
14) /* M�dulo Cadastro de Manifesto */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cad. Unidades de Med.   *
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
15,
1, /* Usu�rio Administrador */
15) /* M�dulo Cadastro de Unidades de Medida */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cad. de Status do Manifesto *
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
16,
1, /* Usu�rio Administrador */
16) /* M�dulo Cadastro de Status do Manifesto */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cad. de Cargos          *
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
17,
1, /* Usu�rio Administrador */
17) /* M�dulo Cadastro de Cargos */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cad. de Tipos de Empresas *
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
18,
1, /* Usu�rio Administrador */
18) /* M�dulo Cadastro de Tipos de Empresas */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cad. de Respons�vel     *
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
19,
1, /* Usu�rio Administrador */
19) /* M�dulo Cadastro de Respons�vel */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cad. de Empresas        *
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
20,
1, /* Usu�rio Administrador */
20) /* M�dulo Cadastro de Tipos Empresas */ ;

/*******************************************************************************
*                                                                              *
* Inclui acesso ao usu�rio Administrador para o m�dulo Cad. de Tratamento      *
*                                                                              *
*******************************************************************************/
INSERT INTO USUARIO_MODULO(
ID_Usuario_Modulo,
ID_Usuario,
ID_Modulo)
VALUES(
21,
1, /* Usu�rio Administrador */
21) /* M�dulo Cadastro de Tratamento */ ;

/*******************************************************************************
*                                                                              *
* Cria a tabela GRUPO                                                          *
*                                                                              *
*******************************************************************************/
CREATE TABLE GRUPO
(
ID_Grupo	INT         NOT NULL AUTO_INCREMENT,
Descricao	VARCHAR(30) NOT NULL,
PRIMARY KEY (ID_Grupo)
);

/*******************************************************************************
*                                                                              *
* Inclui o grupo Cadastros                                                     *
*                                                                              *
*******************************************************************************/
INSERT INTO GRUPO(
ID_Grupo,
Descricao)
VALUES(
1,
'Cadastros');

/*******************************************************************************
*                                                                              *
* Cria a tabela MODULO                                                         *
*                                                                              *
*******************************************************************************/
CREATE TABLE MODULO
(
ID_Modulo	 INT         NOT NULL AUTO_INCREMENT,
ID_Grupo	 INT         NOT NULL,
ID_Setor	 INT         NOT NULL,
Descricao  VARCHAR(50) NOT NULL,
Nome_Form  VARCHAR(40) NOT NULL,
PRIMARY KEY (ID_Modulo)
);

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de Usu�rios                                         *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
1,
1, /*Grupo Cadastros*/
1, /*Setor Suporte*/
'Cadastro de Usu�rios',
'frmCadUsuario');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de Setores                                          *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
2,
1, /* Grupo Cadastros */
1, /* Setor Suporte */
'Cadastro de Setores',
'frmCadSetor');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de M�dulos                                          *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
3,
1, /* Grupo Cadastros */
1, /* Setor Suporte */
'Cadastro de M�dulos',
'frmCadModulo');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de Grupos                                           *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
4,
1, /* Grupo Cadastros */
1, /* Setor Suporte */
'Cadastro de Grupos',
'frmCadGrupo');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de M�dulos para Usu�rios.                           *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
5,
1, /* Grupo Cadastros */
1, /* Setor Suporte */
'Cadastro de M�dulo Para Usuarios',
'frmCadModuloUsuario');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de Clientes.                                        *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
6,
1, /* Grupo Cadastros */
2, /* Setor Comercial */
'Cadastro de Clientes',
'frmCadClientes');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de Sexos.                                           *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
7,
1, /* Grupo Cadastros */
1, /* Setor Suporte */
'Cadastro de Sexos',
'frmCadSexo');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de Res�duos.                                        *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
8,
1, /* Grupo Cadastros */
3, /* Setor Ger�ncia de Res�duos */
'Cadastro de Res�duos',
'frmCadResiduo');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de Estados F�sico                                   *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
9,
1, /* Grupo Cadastros */
3, /* Setor Ger�ncia de Res�duos */
'Cadastro de Estados F�sico',
'frmCadEstadoFisico');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de Acondicionamento                                 *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
10,
1, /* Grupo Cadastros */
3, /* Setor Ger�ncia de Res�duos */
'Cadastro de Acondicionamento',
'frmCadAcond');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de Origem                                           *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
11,
1, /* Grupo Cadastros */
3, /* Setor Ger�ncia de Res�duos */
'Cadastro de Origem',
'frmCadOrigem');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de Proced�ncia                                      *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
12,
1, /* Grupo Cadastros */
3, /* Setor Ger�ncia de Res�duos */
'Cadastro de Proced�ncia',
'frmCadProcedencia');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de Tratamento/Disposi��o                            *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
13,
1, /* Grupo Cadastros */
3, /* Setor Ger�ncia de Res�duos */
'Cadastro de Tratamento/Disposi��o',
'frmCadTratDisp');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de Manifesto                                        *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
14,
1, /* Grupo Cadastros */
3, /* Setor Ger�ncia de Res�duos */
'Cadastro de Manifesto de Res�duos',
'frmCadManifesto');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de Unidades de Medida                               *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
15,
1, /* Grupo Cadastros */
3, /* Setor Ger�ncia de Res�duos */
'Cadastro de Unidades de Medida',
'frmCadUnidadeMedida');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de Status do Manifesto                              *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
16,
1, /* Grupo Cadastros */
3, /* Setor Ger�ncia de Res�duos */
'Cadastro de Status do Manifesto',
'frmCadManifestoEstado');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de Cargos                                           *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
17,
1, /* Grupo Cadastros */
3, /* Setor Ger�ncia de Res�duos */
'Cadastro de Cargos',
'frmCadCargo');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de Tipos de Empresas                                *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
18,
1, /* Grupo Cadastros */
3, /* Setor Ger�ncia de Res�duos */
'Cadastro de Tipos de Empresas',
'frmCadTipoEmpresa');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de Respons�veis                                     *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
19,
1, /* Grupo Cadastros */
3, /* Setor Ger�ncia de Res�duos */
'Cadastro de Respons�veis',
'frmCadResponsavel');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de Empresas                                         *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
20,
1, /* Grupo Cadastros */
3, /* Setor Ger�ncia de Res�duos */
'Cadastro de Empresas',
'frmCadEmpresa');

/*******************************************************************************
*                                                                              *
* Inclui o m�dulo Cadastro de Tratamento                                       *
*                                                                              *
*******************************************************************************/
INSERT INTO MODULO(
ID_Modulo,
ID_Grupo,
ID_Setor,
Descricao,
Nome_Form)
VALUES(
21,
1, /* Grupo Cadastros */
3, /* Setor Ger�ncia de Res�duos */
'Cadastro de Tratamentos',
'frmCadTratamento');

/*******************************************************************************
*                                                                              *
* Cria a tabela SETOR                                                          *
*                                                                              *
*******************************************************************************/
CREATE TABLE SETOR
(
ID_Setor	INT         NOT NULL AUTO_INCREMENT,
Descricao	VARCHAR(20) NOT NULL,
PRIMARY KEY (ID_Setor)
);

/*******************************************************************************
*                                                                              *
* Inclui o setor Suporte                                                       *
*                                                                              *
*******************************************************************************/
INSERT INTO SETOR(
ID_Setor,
Descricao)
VALUES(
1,
'Suporte');

/*******************************************************************************
*                                                                              *
* Inclui o setor Comercial                                                     *
*                                                                              *
*******************************************************************************/
INSERT INTO SETOR(
ID_Setor,
Descricao)
VALUES(
2,
'Comercial');

/*******************************************************************************
*                                                                              *
* Inclui o setor Ger�ncia de Res�duos                                          *
*                                                                              *
*******************************************************************************/
INSERT INTO SETOR(
ID_Setor,
Descricao)
VALUES(
3,
'Ger�ncia de Res�duos');

/*******************************************************************************
*                                                                              *
* Cria a tabela CLIENTE                                                        *
*                                                                              *
*******************************************************************************/
CREATE TABLE CLIENTE
(
ID_Cliente      INT          NOT NULL AUTO_INCREMENT,
ID_Pessoa       INT          NOT NULL,
Nome            VARCHAR(50)  NOT NULL,
DataNasc        TIMESTAMP(8) NOT NULL,
ID_Sexo         INT(1)       NOT NULL,
Obs             BLOB,
PRIMARY KEY (ID_Cliente)
);

/*******************************************************************************
*                                                                              *
* Cria a tabela SEXO                                                           *
*                                                                              *
*******************************************************************************/
CREATE TABLE SEXO
(
ID_Sexo        INT         NOT NULL AUTO_INCREMENT,
Descricao      VARCHAR(30) NOT NULL,
PRIMARY KEY (ID_Sexo)
);

/*******************************************************************************
*                                                                              *
* Cria a tabela LOGRA_TIPO                                                     *
*                                                                              *
*******************************************************************************/
CREATE TABLE LOGRA_TIPO
(
ID_Logra_Tipo  INT          NOT NULL AUTO_INCREMENT,
Descricao      VARCHAR(30)  NOT NULL,
PRIMARY KEY (ID_Logra_Tipo)
);

/*******************************************************************************
*                                                                              *
* Cria a tabela ENDERECO                                                       *
*                                                                              *
*******************************************************************************/
CREATE TABLE ENDERECO
(
ID_Endereco    INT          NOT NULL AUTO_INCREMENT,
ID_Pessoa      INT          NOT NULL,
ID_End_Tipo    INT          NOT NULL,
ID_Tipo_Logra  INT          NOT NULL,
Logradouro     VARCHAR(30)  NOT NULL,
Numero         INT          NOT NULL,
Complemento    VARCHAR(30),
Cep            VARCHAR(08),
Bairro         VARCHAR(30),
Cidade         VARCHAR(30),
UF             VARCHAR(02),
Pais           VARCHAR(30),
PRIMARY KEY (ID_Endereco)
);

/*******************************************************************************
*                                                                              *
* Cria a tabela END_TIPO                                                       *
*                                                                              *
*******************************************************************************/
CREATE TABLE END_TIPO
(
ID_End_Tipo    INT          NOT NULL AUTO_INCREMENT,
Descricao      VARCHAR(30)  NOT NULL,
PRIMARY KEY (ID_End_Tipo)
);

/*******************************************************************************
*                                                                              *
* Cria a tabela TELEFONE                                                       *
*                                                                              *
*******************************************************************************/
CREATE TABLE TELEFONE
(
ID_Telefone    INT        NOT NULL AUTO_INCREMENT,
ID_Pessoa      INT        NOT NULL,
ID_Tel_Tipo    INT        NOT NULL,
DDD            VARCHAR(3) NOT NULL,
Numero         VARCHAR(8) NOT NULL,
PRIMARY KEY (ID_Telefone)
);

/*******************************************************************************
*                                                                              *
* Cria a tabela TEL_TIPO                                                       *
*                                                                              *
*******************************************************************************/
CREATE TABLE TEL_TIPO
(
ID_Tel_Tipo     INT         NOT NULL AUTO_INCREMENT,
Descricao       VARCHAR(30) NOT NULL,
PRIMARY KEY (ID_Tel_Tipo)
);

/*******************************************************************************
*                                                                              *
* Cria a tabela DOCUMENTO                                                      *
*                                                                              *
*******************************************************************************/
CREATE TABLE DOCUMENTO
(
ID_Documento  INT          NOT NULL AUTO_INCREMENT,
ID_Pessoa     INT          NOT NULL,
Numero        VARCHAR(30)  NOT NULL,
ID_Doc_Tipo   INT          NOT NULL,
DataEmissao   TIMESTAMP(8) NOT NULL,
PRIMARY KEY (ID_Documento)
);

/*******************************************************************************
*                                                                              *
* Cria a tabela DOC_TIPO                                                       *
*                                                                              *
*******************************************************************************/
CREATE TABLE DOC_TIPO
(
ID_Doc_Tipo    INT         NOT NULL AUTO_INCREMENT,
Descricao      VARCHAR(30) NOT NULL,
PRIMARY KEY (ID_Doc_Tipo)
);

/*******************************************************************************
*                                                                              *
* Cria a tabela MANIFESTO                                                      *
*                                                                              *
*******************************************************************************/
CREATE TABLE MANIFESTO
(
ID_Manifesto        INT           NOT NULL AUTO_INCREMENT,
Numero              INT           NOT NULL,
NumCertificado      INT           NOT NULL,
Quantidade          NUMERIC(15,6) NULL,
ID_Unidade          INT           NOT NULL,
ID_Residuo          INT           NOT NULL,
ID_EstadoFisico     INT           NOT NULL,
ID_Acond            INT           NOT NULL,
ID_Origem           INT           NOT NULL,
ID_Procedencia      INT           NOT NULL,
ID_TratDisp         INT           NOT NULL,
ID_Status           INT           NOT NULL,
GerDtEntrega        DATETIME      NOT NULL,
GerID_Empresa       INT           NOT NULL,
GerNumInventario    VARCHAR(30)   NULL,
GerID_Responsavel   INT           NOT NULL,
TransDtReceb        DATETIME      NOT NULL,
TransID_Empresa     INT           NOT NULL,
TransID_Responsavel INT           NOT NULL,
TransNomeMotorista  VARCHAR(30)   NULL,
TransPlacaVeiculo   VARCHAR(30)   NULL,
TransCertificado    VARCHAR(30)   NULL,
RecepDtReceb        DATETIME      NOT NULL,
RecepID_Empresa     INT           NOT NULL,
RecepNumInventario  VARCHAR(30)   NULL,
RecepID_Responsavel INT           NOT NULL,
PRIMARY KEY (ID_Manifesto)
);

CREATE UNIQUE INDEX IDXNUMERO ON MANIFESTO (Numero);


/*******************************************************************************
*                                                                              *
* Cria a tabela UNIDADEMEDIDA                                                  *
*                                                                              *
*******************************************************************************/
CREATE TABLE UNIDADEMEDIDA
(
ID_UnidadeMedida INT          NOT NULL AUTO_INCREMENT,
Descricao        VARCHAR(30)  NOT NULL,
Sigla            VARCHAR(5),
PRIMARY KEY (ID_UnidadeMedida)
);

/*******************************************************************************
*                                                                              *
* Cria a tabela RESIDUO                                                        *
*                                                                              *
*******************************************************************************/
CREATE TABLE RESIDUO
(
ID_Residuo       INT          NOT NULL AUTO_INCREMENT,
Descricao        VARCHAR(30)  NOT NULL,
PRIMARY KEY (ID_Residuo)
);

/*******************************************************************************
*                                                                              *
* Cria a tabela ESTADOFISICO                                                   *
*                                                                              *
*******************************************************************************/
CREATE TABLE ESTADOFISICO
(
ID_EstadoFisico INT          NOT NULL AUTO_INCREMENT,
Descricao       VARCHAR(30)  NOT NULL,
PRIMARY KEY (ID_EstadoFisico)
);

/*******************************************************************************
*                                                                              *
* Inclui um registro na tabela ESTADOFISICO: 0 - Em Tr�nsito                   *
*                                                                              *
*******************************************************************************/
INSERT INTO ESTADOFISICO (
ID_EstadoFisico,
Descricao)
VALUES (
0,
'Em Tr�nsito');

/*******************************************************************************
*                                                                              *
* Cria a tabela ORIGEM                                                         *
*                                                                              *
*******************************************************************************/
CREATE TABLE ORIGEM
(
ID_Origem INT          NOT NULL AUTO_INCREMENT,
Descricao VARCHAR(30)  NOT NULL,
PRIMARY KEY (ID_Origem)
);

/*******************************************************************************
*                                                                              *
* Inclui um registro na tabela ORIGEM: 0 - Em Tr�nsito                         *
*                                                                              *
*******************************************************************************/
INSERT INTO ORIGEM (
ID_Origem,
Descricao)
VALUES (
0,
'Em Tr�nsito');

/*******************************************************************************
*                                                                              *
* Cria a tabela ACONDICIONAMENTO                                               *
*                                                                              *
*******************************************************************************/
CREATE TABLE ACONDICIONAMENTO
(
ID_Acondicionamento INT          NOT NULL AUTO_INCREMENT,
Descricao           VARCHAR(30)  NOT NULL,
PRIMARY KEY (ID_Acondicionamento)
);

/*******************************************************************************
*                                                                              *
* Inclui um registro na tabela ACONDICIONAMENTO: 0 - Em Tr�nsito               *
*                                                                              *
*******************************************************************************/
INSERT INTO ACONDICIONAMENTO (
ID_Acondicionamento,
Descricao)
VALUES (
0,
'Em Tr�nsito');



/*******************************************************************************
*                                                                              *
* Cria a tabela PROCEDENCIA                                                    *
*                                                                              *
*******************************************************************************/
CREATE TABLE PROCEDENCIA
(
ID_Procedencia INT          NOT NULL AUTO_INCREMENT,
Descricao      VARCHAR(30)  NOT NULL,
PRIMARY KEY (ID_Procedencia)
);

/*******************************************************************************
*                                                                              *
* Inclui um registro na tabela PROCEDENCIA: 0 - Em Tr�nsito                    *
*                                                                              *
*******************************************************************************/
INSERT INTO PROCEDENCIA (
ID_Procedencia,
Descricao)
VALUES (
0,
'Em Tr�nsito');

/*******************************************************************************
*                                                                              *
* Cria a tabela TRATDISP                                                       *
*                                                                              *
*******************************************************************************/
CREATE TABLE TRATDISP
(
ID_TratDisp INT          NOT NULL AUTO_INCREMENT,
Descricao   VARCHAR(30)  NOT NULL,
PRIMARY KEY (ID_TratDisp)
);

/*******************************************************************************
*                                                                              *
* Inclui um registro na tabela TRATDISP: 0 - Em Tr�nsito                       *
*                                                                              *
*******************************************************************************/
INSERT INTO TRATDISP (
ID_TratDisp,
Descricao)
VALUES (
0,
'Em Tr�nsito');


/*******************************************************************************
*                                                                              *
* Cria a tabela CARGO                                                          *
*                                                                              *
*******************************************************************************/
CREATE TABLE CARGO
(
ID_Cargo  INT          NOT NULL AUTO_INCREMENT,
Descricao VARCHAR(30)  NOT NULL,
PRIMARY KEY (ID_Cargo)
);

/*******************************************************************************
*                                                                              *
* Cria a tabela MANIFESTOESTADO                                                *
*                                                                              *
*******************************************************************************/
CREATE TABLE MANIFESTOESTADO
(
ID_ManifestoEstado  INT          NOT NULL AUTO_INCREMENT,
Descricao           VARCHAR(30)  NOT NULL,
PRIMARY KEY (ID_ManifestoEstado)
);

/*******************************************************************************
*                                                                              *
* Inclui o estado de Manifesto 1 - Em Tr�nsito                                 *
*                                                                              *
*******************************************************************************/
INSERT INTO MANIFESTOESTADO(
ID_ManifestoEstado,
Descricao)
VALUES(
1,
'Em Tr�nsito');

/*******************************************************************************
*                                                                              *
* Inclui o estado de Manifesto 2 - Normal                                      *
*                                                                              *
*******************************************************************************/
INSERT INTO MANIFESTOESTADO(
ID_ManifestoEstado,
Descricao)
VALUES(
2,
'Normal');

/*******************************************************************************
*                                                                              *
* Inclui o estado de Manifesto 3 - Recebido com Atraso                         *
*                                                                              *
*******************************************************************************/
INSERT INTO MANIFESTOESTADO(
ID_ManifestoEstado,
Descricao)
VALUES(
3,
'Recebido com Atraso');

/*******************************************************************************
*                                                                              *
* Cria a tabela EMPRESA                                                         *
*                                                                              *
*******************************************************************************/
CREATE TABLE EMPRESA
(
ID_Empresa       INT          NOT NULL AUTO_INCREMENT,
RazaoSocial      VARCHAR(50)  NOT NULL,
ID_Classificacao INT          NOT NULL, /* Receptor, Transportador, Gerador, Respons�vel pelo Recebimento */
Endereco         VARCHAR(50)  NOT NULL,
Municipio        VARCHAR(30)  NOT NULL,
UF               VARCHAR(02)  NOT NULL,
Telefone         VARCHAR(15)  NOT NULL,
NumLicencaFEEMA  VARCHAR(30)  NULL,
PRIMARY KEY (ID_Empresa)
);

/*******************************************************************************
*                                                                              *
* Cria a tabela RESPONSAVEL                                                    *
*                                                                              *
*******************************************************************************/
CREATE TABLE RESPONSAVEL
(
ID_Responsavel       INT          NOT NULL AUTO_INCREMENT,
Nome                 VARCHAR(50)  NOT NULL,
ID_Cargo             INT          NULL,
PRIMARY KEY (ID_Responsavel)
);


/*******************************************************************************
*                                                                              *
* Cria a tabela PESSOAFISICA                                                   *
*                                                                              *
*******************************************************************************/
CREATE TABLE PESSOAFISICA
(
ID_PessoaFisica  INT          NOT NULL AUTO_INCREMENT,
ID_Pessoa        INT          NOT NULL,
ID_EndCobranca   INT          NOT NULL,
ID_EndContato    INT          NOT NULL,
ID_EndCorresp    INT          NOT NULL,
ID_Sexo          INT          NOT NULL,
ID_Cargo         INT          NOT NULL,
NomePrimeiro     VARCHAR(20)  NOT NULL,
NomeRestante     VARCHAR(30)  NOT NULL,
Apelido          VARCHAR(20)      NULL,
DataNasc         DATETIME     NOT NULL,
PRIMARY KEY (ID_PessoaFisica)
);

/*******************************************************************************
*                                                                              *
* Cria a tabela PESSOAJURIDICA                                                 *
*                                                                              *
*******************************************************************************/
CREATE TABLE PESSOAJURIDICA
(
ID_PessoaJuridica INT          NOT NULL AUTO_INCREMENT,
ID_Pessoa         INT          NOT NULL,
RazaoSocial       VARCHAR(30)  NOT NULL,
PRIMARY KEY (ID_PessoaJuridica)
);

/*******************************************************************************
*                                                                              *
* Cria a tabela CLASSIFICACAO                                                  *
*                                                                              *
*******************************************************************************/
CREATE TABLE CLASSIFICACAO
(
ID_Classificacao INT          NOT NULL AUTO_INCREMENT,
Descricao        VARCHAR(30)  NOT NULL, /* Receptor, Transportador, Gerador, Respons�vel pelo Recebimento */
PRIMARY KEY (ID_Classificacao)
);

/*******************************************************************************
*                                                                              *
* Cria a tabela BAIRRO                                                         *
*                                                                              *
*******************************************************************************/
CREATE TABLE BAIRRO
(
ID_Bairro        INT          NOT NULL AUTO_INCREMENT,
Descricao        VARCHAR(30)  NOT NULL,
PRIMARY KEY (ID_Bairro)
);


/*******************************************************************************
*                                                                              *
* Cria a tabela ELEITOR                                                        *
*                                                                              *
*******************************************************************************/
CREATE TABLE ELEITOR
(
ID_Eleitor       INT          NOT NULL AUTO_INCREMENT,
NomePrimeiro     VARCHAR(20)  NOT NULL,
NomeRestante     VARCHAR(30)  NOT NULL,
Apelido          VARCHAR(20)      NULL,
LograID_Tipo     INT          NOT NULL,
LograDescricao   VARCHAR(30)  NOT NULL,
LograNumero      NUMERIC(6,0)     NULL,
LograComplemento VARCHAR(30)      NULL,
LograID_Bairro   INT          NOT NULL,
LograCEP         VARCHAR(08)  NOT NULL,
LograCidade      VARCHAR(30)  NOT NULL,
LograUF          VARCHAR(02)  NOT NULL,
ID_Classificacao INT          NOT NULL,
ID_Sexo          INT          NOT NULL,
ConquistadoPor   INT              NULL,
Email            VARCHAR(50)      NULL,
DataNasc         DATETIME     NOT NULL,
TitNumero        VARCHAR(11)      NULL,
TitZona          VARCHAR(03)      NULL,
TitSecao         VARCHAR(03)      NULL,
CPF              VARCHAR(11)      NULL,
PRIMARY KEY (ID_Eleitor)
);

/*******************************************************************************
*                                                                              *
* Cria a tabela LOGRADOUROTIPO                                                 *
*                                                                              *
*******************************************************************************/
CREATE TABLE LOGRADOUROTIPO
(
ID_Tipo          INT          NOT NULL AUTO_INCREMENT,
Descricao        VARCHAR(30)  NOT NULL,
PRIMARY KEY (ID_Tipo)
);


/*******************************************************************************
*                                                                              *
* Cria a tabela TITULORELATORIO                                                *
*                                                                              *
*******************************************************************************/
CREATE TABLE TITRELAT
(
ID_TitRelat      INT           NOT NULL AUTO_INCREMENT,
Descricao        VARCHAR(100)  NOT NULL,
Tipo             INT           NOT NULL,
PRIMARY KEY (ID_TitRelat)
);



SELECT ID_TitRelat,
       Descricao,
       Tipo
FROM   TITRELAT
WHERE  Tipo LIKE :sTipo
ORDER BY Descricao


/*
SELECT   ID_Eleitor,
         NomePrimeiro,
         NomeRestante,
         Apelido,
         LograID_Tipo,
         LograDescricao,
         LograNumero,
         LograComplemento,
         LograID_Bairro,
         LograCEP,
         LograCidade,
         LograUF,
         ID_Classificacao,
         ID_Sexo,
         ConquistadoPor,
         Email,
         DataNasc,
         TitNumero,
         TitZona,
         TitSecao,
         CPF
FROM     ELEITOR
ORDER BY ID_Eleitor



SELECT   ID_Tipo,
         Descricao
FROM     LOGRADOUROTIPO
ORDER BY ID_Tipo


SELECT   ID_Classificacao,
         Descricao
FROM     ELEITORCLASSIFICACAO
ORDER BY ID_Classificacao


SELECT   ID_Sexo,
         Descricao
FROM     SEXO
ORDER BY ID_Sexo


SELECT   ID_Bairro,
         Descricao
FROM     BAIRRO
ORDER BY ID_Bairro
*/
