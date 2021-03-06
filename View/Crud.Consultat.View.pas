unit Crud.Consultat.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Comp.Client;

type
  TConsultaView = class(TForm)
    pnl_dbgrid: TPanel;
    pnl_Rodape: TPanel;
    lbl_excluir: TLabel;
    lbl_duplo_clique: TLabel;
    pnl_fundo: TPanel;
    dbg_registros: TDBGrid;
    dsPadrao: TDataSource;
    pnl_topo: TPanel;
    pnl_botao_cancelar: TPanel;
    btn_cancelar: TSpeedButton;
    lbl_titulo: TLabel;
    pnl_barra: TPanel;
    pnl_busca: TPanel;
    btn_busca: TSpeedButton;
    edt_busca: TEdit;
    pnl_botao: TPanel;
    procedure dbg_registrosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbg_registrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dbg_registrosDblClick(Sender: TObject);
    procedure dbg_registrosTitleClick(Column: TColumn);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_buscaClick(Sender: TObject);
    procedure edt_buscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    procedure AddColunaGrid(NomeCampo, TituloCampo: String; Tamanho: Double);
    { Private declarations }
  public
    { Public declarations }
    var_texto_busca: String;
    FId : Integer;

  end;

var
  ConsultaView: TConsultaView;

implementation

{$R *.dfm}

uses
  Crud.Helper.Controls;

procedure TConsultaView.AddColunaGrid( NomeCampo, TituloCampo :String; Tamanho :Double );
begin
  with dbg_registros.Columns.Add do
  begin
    FieldName     := NomeCampo;
    Title.Caption := TituloCampo;
    Visible       := True;
    Width         := Round(pnl_dbgrid.Width * Tamanho - 5);
  end;
end;

procedure TConsultaView.btn_buscaClick(Sender: TObject);
begin
  var_texto_busca := edt_busca.Text;
  ShowScrollBar(dbg_registros.Handle, SB_Vert, True);
  ajusta_tamanho_linha(dbg_registros);
  ordena_grid((dsPadrao.DataSet As TFDQuery), dbg_registros.Columns[0]);
end;

procedure TConsultaView.btn_cancelarClick(Sender: TObject);
begin
  edt_busca.Clear;
  dsPadrao.DataSet := nil;
  Self.Close;
end;

procedure TConsultaView.dbg_registrosDblClick(Sender: TObject);
begin
  if dbg_registros.DataSource.DataSet.IsEmpty then
    exit;
  FId :=  dsPadrao.DataSet.Fields[0].AsInteger;
  Self.Close;
end;

procedure TConsultaView.dbg_registrosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Odd( dbg_registros.DataSource.DataSet.RecNo) then
    dbg_registros.Canvas.Brush.Color :=  $00FBFBFB
  else
    dbg_registros.Canvas.Brush.Color := clwhite;//$00F9F9F9;

  if ( gdSelected in State ) then
  begin
    dbg_registros.Canvas.Brush.Color := $00FFE8CC;
    dbg_registros.Canvas.Font.Color  := clBlack;
    dbg_registros.Canvas.Font.Style  := [fsBold];
  end;

  dbg_registros.Canvas.FillRect(Rect);
  dbg_registros.DefaultDrawColumnCell( Rect, DataCol, Column, State);
  dbg_registros.Canvas.TextRect( Rect, Rect.Left + 8, Rect.Top + 8, Column.Field.DisplayText );
end;


procedure TConsultaView.dbg_registrosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if (Key = VK_DELETE) then begin


  end;

end;

procedure TConsultaView.dbg_registrosTitleClick(Column: TColumn);
var
  I: Integer;
begin

  if dbg_registros.DataSource.DataSet.Active then begin
    for I := 0 to dbg_registros.Columns.Count - 1 do begin
      if dbg_registros.Columns[i].FieldName = Column.FieldName then begin
        dbg_registros.Columns[i].Title.Font.Color := clRed;
        dbg_registros.Columns[i].Title.Font.Style := [fsBold];

      end else begin
        dbg_registros.Columns[i].Title.Font.Color := $00626262;
        dbg_registros.Columns[i].Title.Font.Style := [];
      end;
    end;

    ordena_grid((dsPadrao.DataSet As TFDQuery ),Column);
    ajusta_tamanho_linha( dbg_registros );

  end;
end;

procedure TConsultaView.edt_buscaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    btn_buscaClick( Self );
end;

procedure TConsultaView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dbg_registros.Columns.Clear;
end;

procedure TConsultaView.FormCreate(Sender: TObject);
begin
  FId :=  0;
end;

procedure TConsultaView.FormShow(Sender: TObject);
begin

  edt_busca.Clear;
  ordena_grid((dsPadrao.DataSet As TFDQuery), dbg_registros.Columns[0]);
  ShowScrollBar(dbg_registros.Handle, SB_Vert, True);
  ajusta_tamanho_linha(dbg_registros);

end;

end.
