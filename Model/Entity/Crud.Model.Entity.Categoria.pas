unit Crud.Model.Entity.Categoria;

interface

uses
  SimpleAttributes;

type
  [Tabela('TB_CATEGORIA_PRODUTO')]
  TCategoria =  class
    private
    Fid_categoria_planejamento: integer;
    Fnome_categoria: string;
    procedure Setid_categoria_planejamento(const Value: integer);
    procedure Setnome_categoria(const Value: string);
    public
      [Campo('ID_CATEGORIA_PLANEJAMENTO'), PK, AutoInc]
      property id_categoria_planejamento : integer read Fid_categoria_planejamento write Setid_categoria_planejamento;
      [Campo('NOME_CATEGORIA')]
      property nome_categoria : string read Fnome_categoria write Setnome_categoria;
  end;

implementation

{ TCategoria }

procedure TCategoria.Setid_categoria_planejamento(const Value: integer);
begin
  Fid_categoria_planejamento := Value;
end;

procedure TCategoria.Setnome_categoria(const Value: string);
begin
  Fnome_categoria := Value;
end;

end.
