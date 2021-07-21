unit unit_central_consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,  ACBrBase, ACBrEnterTab,
  classe_empresa, classe_aluno, classe_funcionario, FireDAC.Comp.Client,
  unit_alunos, unit_empresas, unit_funcionarios, classe_usuario;

type
  Tform_central_consulta = class(TForm)
    pnl_dbgrid: TPanel;
    pnl_Rodape: TPanel;
    lbl_excluir: TLabel;
    lbl_duplo_clique: TLabel;
    pnl_fundo: TPanel;
    dbg_registros: TDBGrid;
    dsPadrao: TDataSource;
    ACBrEnterTab: TACBrEnterTab;
    pnl_topo: TPanel;
    pnl_botao_cancelar: TPanel;
    btn_cancelar: TSpeedButton;
    lbl_titulo: TLabel;
    pnl_barra: TPanel;
    pnl_busca: TPanel;
    btn_busca: TSpeedButton;
    edt_busca: TEdit;
    pnl_botao: TPanel;
    procedure dbg_registrosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbg_registrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dbg_registrosDblClick(Sender: TObject);
    procedure dbg_registrosTitleClick(Column: TColumn);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_buscaClick(Sender: TObject);
    procedure edt_buscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure AddColunaGrid(NomeCampo, TituloCampo: String; Tamanho: Double);
    { Private declarations }
  public
    var_modulo,
    var_texto_busca: String;{ Public declarations }
  end;

var
  form_central_consulta: Tform_central_consulta;



implementation

{$R *.dfm}

uses unit_funcoes, unit_dados, unit_principal, unit_usuarios;

procedure Tform_central_consulta.AddColunaGrid( NomeCampo, TituloCampo :String; Tamanho :Double );
begin
  //METODO PARA CRIACAO DE COLUNAS NO DBGRID
  with dbg_registros.Columns.Add do
  begin
    FieldName     := NomeCampo;
    Title.Caption := TituloCampo;
    Visible       := True;
    Width         := Round(  pnl_dbgrid.Width * Tamanho - 5);
  end;
end;

procedure Tform_central_consulta.btn_buscaClick(Sender: TObject);
begin
  //ARMAZENANDO O QUE O USUARIO QUER ENCONTRAR
  var_texto_busca := edt_busca.Text;

  //CHAMA O METODO DE CONSULTA DE ACORDO COM O MODULO QUE ESTA ABERTO
  if var_modulo = 'ALUNOS' then
    dsPadrao.DataSet := Aluno.fnc_consulta( var_texto_busca )
  else if var_modulo = 'FUNCIONÁRIOS' then
    dsPadrao.DataSet := Funcionario.fnc_consulta( var_texto_busca )
  else if var_modulo = 'EMPRESAS' then
    dsPadrao.DataSet := Empresa.fnc_consulta( var_texto_busca )
  else if var_modulo = 'USUÁRIOS' then
    dsPadrao.DataSet := Usuario.fnc_consulta( var_texto_busca );


  //OBRIGA SEMPRE O DBGRID MOSTRAR A BARRA DE ROLAGEM VERTICAL/LATERAL
  ShowScrollBar( dbg_registros.Handle, SB_Vert, True );

  //AUMENTA AS LINHAS DO DBGRID
  prcAjustaTamanhoLinha( dbg_registros );

  //ORDENAÇÃO INICIAL SEMPRE NA PRIMEIRA COLUNA
  prc_ordena( ( dsPadrao.DataSet As TFDQuery ), dbg_registros.Columns[0] );

end;

procedure Tform_central_consulta.btn_cancelarClick(Sender: TObject);
begin
  //LIMPAR O CAMPO DE PESQUISA
  edt_busca.Clear;

  //ATRIBUI VAZIO PARA O DATASET, POIS QUANDO ABRIR NOVAMENTE
  //ATRIBUIRA UM NOVO DATASET
  dsPadrao.DataSet := nil;

  //FECHA O FORMULARIO DE CONSULTA
  form_central_consulta.Close;
end;

procedure Tform_central_consulta.dbg_registrosDblClick(Sender: TObject);
begin
  //SE ESTIVER VAZIO E O USUARIO DER DUPLO CLIQUE APENAS SAI
  //DESSE PROCEDIMENTO SEM FAZER NADA

  if dbg_registros.DataSource.DataSet.IsEmpty then
    exit;

  //CARREGA OS CAMPOS SELECIONADOS PARA O FORMULARIO DE ACORDO COM
  //O MODULO QUE ESTA ABERTO
  if var_modulo = 'EMPRESAS' then
    form_empresas.prc_carrega_campos
  else
  if var_modulo = 'FUNCIONÁRIOS' then
    form_funcionarios.prc_carrega_campos
  else
  if var_modulo = 'ALUNOS' then
    form_alunos.prc_carrega_campos
  else
  if var_modulo = 'USUÁRIOS' then
    form_usuarios.prc_carrega_campos;

  //FECHA O FORMULARIO DE CONSULTA
  form_central_consulta.Close;
