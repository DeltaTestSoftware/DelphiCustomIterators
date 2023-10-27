program DelphiCustomIterators;

{$APPTYPE CONSOLE}

type
  TEnumFibonacci = record
  private
    FFibArray: array of Integer;
    FIndex: Integer;
  public
    constructor Create(UpperBound: Integer);
    function GetCurrent: Integer;
    function MoveNext: Boolean;
    property Current: Integer read GetCurrent;
  end;

constructor TEnumFibonacci.Create(UpperBound: Integer);
var
  i: Integer;
begin
  SetLength(FFibArray, UpperBound);
  if UpperBound >= 1 then
    FFibArray[0] := 1;
  if UpperBound >= 2 then
    FFibArray[1] := 1;
  for i := 2 to UpperBound - 1 do
    FFibArray[i] := FFibArray[i - 1] + FFibArray[i - 2];
  FIndex := -1;
end;

function TEnumFibonacci.GetCurrent: Integer;
begin
  Result := FFibArray[FIndex];
end;

function TEnumFibonacci.MoveNext: Boolean;
begin
  Result := FIndex < High(FFibArray);
  if Result then
    Inc(FIndex);
end;

type
  TEnumFibonacciFactory = record
  private
    FUpperBound: Integer;
  public
    constructor Create(UpperBound: Integer);
    function GetEnumerator: TEnumFibonacci;
  end;

constructor TEnumFibonacciFactory.Create(UpperBound: Integer);
begin
  FUpperBound := UpperBound;
end;

function TEnumFibonacciFactory.GetEnumerator: TEnumFibonacci;
begin
  Result := TEnumFibonacci.Create(FUpperBound);
end;

function Fibonacci(UpperBound: Integer): TEnumFibonacciFactory;
begin
  Result := TEnumFibonacciFactory.Create(UpperBound);
end;

begin
  ReportMemoryLeaksOnShutdown := true;
  for var N in Fibonacci(30) do
    Writeln(N);

end.
