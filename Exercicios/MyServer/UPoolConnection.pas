{
  Arquivo de Configuração do Pool de Conexão

}
unit UPoolConnection;

interface

uses
  System.Classes,
  FireDAC.Stan.Intf, FireDAC.Stan.option, FireDAC.Stan.Error,

  Data.DB;

  procedure CreatePoolConnection;

const
  // Definindo um nome para a conexão
  NOME_CONEXAO_FB = 'CONEXAO_SERVIDOR_DMC';

implementation

procedure CreatePoolConnection;
var
  oParametros : TStringList;
begin
  FDManager.Close;

  oParametros := TStringList.Create;
  try
    oParametros.Clear;
    oParametros.Add('DriverID=FB');
    oParametros.Add('User_Name=sysdba');
    oParametros.Add('Password=masterkey');
    oParametros.Add('Protocol=TCPIP');
    oParametros.Add('CharacterSet=WIN1252');
    oParametros.Add('Server=localhost' );
    oParametros.Add('Port=3050' );
    oParametros.Add('Database=C:\caminho do arquivo do banco de dados');

    oParametros.Add('POOL_MaximunItems=50' );
    oParametros.Add('POOL_ExpireTimeout=9000' );
    oParametros.Add('POOL_CleanupTimeout=900000' );


    FDManager.AddConnectionDef(NOME_CONEXAO_FB, 'FB', oParametros);
    FDManager.Open;
  finally
    oParametros.Free;
  end;


end;


end.
