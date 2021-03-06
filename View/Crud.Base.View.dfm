object BaseView: TBaseView
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'BaseView'
  ClientHeight = 575
  ClientWidth = 1024
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Roboto'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnl_fundo: TPanel
    Left = 0
    Top = 0
    Width = 1024
    Height = 575
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object pgc_dados: TPageControl
      Left = 0
      Top = 49
      Width = 1024
      Height = 526
      ActivePage = tbs_dados_gerais
      Align = alClient
      Style = tsButtons
      TabOrder = 0
      object tbs_dados_gerais: TTabSheet
        Caption = 'tbs_dados_gerais'
      end
    end
    object pnl_botoes: TPanel
      Left = 0
      Top = 0
      Width = 1024
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object btn_dados_gerais: TSpeedButton
        AlignWithMargins = True
        Left = 5
        Top = 7
        Width = 100
        Height = 35
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Top = 7
        Margins.Right = 0
        Margins.Bottom = 7
        Align = alLeft
        GroupIndex = 1
        Down = True
        Caption = 'Dados Gerais'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8011008
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btn_dados_geraisClick
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitHeight = 40
      end
      object pnl_conteudo_botoes: TPanel
        Left = 568
        Top = 6
        Width = 427
        Height = 40
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          427
          40)
        object pnl_botao_confirma: TPanel
          Left = 160
          Top = 4
          Width = 130
          Height = 35
          Anchors = [akTop, akRight]
          BevelOuter = bvNone
          Color = 16024898
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12615680
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object btn_confirmar: TSpeedButton
            Left = 0
            Top = 0
            Width = 130
            Height = 35
            Cursor = crHandPoint
            Align = alClient
            Caption = 'Confirmar'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ExplicitLeft = -5
            ExplicitTop = -2
          end
        end
        object pnl_botao_cancelar: TPanel
          Left = 291
          Top = 4
          Width = 130
          Height = 35
          Anchors = [akTop, akRight]
          BevelOuter = bvNone
          Color = 15395562
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12615680
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          object btn_cancelar: TSpeedButton
            Left = 0
            Top = 0
            Width = 130
            Height = 35
            Cursor = crHandPoint
            Align = alClient
            Caption = 'Cancelar'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            OnClick = btn_cancelarClick
            ExplicitLeft = -8
          end
        end
        object pnl_btn_consultar: TPanel
          Left = 28
          Top = 4
          Width = 131
          Height = 35
          Anchors = [akTop, akRight]
          BevelOuter = bvNone
          Color = 15395562
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          object btn_consultar: TSpeedButton
            Left = 0
            Top = 0
            Width = 131
            Height = 35
            Cursor = crHandPoint
            Align = alClient
            Caption = 'Consultar'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 6447714
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            Glyph.Data = {
              26040000424D2604000000000000360000002800000012000000120000000100
              180000000000F0030000120B0000120B00000000000000000000E6E1DEE6E1DE
              E6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1
              DEE6E1DEE6E1DEE6E1DEB3B0AECBC7C50000E6E1DEE6E1DEE6E1DEE6E1DEE6E1
              DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DE9B
              99986C6C6CAFACAA0000E6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6
              E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DE9F9D9B6C6C6C9D9B9ADED9D6
              0000E6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DE
              E6E1DEE6E1DEE6E1DE9E9C9B6C6C6CA19F9EE6E1DEE6E1DE0000E6E1DEE6E1DE
              E6E1DEE6E1DEE5E0DDC1BEBCA3A09FA09E9CBBB8B6DDD8D6E6E1DEE6E1DE9C9A
              996C6C6CA2A09FE6E1DEE6E1DEE6E1DE0000E6E1DEE6E1DEE6E1DEBAB6B46D6D
              6D6C6C6C6C6C6C6C6C6C6C6C6C6C6C6CB1AEACA6A4A36C6C6CA3A19FE6E1DEE6
              E1DEE6E1DEE6E1DE0000E6E1DEE6E1DEAAA7A66C6C6C7B7B7ABCB9B7D9D5D2DD
              D8D6C5C1BF8D8C8B6C6C6C6C6C6CAEABA9E6E1DEE6E1DEE6E1DEE6E1DEE6E1DE
              0000E6E1DEC7C3C16C6C6C92908FE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DE
              B0AEAC6C6C6CB5B2B0E6E1DEE6E1DEE6E1DEE6E1DEE6E1DE0000E1DCD9767675
              6F6F6FE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DE8B89896C6C
              6CDFDBD8E6E1DEE6E1DEE6E1DEE6E1DE0000BAB7B56C6C6CA8A5A4E6E1DEE6E1
              DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DECDC9C76C6C6CB8B5B3E6E1DEE6
              E1DEE6E1DEE6E1DE0000A2A09F6C6C6CC6C3C0E6E1DEE6E1DEE6E1DEE6E1DEE6
              E1DEE6E1DEE6E1DEE6E1DEE2DDDA6C6C6C9D9B9AE6E1DEE6E1DEE6E1DEE6E1DE
              0000A5A3A26C6C6CC4C0BEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DE
              E6E1DEDFDBD86C6C6CA19F9EE6E1DEE6E1DEE6E1DEE6E1DE0000C4C0BE6C6C6C
              9A9897E6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEC1BDBB6C6C
              6CC2BFBCE6E1DEE6E1DEE6E1DEE6E1DE0000E5E0DD8483826C6C6CDDD9D6E6E1
              DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DE7979796C6C6CE5E0DDE6E1DEE6
              E1DEE6E1DEE6E1DE0000E6E1DED7D2D06C6C6C787777D9D4D1E6E1DEE6E1DEE6
              E1DEE6E1DEE6E1DE9492916C6C6CBCB9B7E6E1DEE6E1DEE6E1DEE6E1DEE6E1DE
              0000E6E1DEE6E1DEC1BDBB6C6C6C6C6C6C999796BEBAB8C3C0BDA6A4A36D6D6D
              6C6C6CABA8A7E6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DE0000E6E1DEE6E1DE
              E6E1DED1CDCA8A89886C6C6C6C6C6C6C6C6C6C6C6C7E7D7DC2BEBCE6E1DEE6E1
              DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DE0000E6E1DEE6E1DEE6E1DEE6E1DEE6E1
              DEC4C0BEAAA8A6A6A4A2BDBAB8E1DCD9E6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6
              E1DEE6E1DEE6E1DE0000}
            ParentFont = False
            ExplicitLeft = -5
            ExplicitTop = -3
            ExplicitHeight = 36
          end
        end
      end
    end
  end
  object ds_data: TDataSource
    Left = 496
    Top = 272
  end
end