end;

//NESSE EVENTO EU MUDO A COR DA SELEÇÃO PADRAO DO COMPONENTE DBGRID;
//DEIXO ELE ZEBRADO, UMA LINHA DE UMA COR E A SEGUINTE DE OUTRA;
//MUDO A POSICAO DO TEXTO DENTRO DA CELULA, POIS COMO FOI AUMENTADO O
//TAMANHO DA LINHA PRECISA REPOSICIONAR O TEXTO
procedure Tform_central_consulta.dbg_registrosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  //zebrando o dbgrid
  if Odd( dbg_registros.DataSource.DataSet.RecNo) then
    dbg_registros.Canvas.Brush.Color :=  $00FBFBFB
  else
    dbg_registros.Canvas.Brush.Color := clwhite;//$00F9F9F9;

 //mudando a cor da seleção
  if ( gdSelected in State ) then
  begin
    dbg_registros.Canvas.Brush.Color := $00FFE8CC;
    dbg_registros.Canvas.Font.Color  := clBlack;
    dbg_registros.Canvas.Font.Style  := [fsBold];
  end;

  dbg_registros.Canvas.FillRect(Rect);
  dbg_registros.DefaultDrawColumnCell( Rect, DataCol, Column, State);

  //mudando a posicao e alinhamento vertical do texto de cada linha
  dbg_registros.Canvas.TextRect( Rect, Rect.Left + 8, Rect.Top + 8, Column.Field.DisplayText );
end;


procedure Tform_central_consulta.dbg_registrosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if ( Key = VK_DELETE ) then  //TESTA SE A TECLA PRESSIONADA É O DELETE
  begin
    //se estiver aberto o dbgrid
    if not ( dbg_registros.DataSource.DataSet.IsEmpty ) then
    begin

      //EXECUTO A FUNCAO DE DELETAR O REGISTRO SELECIONADO DE ACORDO COM O MODULO
      if var_modulo = 'EMPRESAS' then
      begin

        if dsPadrao.DataSet.FieldByName('ID_EMPRESA').AsInteger <> var_gbl_empresa then
        begin
          IF fnc_cria_janela_mensagem('Deletar Empresa','TODOS OS DADOS DESSA EMPRESA SERAO APAGADOS. DESEJA CONTINUAR?',
                             ExtractFilePath( Application.ExeName)+'\Icones\mensagem\aviso.png', 'CONFIRMA' ) then
            Empresa.prc_deleta ( dsPadrao.DataSet.FieldByName('ID_EMPRESA').AsInteger );

        end else
          fnc_cria_janela_mensagem('Deletar Empresa','Esta empresa NÃO pode ser apagada pois esta Selecionada!',
                             ExtractFilePath( Application.ExeName)+'\Icones\mensagem\aviso.png', 'AVISO' );


      end else
      if var_modulo = 'FUNCIONÁRIOS' then
        Funcionario.prc_deleta ( dsPadrao.DataSet.FieldByName('ID_FUNCIONARIOS').AsInteger )
      else
      if var_modulo = 'ALUNOS' then
        Aluno.prc_deleta ( dsPadrao.DataSet.FieldByName('ID_ALUNOS').AsInteger )
      else
      if var_modulo = 'USUÁRIOS' then
        Usuario.prc_deleta ( dsPadrao.DataSet.FieldByName('ID_USUARIO').AsInteger );

    end;

    //EXECUTO O CLIQUE DO BOTAO DE CONSULTA PARA ATUALIZAR O DBGRID APOS DELETAR O REGISTRO
    btn_buscaClick(Self);
  end;

end;

procedure Tform_central_consulta.dbg_registrosTitleClick(Column: TColumn);
var
  I: Integer;

begin

  //AO CLICAR NO TITULO DA COLUNA, ELE ORDENA E MUDA A FONT DO TITULO PARA
  //INDICAR QUE A ORDENAÇÃO SE FAZ POR AQUELE TITULO

  if dbg_registros.DataSource.DataSet.Active then
  begin


    for I := 0 to dbg_registros.Columns.Count - 1  do
    begin
      //pintando o titulo da coluna clicada do dbgrid
      if dbg_registros.Columns[i].FieldName = Column.FieldName then
      begin
        dbg_registros.Columns[i].Title.Font.Color := clRed;
        dbg_registros.Columns[i].Title.Font.Style := [fsBold];

      end else //voltando todas as outras colunas para o padrao
      begin
        dbg_registros.Columns[i].Title.Font.Color := $00626262;
        dbg_registros.Columns[i].Title.Font.Style := [];
      end;
    end;

    //passa a coluna clicada para a funcao de ordenação
    prc_ordena( ( dsPadrao.DataSet As TFDQuery ), Column );

    //ajusta o tamanho da linha novamente
    prcAjustaTamanhoLinha( dbg_registros );
  end;
