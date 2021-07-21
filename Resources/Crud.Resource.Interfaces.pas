unit Crud.Resource.Interfaces;

interface

uses
  Data.DB;

type
  iConexao = interface
    ['{2DECE31E-4CEC-4347-A3B9-B9A6844348A8}']
    function Connect : TCustomConnection;
  end;

implementation

end.
