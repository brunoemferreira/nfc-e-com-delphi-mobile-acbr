unit ProdutosClass;

interface

type
  TProduto = class
  private
    Fid: integer;
    FGtin: string;

  public
    property Id: integer read Fid write FId;
    property Gtin: string read FGtin write FGtin;


  end;

implementation

end.