end;

procedure Tform_central_consulta.edt_buscaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  //SE A TECLA PRESSIONADA FOR ENTER ENTAO EXECUTA O PROCEDIMENTO DO CLIQUE DO BOTAO
  if key = VK_RETURN then
    btn_buscaClick( Self );
end;

procedure Tform_central_consulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //ZERA A VARIAVEL QUE INDICA O MODULO QUE ESTA ABERTO
  form_central_consulta.var_modulo :='';

  //LIMPA AS COLUNAS DO DBGRID POIS ELAS SAO GERADAS AO ABRIR O FORM
  dbg_registros.Columns.Clear;
end;

procedure Tform_central_consulta.FormShow(Sender: TObject);
begin

  //LIMPA O CONTEUDO DO EDIT DE BUSCA
  edt_busca.Clear;

  //CRIA AS COLUNAS RESPECTIVAS DE ACORDO COM O MODULO ABERTO
  if var_modulo = 'ALUNOS' then
  begin
    //O DATASET RECEBE A CONSULTA GERAL DA TABELA MPSTRANDO TODOS CADASTRADOS
    dsPadrao.DataSet := Aluno.fnc_consulta( var_texto_busca );

    AddColunaGrid( 'nr_matricula', 'Matricula',  0.05 );
    AddColunaGrid( 'ds_nome', 'Nome',  0.18 );
    AddColunaGrid( 'ds_apelido', 'Apelido', 0.12 );
    AddColunaGrid( 'ds_endereco', 'Endereço',  0.17 );
    AddColunaGrid( 'nr_numero', 'Nº',  0.05 );
    AddColunaGrid( 'ds_bairro', 'Bairro', 0.14 );
    AddColunaGrid( 'ds_municipio', 'Cidade',  0.14 );
    AddColunaGrid( 'ds_estado', 'UF', 0.05 );
    AddColunaGrid( 'nr_fone1', 'Telefone', 0.10 );
  end else
  if var_modulo = 'FUNCIONÁRIOS' then
  begin

    //O DATASET RECEBE A CONSULTA GERAL DA TABELA MPSTRANDO TODOS CADASTRADOS
    dsPadrao.DataSet := Funcionario.fnc_consulta( var_texto_busca );

    AddColunaGrid( 'ds_nome', 'Nome',  0.19 );
    AddColunaGrid( 'ds_cargo', 'Cargo', 0.13 );
    AddColunaGrid( 'ds_endereco', 'Endereço',  0.18 );
    AddColunaGrid( 'nr_numero', 'Nº',  0.05 );
    AddColunaGrid( 'ds_bairro', 'Bairro', 0.15 );
    AddColunaGrid( 'ds_municipio', 'Cidade',  0.15 );
    AddColunaGrid( 'ds_estado', 'UF', 0.05 );
    AddColunaGrid( 'nr_fone1', 'Telefone', 0.10 );
  end else
  if var_modulo = 'EMPRESAS' then
  begin

    //O DATASET RECEBE A CONSULTA GERAL DA TABELA MPSTRANDO TODOS CADASTRADOS
    dsPadrao.DataSet := Empresa.fnc_consulta( var_texto_busca );

    AddColunaGrid( 'NR_CNPJ', 'Tipo de Pessoa', 0.13 );
    AddColunaGrid( 'ds_fantasia', 'Nome',  0.19 );
    AddColunaGrid( 'ds_endereco', 'Endereço',  0.18 );
    AddColunaGrid( 'nr_numero', 'Nº',  0.05 );
    AddColunaGrid( 'ds_bairro', 'Bairro', 0.15 );
    AddColunaGrid( 'ds_municipio', 'Cidade',  0.15 );
    AddColunaGrid( 'ds_estado', 'UF', 0.05 );
    AddColunaGrid( 'nr_fone1', 'Telefone', 0.10 );

  end ELSE
  if var_modulo = 'USUÁRIOS' then
  begin
    
    //O DATASET RECEBE A CONSULTA GERAL DA TABELA MPSTRANDO TODOS CADASTRADOS
    dsPadrao.DataSet := Usuario.fnc_consulta( var_texto_busca );

    AddColunaGrid( 'id_usuario', 'Código', 0.15 );
    AddColunaGrid( 'ds_nome', 'Nome',  0.3 );
    AddColunaGrid( 'ds_login', 'Login',  0.20 );
  end;

  //passa a PRIMEIRA coluna para a funcao de ordenação
  prc_ordena( ( dsPadrao.DataSet As TFDQuery ), dbg_registros.Columns[0] );

  //OBRIGA SEMPRE O DBGRID MOSTRAR A BARRA DE ROLAGEM VERTICAL/LATERAL
  ShowScrollBar( dbg_registros.Handle, SB_Vert, True );

  //AUMENTA AS LINHAS DO DBGRID
  prcAjustaTamanhoLinha( dbg_registros );
end;

end.
