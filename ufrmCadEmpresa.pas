unit ufrmCadEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFRMMANUTENCAOBD, Menus, DB, DataSourceUrb, DBClient,
  ClientDataSetUrb, ImgList, DBClientActns, DBActns, ActnList, Buttons,
  ComCtrls, Grids, DBGrids, DBGridUrb, ExtCtrls, DBCtrls, StdCtrls, Mask,
  FMTBcd, SqlExpr, Provider, DataSetProviderUrb;

type
  TfrmCadEmpresa = class(TfrmManutencaoBD)
    cdsClassificacao: TClientDataSetUrb;
    dtsClassificacao: TDataSourceUrb;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    btnCadTipo: TSpeedButton;
    gbxRelatorios: TGroupBox;
    chkContaminado: TDBCheckBox;
    chkReciclavel: TDBCheckBox;
    chkSucata: TDBCheckBox;
    rdgResumoGeral: TDBRadioGroup;
    txtObs: TDBMemo;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    cdsFantasia: TClientDataSetUrb;
    dtsFantasia: TDataSourceUrb;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    sqlClassificacao: TSQLDataSet;
    dspClassificacao: TDataSetProviderUrb;
    sqlFantasia: TSQLDataSet;
    dspFantasia: TDataSetProviderUrb;
    cdsManuBDID_Empresa: TIntegerField;
    cdsManuBDRazaoSocial: TStringField;
    cdsManuBDID_Classificacao: TIntegerField;
    cdsManuBDEndereco: TStringField;
    cdsManuBDMunicipio: TStringField;
    cdsManuBDUF: TStringField;
    cdsManuBDTelefone: TStringField;
    cdsManuBDNumLicencaFEEMA: TStringField;
    cdsManuBDValorContrato: TFMTBCDField;
    cdsManuBDValorTonelada: TFMTBCDField;
    cdsManuBDFlagRelContaminado: TStringField;
    cdsManuBDFlagRelReciclavel: TStringField;
    cdsManuBDFlagRelSucata: TStringField;
    cdsManuBDTipoResumoGeral: TIntegerField;
    cdsManuBDResponsavel: TStringField;
    cdsManuBDID_Fantasia: TIntegerField;
    cdsManuBDCEP: TStringField;
    cdsManuBDCNPJ: TStringField;
    cdsManuBDInscEstado: TStringField;
    cdsManuBDObs: TBlobField;
    sqlManuBDID_Empresa: TIntegerField;
    sqlManuBDRazaoSocial: TStringField;
    sqlManuBDID_Classificacao: TIntegerField;
    sqlManuBDEndereco: TStringField;
    sqlManuBDMunicipio: TStringField;
    sqlManuBDUF: TStringField;
    sqlManuBDTelefone: TStringField;
    sqlManuBDNumLicencaFEEMA: TStringField;
    sqlManuBDValorContrato: TFMTBCDField;
    sqlManuBDValorTonelada: TFMTBCDField;
    sqlManuBDFlagRelContaminado: TStringField;
    sqlManuBDFlagRelReciclavel: TStringField;
    sqlManuBDFlagRelSucata: TStringField;
    sqlManuBDTipoResumoGeral: TIntegerField;
    sqlManuBDResponsavel: TStringField;
    sqlManuBDID_Fantasia: TIntegerField;
    sqlManuBDCEP: TStringField;
    sqlManuBDCNPJ: TStringField;
    sqlManuBDInscEstado: TStringField;
    sqlManuBDObs: TBlobField;
    sqlManuBDEmail: TStringField;
    sqlManuBDInscMunic: TStringField;
    sqlManuBDTelefoneII: TStringField;
    cdsManuBDEmail: TStringField;
    cdsManuBDInscMunic: TStringField;
    cdsManuBDTelefoneII: TStringField;
    cdsManuBDNomeFantasia: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    Label15: TLabel;
    DBEdit13: TDBEdit;
    Label17: TLabel;
    DBEdit15: TDBEdit;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    cdsManuBDClassificacao: TStringField;
    Label19: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnCadTipoClick(Sender: TObject);
    procedure DBLookupComboBox1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEmpresa: TfrmCadEmpresa;

implementation

uses ufrmCadTipoEmpresa;

{$R *.dfm}

procedure TfrmCadEmpresa.FormCreate(Sender: TObject);
begin
  sTabelaNome  := 'empresa';
  sCampoIDNome := 'ID_Empresa';

  // Ativa Dataset Classificação
  cdsClassificacao.Active      := False;
  sqlClassificacao.CommandText := ' select ID_Classificacao, Descricao from classificacao order by Descricao ';
  cdsClassificacao.Active      := True;

  // Ativa Dataset Fantasia
  cdsFantasia.Active      := False;
  sqlFantasia.CommandText := ' select ID_Fantasia, Descricao from fantasia order by Descricao ';
  cdsFantasia.Active      := True;

  // Ativa Dataset Empresas
  sqlManuBD.CommandText := ' select ID_Empresa, RazaoSocial, ID_Classificacao, Endereco, Municipio, UF, ' +
                                  ' Telefone, NumLicencaFEEMA, ValorContrato, ValorTonelada, FlagRelContaminado, ' +
                                  ' FlagRelReciclavel, FlagRelSucata, TipoResumoGeral, Responsavel, ID_Fantasia, ' +
                                  ' CEP, CNPJ, InscEstado, Email, TelefoneII, InscMunic, Obs ' +
                           ' from empresa order by RazaoSocial ';


  //
  inherited;
end;

procedure TfrmCadEmpresa.btnCadTipoClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCadTipoEmpresa, frmCadTipoEmpresa);
end;

procedure TfrmCadEmpresa.DBLookupComboBox1Enter(Sender: TObject);
begin
  inherited;
  cdsClassificacao.Active := False;
  cdsClassificacao.Active := True;
end;

end.
