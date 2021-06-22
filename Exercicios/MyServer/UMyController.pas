unit UMyController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons;

type

  [MVCPath('/api')]
  TMyController = class(TMVCController) 
  public
    [MVCPath]
    [MVCHTTPMethod([httpGET])]
    procedure Index;

    [MVCPath('/reversedstrings/($Value)')]
    [MVCHTTPMethod([httpGET])]
    procedure GetReversedString(const Value: String);
  protected
    procedure OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean); override;
    procedure OnAfterAction(Context: TWebContext; const AActionName: string); override;

  public
    //Sample CRUD Actions for a "Customer" entity
    [MVCPath('/produtos')]
    [MVCHTTPMethod([httpGET])]
    procedure GetProdutos;

    // Para cada chamada eu tenho uma procedure o caminho e o verbo correspondente
    [MVCPath('/produtos/($id)')]
    [MVCHTTPMethod([httpGET])]
    procedure GetProduto(id: Integer);

    [MVCPath('/produtos')]
    [MVCHTTPMethod([httpPOST])]
    procedure CreateProduto;

    [MVCPath('/produtos/($id)')]
    [MVCHTTPMethod([httpPUT])]
    procedure UpdateProduto(id: Integer);

    [MVCPath('/produtos/($id)')]
    [MVCHTTPMethod([httpDELETE])]
    procedure DeleteProduto(id: Integer);

  end;

implementation

uses
  System.SysUtils, MVCFramework.Logger, System.StrUtils;

procedure TMyController.Index;
begin
  // use Context property to access to the HTTP request and response
  Render('Hello DelphiMVCFramework World');
end;

procedure TMyController.GetReversedString(const Value: String);
begin
  Render(System.StrUtils.ReverseString(Value.Trim));
end;

procedure TMyController.OnAfterAction(Context: TWebContext; const AActionName: string); 
begin
  { Executed after each action }
  inherited;
end;

procedure TMyController.OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean);
begin
  { Executed before each action
    if handled is true (or an exception is raised) the actual
    action will not be called }
  inherited;
end;

// Sample CRUD Actions for a "Produtos" entity
procedure TMyController.GetProdutos;
begin

end;

procedure TMyController.GetProduto(id: Integer);
begin

end;

procedure TMyController.CreateProduto;
begin

end;

procedure TMyController.UpdateProduto(id: Integer);
begin

end;

procedure TMyController.DeleteProduto(id: Integer);
begin

end;

end.
