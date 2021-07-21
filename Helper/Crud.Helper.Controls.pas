unit Crud.Helper.Controls;

interface

uses
  Vcl.Grids,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.Graphics,
  Vcl.ComCtrls,
  Vcl.DBGrids,
  FireDAC.Comp.Client;

type
  TDBGridPadrao = class(TCustomGrid);

procedure focar_botao(APainel: TPanel; ABotao: TSpeedButton; AFocar: Boolean);
procedure ocultar_tabs(APageControl : TPageControl);
procedure ordena_grid(AQuery: TFDQuery; AColuna: TColumn);
procedure ajusta_tamanho_linha(dbg: TDBGrid);

implementation

procedure ajusta_tamanho_linha(dbg: TDBGrid);
begin
  TDBGridPadrao(dbg).DefaultRowHeight :=  32;
  TDBGridPadrao(dbg).ClientHeight     :=  (33 * TDBGridPadrao(dbg).RowCount) + 33 ;
  TDBGridPadrao(dbg).RowHeights[0]    :=  30;
end;

procedure ordena_grid(AQuery: TFDQuery; AColuna: TColumn);
begin

  if AQuery.IndexFieldNames = AColuna.FieldName then
    AQuery.IndexFieldNames := AColuna.FieldName + ':D'
  else
    AQuery.IndexFieldNames := AColuna.FieldName;

  AQuery.First;

end;

procedure focar_botao(APainel: TPanel; ABotao: TSpeedButton; AFocar: Boolean);
begin

  if AFocar then begin
    ABotao.Font.Color := clBlack;
    ABotao.Font.Style := [fsBold];

    APainel.Parent  := ABotao.Parent;
    APainel.Left    := ABotao.Left ;
    APainel.Top     := ABotao.Top ;
    APainel.Height  := ABotao.Height -1;

    APainel.Visible := True;
    APainel.BringToFront;

  end else begin
    ABotao.Font.Color := $00626262;
    ABotao.Font.Style := [];
    APainel.Visible   := False;
  end;

end;

procedure ocultar_tabs(APageControl : TPageControl);
var
  page :Integer;
begin

  for page := 0 to APageControl.PageCount - 1 do
    APageControl.Pages[page].tabvisible := False;

  APageControl.ActivePageIndex := 0;

end;


end.
