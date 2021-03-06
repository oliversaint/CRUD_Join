unit Crud.Services.Generic;

interface

uses
  SimpleInterface,
  SimpleDAO,
  SimpleAttributes,
  SimpleQueryFiredac,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  FireDAC.Phys.MySQL,
  Data.DB,
  FireDAC.Comp.Client,
  Crud.Resource.Interfaces,
  Crud.Resource.Conexao;

type
  iService<T: class> = interface
    ['{BA91F781-40A7-4FEF-B154-29031E05047D}']
    function List : TDataSet;
    function ListById(AId: Integer): TDataSet;
    function ListLastRecord: TDataSet;
    function ListByFilter(AKey: string; AValue: Variant): TDataSet;
    function Insert : TDataSet;
    function Update : TDataSet;
    function Delete : TDataSet; overload;
    function Delete(AField: string; AValue: Variant): TDataSet; overload;
    function Entity : T;
  end;

  TService<T: class, constructor> = class(TInterfacedObject, iService<T>)
    private
      FParent   : T;
      FConexao  : iConexao;
      FConn     : iSimpleQuery;
      FDAO      : iSimpleDAO<T>;
      FDataSource : TDataSource;
    public
      constructor Create;
      destructor  Destroy; override;
      class function New : iService<T>;
      function List : TDataSet;
      function ListById(AId: Integer): TDataSet;
      function ListLastRecord: TDataSet;
      function ListByFilter(AKey: string; AValue: Variant): TDataSet;
      function Insert : TDataSet;
      function Update : TDataSet;
      function Delete : TDataSet; overload;
      function Delete(AField: string; AValue: Variant): TDataSet; overload;
      function Entity : T;
  end;

implementation

{ TService<T> }

constructor TService<T>.Create;
begin
  FParent     :=  T.Create;
  FDataSource :=  TDataSource.Create(nil);
  FConexao    :=  TConexao.New;
  FConn       :=  TSimpleQueryFiredac.New(TFDConnection(FConexao.Connect));
  FDAO        :=  TSimpleDAO<T>.New(FConn).DataSource(FDataSource);
end;

function TService<T>.Delete: TDataSet;
begin
  FDAO.Delete(FParent);
  Result := FDataSource.DataSet;
end;

function TService<T>.Delete(AField: string; AValue: Variant): TDataSet;
begin
  FDAO.Delete(AField, AValue);
  Result := FDataSource.DataSet;
end;

destructor TService<T>.Destroy;
begin
  FDataSource.DisposeOf;
  FParent.Disposeof;
  inherited;
end;

function TService<T>.Entity: T;
begin
  Result  :=  FParent;
end;

function TService<T>.Insert: TDataSet;
begin
  FDAO.Insert(FParent);
  Result := FDataSource.DataSet;
end;

function TService<T>.List: TDataSet;
begin
  FDAO.Find;
  Result := FDataSource.DataSet;
end;

function TService<T>.ListByFilter(AKey: string; AValue: Variant): TDataSet;
begin
  FDAO.Find(AKey, AValue);
  Result := FDataSource.DataSet;
end;

function TService<T>.ListById(AId: Integer): TDataSet;
begin
  FDAO.Find(AId);
  Result := FDataSource.DataSet;
end;

function TService<T>.ListLastRecord: TDataSet;
begin
  FDAO.LastRecord;
  Result := FDataSource.DataSet;
end;

class function TService<T>.New: iService<T>;
begin
  Result := Self.Create;
end;

function TService<T>.Update: TDataSet;
begin
  FDAO.Update(FParent);
  Result := FDataSource.DataSet;
end;

end.
