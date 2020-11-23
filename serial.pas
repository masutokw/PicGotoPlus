unit serial;

interface

uses Windows, Sysutils;

function OpenCom(var fh: Thandle; CommPort, baud, parity, data, stop, timeouts,
  inttimeout: String; QUICK: BOOLEAN): BOOLEAN;
function ReadCom(var fh: Thandle; var buf: String; var count: Integer): BOOLEAN;
function WriteCom(var fh: Thandle; var buf: String; var count: Integer)
  : BOOLEAN;
procedure CloseCom(var fh: Thandle);

procedure PurgeBuffer(var fh: Thandle);

var
  debug: BOOLEAN = FALSE;

implementation

var
  Com_opened: BOOLEAN = FALSE;
  Tot_timout, Int_timout: Integer;

function OpenCom(var fh: Thandle; CommPort, baud, parity, data, stop, timeouts,
  inttimeout: String; QUICK: BOOLEAN): BOOLEAN;
var
  Timeout: TCOMMTIMEOUTS;
  // Buffer : PCommConfig;
  // size : DWORD;
  DCB: TDCB;
  Config: String;
const
  RxBufferSize = 4096;
  TxBufferSize = 4096;
begin

  result := FALSE;
  Tot_timout := strtointdef(timeouts, 1000);
  Int_timout := strtointdef(inttimeout, 10);
  if Com_opened then
    CloseCom(fh);
  fh := CreateFile(Pchar(CommPort), GENERIC_WRITE + GENERIC_READ, 0, NIL,
    OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if fh = INVALID_HANDLE_VALUE then
    exit;
  Com_opened := TRUE;
  { Set port config }
  if NOT SetupComm(fh, RxBufferSize, TxBufferSize) then
    exit;
  if not QUICK then
    if NOT GetCommState(fh, DCB) then
      exit;
  Config := 'baud=' + baud + ' parity=' + parity + ' data=' + data +
    'stop=' + stop;
  if NOT BuildCommDCB(Pchar(Config), DCB) then
    exit;
  if NOT SetCommState(fh, DCB) then
    exit;
  Timeout.ReadIntervalTimeout := Int_timout; // end of data timeout
  Timeout.ReadTotalTimeoutMultiplier := 0;
  Timeout.ReadTotalTimeoutConstant := Tot_timout;
  Timeout.WriteTotalTimeoutMultiplier := 0;
  Timeout.WriteTotalTimeoutConstant := Tot_timout;
  SetCommTimeouts(fh, Timeout);

  result := TRUE;
end;

procedure PurgeBuffer(var fh: Thandle);
var
  count: Integer;
  buf: String;
  Timeout: TCOMMTIMEOUTS;
begin
  Timeout.ReadIntervalTimeout := 10;
  Timeout.ReadTotalTimeoutMultiplier := 0;
  Timeout.ReadTotalTimeoutConstant := 10;
  Timeout.WriteTotalTimeoutMultiplier := 0;
  Timeout.WriteTotalTimeoutConstant := Tot_timout;
  SetCommTimeouts(fh, Timeout);
  try
    repeat
      count := 50;
      ReadCom(fh, buf, count);
    until count = 0;
  finally
    Timeout.ReadIntervalTimeout := Int_timout;
    Timeout.ReadTotalTimeoutMultiplier := 0;
    Timeout.ReadTotalTimeoutConstant := Tot_timout;
    Timeout.WriteTotalTimeoutMultiplier := 0;
    Timeout.WriteTotalTimeoutConstant := Tot_timout;
    SetCommTimeouts(fh, Timeout);
    // EscapeCommFunction(fh,SETDTR);
    // EscapeCommFunction(fh,CLEARDTR);

  end;
end;

function ReadCom(var fh: Thandle; var buf: String; var count: Integer): BOOLEAN;
var
  NumberRead: Cardinal;
begin
  // buf := StringOfChar(' ', count);
  NumberRead := 0;
  result := ReadFile(fh, Pchar(buf)^, count, NumberRead, NIL);
  count := NumberRead;
  setlength(buf, count);
end;

function WriteCom(var fh: Thandle; var buf: String; var count: Integer)
  : BOOLEAN;
var
  NumberWritten: Cardinal;
begin
  NumberWritten := 0;
  result := WriteFile(fh, Pchar(buf)^, count, NumberWritten, NIL);
  count := NumberWritten;
end;

procedure CloseCom(var fh: Thandle);
begin
  CloseHandle(fh);
end;

end.
