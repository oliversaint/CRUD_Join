unit Crud.Controller;

interface

uses
FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  Data.DB,
  FireDAC.Comp.Client,
  Crud.Controller.Interfaces,
  Crud.Controller.Generic,
  Crud.Model.Entity.Categoria,
  Crud.Model.Entity.Produto;

type
  TController = class(TInterfacedObject, iController)
    private
      FProduto   : iControllerServices<TProduto>;
      FCategoria : iControllerServices<TCategoria>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iController;
      function Categoria : iControllerServices<TCategoria>;
      function Produto : iControllerServices<TProduto>;
  end;

implementation

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin

  inherited;
end;

class function TController.New : iController;
begin
  Result := Self.Create;
end;

function TController.Categoria: iControllerServices<TCategoria>;
begin
  if not Assigned(FCategoria) then
    FCategoria := TControllerGeneric<TCategoria>.New(Self);
  Result := FCategoria;
end;

function TController.Produto: iControllerServices<TProduto>;
begin
  if not Assigned(FProduto) then
    FProduto := TControllerGeneric<TProduto>.New(Self);
  Result := FProduto;
end;

end.

