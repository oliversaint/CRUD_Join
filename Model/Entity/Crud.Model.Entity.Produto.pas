unit Crud.Model.Entity.Produto;

interface

uses
  SimpleAttributes;

type
  [Tabela('tb_produto')]
  TProduto = class
    private
      Fid_produto: integer;
      Fid_categoria_produto: integer;
      Fdata_cadastro: TDateTime;
      Fnome_produto: string;
      Fvalor_produto: double;
      procedure Setdata_cadastro(const Value: TDateTime);
      procedure Setid_categoria_produto(const Value: integer);
      procedure Setid_produto(const Value: integer);
      procedure Setnome_produto(const Value: string);
      procedure Setvalor_produto(const Value: double);
    public
      [Campo('id_produto'), PK, AutoInc]
      property id_produto : integer read Fid_produto write Setid_produto;
      [Campo('id_categoria_produto'), FK]
      property id_categoria_produto : integer read Fid_categoria_produto write Setid_categoria_produto;
      [Campo('data_cadastro')]
      property data_cadastro : TDateTime read Fdata_cadastro write Setdata_cadastro;
      [Campo('nome_produto')]
      property nome_produto : string read Fnome_produto write Setnome_produto;
      [Campo('valor_produto')]
      property valor_produto : double read Fvalor_produto write Setvalor_produto;

  end;

implementation

{ TProduto }

procedure TProduto.Setdata_cadastro(const Value: TDateTime);
begin
  Fdata_cadastro := Value;
end;

procedure TProduto.Setid_categoria_produto(const Value: integer);
begin
  Fid_categoria_produto := Value;
end;

procedure TProduto.Setid_produto(const Value: integer);
begin
  Fid_produto := Value;
end;

procedure TProduto.Setnome_produto(const Value: string);
begin
  Fnome_produto := Value;
end;

procedure TProduto.Setvalor_produto(const Value: double);
begin
  Fvalor_produto := Value;
end;

end.
