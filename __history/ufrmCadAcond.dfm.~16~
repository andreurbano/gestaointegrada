inherited frmCadAcond: TfrmCadAcond
  Caption = 'Cadastro de Acondicionamento'
  ClientHeight = 258
  ClientWidth = 425
  ExplicitWidth = 433
  ExplicitHeight = 285
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlManutencaoBD: TPanel
    Width = 336
    Height = 231
    ExplicitHeight = 231
    inherited pgcManutencaoBD: TPageControl
      Width = 316
      Height = 213
      ExplicitHeight = 213
      inherited tbsListagem: TTabSheet
        ExplicitWidth = 507
        ExplicitHeight = 202
        inherited pnlListagem: TPanel
          Width = 308
          Height = 203
          ExplicitHeight = 202
          inherited dbgManutencaoBD: TDBGridUrb
            Width = 306
            Height = 201
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_Acondicionamento'
                Title.Alignment = taCenter
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Descricao'
                Visible = True
              end>
          end
        end
      end
      inherited tbsCadastro: TTabSheet
        ExplicitWidth = 308
        ExplicitHeight = 203
        inherited pnlCadastro: TPanel
          Width = 308
          Height = 203
          ExplicitHeight = 203
          object lblDescricao: TLabel
            Left = 54
            Top = 83
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
          object txtDescricao: TDBEdit
            Left = 54
            Top = 99
            Width = 200
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'Descricao'
            DataSource = dtsManuBD
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited stbManutencaoBD: TStatusBar
    Top = 239
    Width = 425
    ExplicitTop = 239
    ExplicitWidth = 425
  end
  inherited pnlBotoes: TPanel
    Left = 347
    Height = 231
    ExplicitHeight = 231
  end
  inherited cdsManuBD: TClientDataSetUrb
    object cdsManuBDID_Acondicionamento: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id.'
      FieldName = 'ID_Acondicionamento'
      Required = True
      DisplayFormat = '000000'
      EditFormat = '000000'
    end
    object cdsManuBDDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 37
      FieldName = 'Descricao'
      Required = True
      Size = 30
    end
  end
  inherited sqlManuBD: TSQLDataSet
    CommandText = 
      'select ID_Acondicionamento, Descricao from acondicionamento orde' +
      'r by Descricao'
  end
end
