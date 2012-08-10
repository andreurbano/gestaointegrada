unit ufrmCadResiduo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFRMMANUTENCAOBD, Menus, DB, DataSourceUrb, DBClient,
  ClientDataSetUrb, ImgList, DBClientActns, DBActns, ActnList, Buttons,
  ComCtrls, Grids, DBGrids, DBGridUrb, ExtCtrls, StdCtrls, Mask, DBCtrls,
  FMTBcd, SqlExpr, Provider, DataSetProviderUrb;

type
  TfrmCadResiduo = class(TfrmManutencaoBD)
    cdsManuBDID_Residuo: TIntegerField;
    cdsManuBDDescricao: TStringField;
    lblDescricao: TLabel;
    txtDescricao: TDBEdit;
    cdsManuBDFlagContaminado: TStringField;
    chkContaminado: TDBCheckBox;
    lblValorMercado: TLabel;
    txtValorMercado: TDBEdit;
    cdsManuBDValorMercado: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadResiduo: TfrmCadResiduo;

implementation

{$R *.dfm}

procedure TfrmCadResiduo.FormCreate(Sender: TObject);
begin
  sTabelaNome  := 'residuo';
  sCampoIDNome := 'ID_Residuo';
  //
  sqlManuBD.CommandText := ' select ID_Residuo, Descricao, FlagContaminado, ValorMercado from residuo order by Descricao ';
  //
  inherited;
end;

end.
