inherited CategoriaView: TCategoriaView
  Caption = 'Categoria'
  OnCreate = FormCreate
  ExplicitLeft = 2
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnl_fundo: TPanel
    inherited pgc_dados: TPageControl
      inherited tbs_dados_gerais: TTabSheet
        ExplicitLeft = 5
        object Label1: TLabel
          Left = 24
          Top = 40
          Width = 97
          Height = 15
          Caption = 'C'#243'digo Categoria'
        end
        object Label2: TLabel
          Left = 135
          Top = 40
          Width = 92
          Height = 15
          Caption = 'Nome Categoria'
        end
        object edt_id_categoria: TEdit
          Left = 24
          Top = 61
          Width = 97
          Height = 23
          Enabled = False
          TabOrder = 0
        end
        object edt_nome_categoria: TEdit
          Left = 135
          Top = 61
          Width = 313
          Height = 23
          TabOrder = 1
        end
      end
    end
    inherited pnl_botoes: TPanel
      inherited pnl_conteudo_botoes: TPanel
        inherited pnl_btn_consultar: TPanel
          inherited btn_consultar: TSpeedButton
            OnClick = btn_consultarClick
          end
        end
      end
    end
  end
  inherited ds_data: TDataSource
    Left = 576
    Top = 264
  end
end
