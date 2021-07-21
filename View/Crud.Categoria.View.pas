unit Crud.Categoria.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Crud.Base.View, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Crud.Controller, Crud.Controller.Interfaces;

type
  TCategoriaView = class(TBaseView)
    Label1: TLabel;
    Label2: TLabel;
    edt_id_categoria: TEdit;
    edt_nome_categoria: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btn_consultarClick(Sender: TObject);
    procedure btn_confirmarClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure carrega_campos(AId: Integer);

    var
      FController : iController;

  end;

var
  CategoriaView: TCategoriaView;

implementation

{$R *.dfm}

uses
  Crud.Consultat.View;

procedure TCategoriaView.btn_confirmarClick(Sender: TObject);
begin
  FController.Categoria.This.Entity.nome_categoria  :=  edt_nome_categoria.Text;
  if ds_data.DataSet.Fields[0].AsInteger > 0 then
    FController.Categoria.This.Update
  else
    FController.Categoria.This.Insert;
end;

procedure TCategoriaView.btn_consultarClick(Sender: TObject);
begin
  ConsultaView                  :=  TConsultaView.Create(nil);
  ConsultaView.dsPadrao.DataSet :=  FController.Categoria.This.List;
  ConsultaView.Parent           :=  Self.Parent;
  ConsultaView.Show;
end;

procedure TCategoriaView.carrega_campos(AId: Integer);
begin
  ds_data.DataSet         :=  FController.Categoria.This.ListById(Aid);
  edt_id_categoria.Text   :=  ds_data.DataSet.Fields[0].AsString;
  edt_nome_categoria.Text :=  ds_data.DataSet.Fields[1].AsString;
end;

procedure TCategoriaView.FormCreate(Sender: TObject);
begin
  inherited;
  FController :=  TController.New;

  edt_id_categoria.Text   :=  '';
  edt_nome_categoria.Text :=  '';

end;

end.
