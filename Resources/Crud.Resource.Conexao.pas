unit Crud.Resource.Conexao;

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
  FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  FireDAC.Phys.MySQL,
  Data.DB,
  FireDAC.Comp.Client,
  Crud.Resource.Interfaces;

type
  TConexao = class(TInterfacedObject, iConexao)
    private
      FConn : TFDConnection;
    public
      constructor Create;
      destructor  Destroy; override;
      class function New:  iConexao;
      function Connect : TCustomConnection;
  end;

implementation

{ TConexao }

function TConexao.Connect: TCustomConnection;
begin
  Result  :=  FConn;
end;

constructor TConexao.Create;
begin
  FConn :=  TFDConnection.Create(nil);
  FConn.Params.Add('DriverID=MySQL');
  FConn.Params.Add('Database=db_crud');
  FConn.Params.Add('User_Name=root');
  FConn.Params.Add('Password=toor');
  FConn.Params.Add('Server=localhost');
  FConn.Params.Add('Port=3306');
  FConn.Params.Add('CharacterSet=utf8');
  FConn.Params.Add('Compress=True');
  FConn.Params.Add('UseSSL=True');
  FConn.Connected := True;
end;

destructor TConexao.Destroy;
begin
  FConn.DisposeOf;
  inherited;
end;

class function TConexao.New: iConexao;
begin
  Result  :=  Self.Create;
end;

end.
