unit uCustomHint;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Types,

  Vcl.Controls,
  Vcl.Forms;

type
 TMyHintWindow = class(THintWindow)
  private
    FPainting: Boolean;
  protected
    function  GetClientRect: TRect; override;
    procedure Paint; override;
  public
    function  CalcHintRect(MaxWidth: Integer; const AHint: string; AData: TCustomData): TRect; override;
  end;

implementation

function TMyHintWindow.CalcHintRect(MaxWidth: Integer; const AHint: string; AData: TCustomData): TRect;
begin
  Result := inherited;
  Result.Width := Result.Width + 2*ScaleValue(10);
  Result.Height := Result.Height + 2*ScaleValue(10);
end;

function TMyHintWindow.GetClientRect: TRect;
begin
  Result := inherited;
  if FPainting then
    Result.Inflate(-ScaleValue(10), -ScaleValue(10));
end;

procedure TMyHintWindow.Paint;
begin
  FPainting := True;
  try
    inherited;
  finally
    FPainting := False;
  end;
end;

initialization
  HintWindowClass := TMyHintWindow;
end.
