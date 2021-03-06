unit Crud.Base.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.DBCtrls,
  Vcl.Mask, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls, Crud.Controller,
  Crud.Consultat.View, Data.DB;

type
  TBaseView = class(TForm)
    pnl_fundo: TPanel;
    pgc_dados: TPageControl;
    tbs_dados_gerais: TTabSheet;
    pnl_botoes: TPanel;
    btn_dados_gerais: TSpeedButton;
    pnl_conteudo_botoes: TPanel;
    pnl_botao_confirma: TPanel;
    btn_confirmar: TSpeedButton;
    pnl_botao_cancelar: TPanel;
    btn_cancelar: TSpeedButton;
    pnl_btn_consultar: TPanel;
    btn_consultar: TSpeedButton;
    ds_data: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_dados_geraisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  BaseView  : TBaseView;
  Consulta  : TConsultaView;

implementation

{$R *.dfm}

uses Crud.Helper.Controls, Crud.Main.View;

procedure TBaseView.btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TBaseView.btn_dados_geraisClick(Sender: TObject);
begin

  pgc_dados.ActivePage  :=  tbs_dados_gerais;
  btn_dados_gerais.Down :=  True;

end;

procedure TBaseView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainView.pnl_menu_lateral.Enabled :=  True;
  Action  :=  caFree;
end;

procedure TBaseView.FormShow(Sender: TObject);
begin

  MainView.pnl_menu_lateral.Enabled :=  False;
  btn_dados_geraisClick(Self);
  ocultar_tabs(pgc_dados );
  pgc_dados.ActivePage              :=  tbs_dados_gerais;

end;

end.
