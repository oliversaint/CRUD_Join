inherited ProductView: TProductView
  Caption = 'ProductView'
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
          Top = 16
          Width = 87
          Height = 15
          Caption = 'C'#243'digo Produto'
        end
        object Label2: TLabel
          Left = 288
          Top = 16
          Width = 99
          Height = 15
          Caption = 'Nome do Produto'
        end
        object Label3: TLabel
          Left = 128
          Top = 16
          Width = 55
          Height = 15
          Caption = 'Categoria'
        end
        object Label4: TLabel
          Left = 576
          Top = 16
          Width = 82
          Height = 15
          Caption = 'Data Cadastro'
        end
        object Label5: TLabel
          Left = 696
          Top = 16
          Width = 95
          Height = 15
          Caption = 'Valor do Produto'
        end
        object edt_id_produto: TEdit
          Left = 24
          Top = 37
          Width = 87
          Height = 23
          Enabled = False
          TabOrder = 0
        end
        object edt_nome_produto: TEdit
          Left = 288
          Top = 37
          Width = 273
          Height = 23
          MaxLength = 150
          TabOrder = 2
        end
        object cbx_categoria: TComboBox
          Left = 128
          Top = 37
          Width = 145
          Height = 23
          TabOrder = 1
        end
        object edt_data_cadastro: TEdit
          Left = 576
          Top = 37
          Width = 100
          Height = 23
          Enabled = False
          TabOrder = 3
        end
        object edt_valor_produto: TEdit
          Left = 696
          Top = 37
          Width = 95
          Height = 23
          TabOrder = 4
        end
      end
    end
    inherited pnl_botoes: TPanel
      inherited btn_dados_gerais: TSpeedButton
        ExplicitLeft = 4
        ExplicitTop = 4
        ExplicitHeight = 35
      end
      inherited pnl_conteudo_botoes: TPanel
        inherited pnl_btn_consultar: TPanel
          inherited btn_consultar: TSpeedButton
            OnClick = btn_consultarClick
            ExplicitTop = -2
            ExplicitHeight = 35
          end
        end
      end
    end
  end
end
