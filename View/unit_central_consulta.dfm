object form_central_consulta: Tform_central_consulta
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  ClientHeight = 575
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_fundo: TPanel
    Left = 0
    Top = 0
    Width = 1024
    Height = 575
    Align = alClient
    BevelOuter = bvNone
    Color = 16053492
    ParentBackground = False
    TabOrder = 0
    object pnl_dbgrid: TPanel
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 1008
      Height = 567
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8668966
      Font.Height = -13
      Font.Name = 'Open Sans'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object pnl_Rodape: TPanel
        Left = 0
        Top = 548
        Width = 1008
        Height = 19
        Align = alBottom
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object lbl_duplo_clique: TLabel
          AlignWithMargins = True
          Left = 653
          Top = 0
          Width = 345
          Height = 17
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 0
          Align = alRight
          Caption = 'DUPLO CLIQUE na linha desejada abre para ALTERA'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8011008
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_excluir: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 0
          Width = 494
          Height = 17
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = 
            'Para EXCLUIR, selecione a LINHA que deseja e aperte DEL ou DELET' +
            'E no teclado'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8011008
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
      end
      object dbg_registros: TDBGrid
        AlignWithMargins = True
        Left = 10
        Top = 57
        Width = 998
        Height = 491
        Margins.Left = 10
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 0
        TabStop = False
        Align = alClient
        BorderStyle = bsNone
        DataSource = dsPadrao
        DrawingStyle = gdsClassic
        FixedColor = clWhite
        GradientEndColor = 15329769
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6118749
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = 6447714
        TitleFont.Height = -13
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDrawColumnCell = dbg_registrosDrawColumnCell
        OnDblClick = dbg_registrosDblClick
        OnKeyDown = dbg_registrosKeyDown
        OnTitleClick = dbg_registrosTitleClick
      end
      object pnl_topo: TPanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        object lbl_titulo: TLabel
          AlignWithMargins = True
          Left = 10
          Top = 0
          Width = 131
          Height = 30
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Consultando '
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8011008
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object pnl_barra: TPanel
          Left = 0
          Top = 48
          Width = 1008
          Height = 1
          Align = alBottom
          BevelOuter = bvNone
          Color = 15395562
          ParentBackground = False
          TabOrder = 0
        end
        object pnl_busca: TPanel
          AlignWithMargins = True
          Left = 201
          Top = 7
          Width = 603
          Height = 34
          Margins.Left = 60
          Margins.Top = 7
          Margins.Right = 60
          Margins.Bottom = 7
          Align = alClient
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 1
          object btn_busca: TSpeedButton
            Left = 572
            Top = 0
            Width = 27
            Height = 30
            Cursor = crHandPoint
            Align = alRight
            Flat = True
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
            OnClick = btn_buscaClick
            ExplicitLeft = 243
            ExplicitTop = 10
            ExplicitHeight = 25
          end
          object edt_busca: TEdit
            AlignWithMargins = True
            Left = 5
            Top = 6
            Width = 556
            Height = 19
            Margins.Left = 5
            Margins.Top = 6
            Margins.Bottom = 5
            TabStop = False
            Align = alLeft
            Anchors = [akLeft, akTop, akRight, akBottom]
            BorderStyle = bsNone
            CharCase = ecUpperCase
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TextHint = 'DIGITE O QUE DESEJA ENCONTRAR'
            OnKeyDown = edt_buscaKeyDown
          end
        end
        object pnl_botao: TPanel
          Left = 864
          Top = 0
          Width = 144
          Height = 48
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 2
          DesignSize = (
            144
            48)
          object pnl_botao_cancelar: TPanel
            Left = 6
            Top = 7
            Width = 130
            Height = 34
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
            TabOrder = 0
            object btn_cancelar: TSpeedButton
              Left = 0
              Top = 0
              Width = 130
              Height = 34
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
            end
          end
        end
      end
    end
  end
  object dsPadrao: TDataSource
    Left = 40
    Top = 486
  end
  object ACBrEnterTab: TACBrEnterTab
    EnterAsTab = True
    Left = 101
    Top = 488
  end
end
