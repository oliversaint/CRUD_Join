unit Crud.Main.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.AppEvnts, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client;

type
  TMainView = class(TForm)
    pnl_fundo: TPanel;
    pnl_topo: TPanel;
    btn_seleciona_empresa: TSpeedButton;
    btn_fechar: TSpeedButton;
    btn_minimizar: TSpeedButton;
    Image1: TImage;
    lbl_usuario: TLabel;
    pnl_barra_topo: TPanel;
    pnl_principal: TPanel;
    pnl_barra_lateral: TPanel;
    pnl_menu_lateral: TPanel;
    btn_funcionarios: TSpeedButton;
    btn_alunos: TSpeedButton;
    btn_menu: TSpeedButton;
    pnl_barra: TPanel;
    pnl_barra_botao: TPanel;
    ApplicationEvents: TApplicationEvents;
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_alunosMouseEnter(Sender: TObject);
    procedure btn_alunosMouseLeave(Sender: TObject);
    procedure btn_menuClick(Sender: TObject);
    procedure btn_alunosClick(Sender: TObject);
    procedure btn_funcionariosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainView: TMainView;
  bExpandido : Boolean;

implementation

{$R *.dfm}

uses
  Crud.Helper.Controls,
  Crud.Product.View, Crud.Categoria.View;

procedure TMainView.btn_alunosClick(Sender: TObject);
begin

  ProductView         :=  TProductView.Create(Self);
  ProductView.Parent  :=  pnl_principal;
  ProductView.Show;

end;

procedure TMainView.btn_alunosMouseEnter(Sender: TObject);
begin
  focar_botao(
    pnl_barra_botao,
    TSpeedButton(Sender),
    True
  );
end;

procedure TMainView.btn_alunosMouseLeave(Sender: TObject);
begin
  focar_botao(
    pnl_barra_botao,
    TSpeedButton(Sender),
    False
  );
end;

procedure TMainView.btn_fecharClick(Sender: TObject);
begin

  Application.Terminate;

end;

procedure TMainView.btn_funcionariosClick(Sender: TObject);
begin

  CategoriaView :=  TCategoriaView.Create(nil);
  CategoriaView.Parent  :=  pnl_principal;
  CategoriaView.Show;

end;

procedure TMainView.btn_menuClick(Sender: TObject);
begin

  if bExpandido then
    pnl_menu_lateral.Width := 40
  else
    pnl_menu_lateral.Width := 160;

  bExpandido := not bExpandido;

end;

end.
