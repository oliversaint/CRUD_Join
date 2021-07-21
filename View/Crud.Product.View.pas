unit Crud.Product.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Crud.Base.View, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Crud.Controller, Crud.Controller.Interfaces;

type
  TProductView = class(TBaseView)
    Label1: TLabel;
    edt_id_produto: TEdit;
    Label2: TLabel;
    edt_nome_produto: TEdit;
    cbx_categoria: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    edt_data_cadastro: TEdit;
    Label5: TLabel;
    edt_valor_produto: TEdit;
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_consultarClick(Sender: TObject);
    procedure btn_confirmarClick(Sender: TObject);
  private
    { Private declarations }
    procedure preencher_categorias;

  public
    { Public declarations }
    var
      FController : iController;
  end;

var
  ProductView: TProductView;

implementation

{$R *.dfm}

uses
  Crud.Categoria.View,
  Crud.Consultat.View;

procedure TProductView.btn_cancelarClick(Sender: TObject);
begin
  inherited;
  //implement here
end;

procedure TProductView.btn_confirmarClick(Sender: TObject);
begin
  inherited;
  FController.Produto.This.Entity.id_categoria_produto :=  Integer(cbx_categoria.Items.IndexOfObject(TObject(cbx_categoria.ItemIndex)));
  FController.Produto.This.Entity.nome_produto         :=  edt_nome_produto.Text;
  FController.Produto.This.Entity.data_cadastro        :=  StrToDateTime(edt_data_cadastro.Text);
  FController.Produto.This.Entity.valor_produto        :=  StrToFloatDef(edt_valor_produto.Text,0);
  if ds_data.DataSet.Fields[0].AsInteger > 0 then
    FController.Produto.This.Update
  else
    FController.Produto.This.Insert;
end;

procedure TProductView.btn_consultarClick(Sender: TObject);
begin
  ConsultaView                  :=  TConsultaView.Create(nil);
  ConsultaView.dsPadrao.DataSet :=  FController.Produto.This.List;
  ConsultaView.Parent           :=  Self.Parent;
  ConsultaView.Show;
end;

procedure TProductView.FormCreate(Sender: TObject);
begin
  inherited;
  FController             :=  TController.New;
  edt_id_produto.Text     :=  '';
  preencher_categorias;
  edt_nome_produto.Text   :=  '';
  edt_data_cadastro.Text  :=  DateToStr(Date);
  edt_valor_produto.Text  :=  '0,00';
end;

procedure TProductView.preencher_categorias;
var
  ds_cat : TDataSet;
  I: Integer;
begin
  cbx_categoria.Items.Clear;
  ds_cat := TDataSet.Create(nil);
  try
    ds_cat := FController.Categoria.This.List;
    ds_cat.First;
    while not ds_cat.Eof do begin
      cbx_categoria.Items.AddObject(ds_cat.Fields[1].AsString, TObject(ds_cat.Fields[0].AsInteger));
      ds_cat.Next;
    end;
  finally
    ds_cat.DisposeOf;
  end;
  if cbx_categoria.Items.Count>0 then
    cbx_categoria.ItemIndex := 0;
end;

end.
