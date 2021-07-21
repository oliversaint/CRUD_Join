unit Crud.Controller.Interfaces;

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
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  Data.DB,
  FireDAC.Comp.Client,
  Crud.Services.Generic,
  Crud.Model.Entity.Produto,
  Crud.Model.Entity.Categoria;

type
  iControllerServices<T : class> = interface;

  iController = interface
    ['{56CE1A21-E4CC-409F-BCA1-1433F0F136DE}']
    function Produto : iControllerServices<TProduto>;
    function Categoria : iControllerServices<TCategoria>;
  end;

  iControllerServices<T: class> = interface
    function This : iService<T>;
    function &End: IController;
  end;

implementation

end.
