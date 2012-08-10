inherited frmCadResiduo: TfrmCadResiduo
  Left = 351
  Top = 185
  Caption = 'Cadastro de Res'#237'duos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlManutencaoBD: TPanel
    inherited pgcManutencaoBD: TPageControl
      inherited tbsListagem: TTabSheet
        ExplicitWidth = 507
        ExplicitHeight = 260
        inherited pnlListagem: TPanel
          inherited dbgManutencaoBD: TDBGridUrb
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_Residuo'
                Title.Alignment = taCenter
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Descricao'
                Width = 262
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FlagContaminado'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ValorMercado'
                Width = 83
                Visible = True
              end>
          end
        end
      end
      inherited tbsCadastro: TTabSheet
        inherited pnlCadastro: TPanel
          object lblDescricao: TLabel
            Left = 41
            Top = 79
            Width = 48
            Height = 13
            Caption = 'Descri'#231#227'o'
            FocusControl = txtDescricao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblValorMercado: TLabel
            Left = 41
            Top = 121
            Width = 84
            Height = 13
            Caption = 'Valor de Mercado'
            FocusControl = txtValorMercado
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object txtDescricao: TDBEdit
            Left = 41
            Top = 95
            Width = 426
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'Descricao'
            DataSource = dtsManuBD
            TabOrder = 0
          end
          object chkContaminado: TDBCheckBox
            Left = 41
            Top = 164
            Width = 97
            Height = 17
            Caption = 'Contaminado'
            DataField = 'FlagContaminado'
            DataSource = dtsManuBD
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object txtValorMercado: TDBEdit
            Left = 41
            Top = 137
            Width = 86
            Height = 21
            DataField = 'ValorMercado'
            DataSource = dtsManuBD
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited cdsManuBD: TClientDataSetUrb
    object cdsManuBDID_Residuo: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id.'
      FieldName = 'ID_Residuo'
      Required = True
      DisplayFormat = '000000'
    end
    object cdsManuBDDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Required = True
      Size = 50
    end
    object cdsManuBDFlagContaminado: TStringField
      Alignment = taCenter
      DisplayLabel = 'Contaminado'
      FieldName = 'FlagContaminado'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsManuBDValorMercado: TFMTBCDField
      DisplayLabel = 'V. de Merc.'
      FieldName = 'ValorMercado'
      DisplayFormat = '###,##0.00'
      Precision = 14
      Size = 2
    end
  end
  inherited sqlManuBD: TSQLDataSet
    SchemaName = 'andre'
    CommandText = 
      'select ID_Residuo, Descricao, FlagContaminado, ValorMercado from' +
      ' residuo order by Descricao'
  end
end
