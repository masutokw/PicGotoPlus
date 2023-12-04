unit picplus;

interface

uses Windows, Sysutils,serial;

const
  M1_SPEED_SET_CMD = 0;
  COUNTERS_GET_CMD = 1;
  M2_SPEED_SET_CMD = 27;
  M2_SET_CMD_TARGET = 3;
  M1_SET_CMD_TARGET = 4;
  COUNTERS_SAVE_CMD = 5;
  M2_SET_BACKSLASH_CMD = 6;
  M1_SET_BACKSLASH_CMD = 7;
  M1_CHANGE_PMW_CMD = 8;
  SPEED_TABLE_CHANGE_CMD = 9;
  SPEED_TABLE_SAVE_CMD = 10;
  M1_BACKSLASH_MODE = 12;
  M2_BACKSLASH_MODE = 13;
  LED_HALF_CMD = 11;
  M1_MAX_COUNT_SAVE_CMD = 14;
  M2_MAX_COUNT_SAVE_CMD = 15;
  M1_COUNTER_SET_CMD = 16;
  M2_COUNTER_SET_CMD = 17;
  M1_STARTUP_UNSET_CMD = 18;
  M1_STARTUP_SET_CMD = 19;
  BAUDRATE_SET = 20;
  PRESCALER_SET = 21;
  PWM_FREQ_SET = 24;
  PWM_CAL_SET = 25;
  M1_GET_SPEED_CMD = 26;
  CMD_FCODE = 239;
  M1_SLEW_CMD_SET = 28;
  GET_TICKS = 29;
{$DEFINE IDD}
{$IFDEF IDD}
  CMD_SIZE = 4;
{$ELSE}
  CMD_SIZE = 3;
{$ENDIF}
  CMD_BYTE_SIZE = CMD_SIZE + 1;
  CMD_2BYTE_SIZE = CMD_SIZE + 2;
  CMD_SMBYTE_SIZE = CMD_SIZE + 3;
  CMD_LONG_SIZE = CMD_SIZE + 4;

type

  Tpicmesage = record
    code, id: byte;
{$IFDEF IDD}
    idd: byte;
{$ENDIF}
    command: byte;
    buff: array [0 .. 4] of byte end;

  type
    TPicRxRegister = record
      motorcount, auxcount: longint;
      check: byte;
    end;

  type
    TPicRxRegisterTime = record
      motorcount, auxcount, pictime: longint;
      check: byte;
    end;

  type
    TPicRXTick = record
      timetick: cardinal;
      check: byte;
    end;

  type
    TPicRXSpeed = record
      base: Word;
      mult, sig: shortint;
      check: byte;
    end;

  var
    fh: thandle;
    { procedure sendcmd( fh:THandle;code,id,cmd:byte);overload
      procedure sendcmdbyte( fh:THandle;code,id,cmd:byte;value:byte);overload
      procedure sendcmd2byte( fh:THandle;code,id,cmd:byte;value,value1:byte);overload
      procedure sendcmdsmint( fh:THandle;code,id,cmd:byte;base:smallint);overload
      procedure sendcmdsmintbyte( fh:THandle;code,id,cmd:byte;base:smallint;index:byte);overload }

    function ReadCounters(id: byte): boolean;
    function ReadSpeed(id: byte): boolean;
    function Readtime(id: byte): boolean;
    function GetTime(var ticks: cardinal; var control: byte): boolean;
    function GetCounters(var x, y: longint; var control: byte): boolean;
    function GetCountersTime(var x, y, t: longint; var control: byte): boolean;
    function GetSpeed(var speed: Word; var mult, sig: shortint;
      var control: byte): boolean;
    function MotorSetPeriod(id: byte; base: Word; post: shortint): boolean;
    function AuxSetPeriod(id: byte; speed: smallint): boolean;
    function SaveCounters(id: byte): boolean;
    function SetMotorCounter(id: byte; pos: longint): boolean;
    function SetAuxCounter(id: byte; pos: longint): boolean;
    function SetMotorTarget(id: byte; pos: longint): boolean;
    function ChangeSpeedTable(id: byte; base: smallint; index: byte): boolean;
    function SetMotorMaxCounter(id: byte; pos: longint): boolean;
    function SaveConf(id: byte): boolean;
    function UnSetStartUp(id: byte): boolean;
    function SetStartUp(id: byte): boolean;
    function changePWM(id: byte; index, value: byte): boolean;
    function SetPrescaler(id, value: byte): boolean;
    function SetBaudRate(id, value: byte): boolean;
    function SetAuxBackslash(id: byte; back: smallint): boolean;
    function SetAuxTarget(id: byte; pos: longint): boolean;
    function SetCalPWM(id, value: byte): boolean;
    function SetPWMFreq(id, value: byte): boolean;
    function SetMotorBackslash(id: byte; back: smallint): boolean;
    function SetMotorBackSlashMode(id, value: byte): boolean;
    function SetAuxBackSlashMode(id, value: byte): boolean;
    function SetLedLevel(id, value: byte): boolean;
    function Set_Motor_Slew_Bit(id, value: byte): boolean;
     Function serial_available ():integer;

implementation

function GetCounters(var x, y: longint; var control: byte): boolean;
var
  n: cardinal;
  readpic: TPicRxRegister;
begin
  readfile(fh, readpic, 9, n, NIL);
  x := readpic.motorcount;
  y := readpic.auxcount;
  control := readpic.check;
  result := (n >= 9);

end;

function GetCountersTime(var x, y, t: longint; var control: byte): boolean;
var
  n: cardinal;
  readpic: TPicRxRegisterTime;
begin
  readfile(fh, readpic, 13, n, NIL);
  x := readpic.motorcount;
  y := readpic.auxcount;
  t := readpic.pictime;
  control := readpic.check;
  result := (n >= 13);

end;

function GetSpeed(var speed: Word; var mult, sig: shortint;
  var control: byte): boolean;
var
  n: cardinal;
  readpicsp: TPicRXSpeed;
begin
  readfile(fh, readpicsp, 5, n, NIL);
  speed := readpicsp.base;
  mult := readpicsp.mult;
  sig := readpicsp.sig;
  control := readpicsp.check;
  result := (n >= 5);

end;

function GetTime(var ticks: cardinal; var control: byte): boolean;
var
  n: cardinal;
  readpictick: TPicRXTick;
begin
  readfile(fh, readpictick, 5, n, NIL);
  ticks := readpictick.timetick;
  control := readpictick.check;
  result := (n >= 5);
end;

function sendcmd(code, id, cmd: byte): boolean;
var
  p: pchar;
  n, l: cardinal;
  reg: Tpicmesage;
begin
  l := CMD_SIZE;
  reg.code := code;
  reg.id := id;
{$IFDEF IDD} reg.idd := id; {$ENDIF}
  reg.command := cmd;

  p := @reg;
  writefile(fh, reg, l, n, nil);
  result := (n = l);
end;

Function sendcmdbyte(code, id, cmd: byte; value: byte): boolean;
var
  n, l: cardinal;
  reg: Tpicmesage;
begin
  l := CMD_BYTE_SIZE;
  reg.code := code;
  reg.id := id;
{$IFDEF IDD} reg.idd := id; {$ENDIF}
  reg.command := cmd;
  reg.buff[0] := value;
  writefile(fh, reg, l, n, nil);
  result := (n = l);
end;

function sendcmd2byte(code, id, cmd: byte; value, value1: byte): boolean;
var
  n, l: cardinal;
  reg: Tpicmesage;
begin
  l := CMD_2BYTE_SIZE;
  reg.code := code;
  reg.id := id;
{$IFDEF IDD} reg.idd := id; {$ENDIF}
  reg.command := cmd;
  reg.buff[0] := value;
  reg.buff[1] := value1;
  writefile(fh, reg, l, n, nil);
  result := (n = l);
end;

function sendcmdsmint(code, id, cmd: byte; base: smallint): boolean;
var
  p: ^smallint;
  n, l: cardinal;
  reg: Tpicmesage;
begin
  l := CMD_2BYTE_SIZE;
  reg.code := code;
  reg.id := id;
{$IFDEF IDD} reg.idd := id; {$ENDIF}
  reg.command := cmd;
  p := (@reg.buff);
  p^ := base;
  writefile(fh, reg, l, n, nil);
  result := (n = l);
end;

function sendcmdsmintbyte(code, id, cmd: byte; base: smallint;
  index: byte): boolean;
var
  p: ^smallint;
  n, l: cardinal;
  reg: Tpicmesage;
begin
  l := CMD_SMBYTE_SIZE;
  reg.code := code;
  reg.id := id;
{$IFDEF IDD} reg.idd := id; {$ENDIF}
  reg.command := cmd;
  p := (@reg.buff);
  p^ := base;
  reg.buff[2] := index;
  writefile(fh, reg, l, n, nil);
  result := (n = l);
end;

function sendcmdlong(code, id, cmd: byte; base: longint): boolean;
var
  p: ^longint;
  n, l: cardinal;
  reg: Tpicmesage;
begin
  l := CMD_LONG_SIZE;
  reg.code := code;
  reg.id := id;
{$IFDEF IDD} reg.idd := id; {$ENDIF}
  reg.command := cmd;
  p := @reg.buff;
  p^ := base;
  writefile(fh, reg, l, n, nil);
  result := (n = l);
end;

function ReadCounters(id: byte): boolean;
begin
  sendcmd(CMD_FCODE, id, COUNTERS_GET_CMD);
end;

function ReadSpeed(id: byte): boolean;
begin
  sendcmd(CMD_FCODE, id, M1_GET_SPEED_CMD);
end;

function MotorSetPeriod(id: byte; base: Word; post: shortint): boolean;
var
  reg: Tpicmesage;
  n: cardinal;
begin

  result := sendcmdsmintbyte(CMD_FCODE, id, M1_SPEED_SET_CMD, base, post);

end;

function AuxSetPeriod(id: byte; speed: smallint): boolean;
begin
  result := sendcmdsmint(CMD_FCODE, id, M2_SPEED_SET_CMD, speed);
end;

function SetMotorTarget(id: byte; pos: longint): boolean;
begin
  result := sendcmdlong(CMD_FCODE, id, M1_SET_CMD_TARGET, pos);
end;

function SetAuxTarget(id: byte; pos: longint): boolean;
begin
  result := sendcmdlong(CMD_FCODE, id, M2_SET_CMD_TARGET, pos);
end;

function SaveCounters(id: byte): boolean;
begin
  result := sendcmd(CMD_FCODE, id, COUNTERS_SAVE_CMD);
end;

function SetAuxBackslash(id: byte; back: smallint): boolean;
begin
  result := sendcmdsmint(CMD_FCODE, id, M2_SET_BACKSLASH_CMD, back);
end;

function SetMotorBackslash(id: byte; back: smallint): boolean;
begin
  result := sendcmdsmint(CMD_FCODE, id, M1_SET_BACKSLASH_CMD, back);
end;

function changePWM(id: byte; index, value: byte): boolean;
begin
  result := sendcmd2byte(CMD_FCODE, id, M1_CHANGE_PMW_CMD, index, value);
end;

function ChangeSpeedTable(id: byte; base: smallint; index: byte): boolean;
begin
  result := sendcmdsmintbyte(CMD_FCODE, id, SPEED_TABLE_CHANGE_CMD,
    base, index);
end;

function SaveConf(id: byte): boolean;
begin
  result := sendcmd(CMD_FCODE, id, SPEED_TABLE_SAVE_CMD);
end;

function SetMotorMaxCounter(id: byte; pos: longint): boolean;
begin
  result := sendcmdlong(CMD_FCODE, id, M1_MAX_COUNT_SAVE_CMD, pos);
end;

function SetAuxMaxCounter(id: byte; pos: longint): boolean;
begin
  result := sendcmdlong(CMD_FCODE, id, M2_MAX_COUNT_SAVE_CMD, pos);
end;

function SetMotorCounter(id: byte; pos: longint): boolean;
begin
  result := sendcmdlong(CMD_FCODE, id, M1_COUNTER_SET_CMD, pos);
end;

function SetAuxCounter(id: byte; pos: longint): boolean;
begin
  result := sendcmdlong(CMD_FCODE, id, M2_COUNTER_SET_CMD, pos);
end;

function SetStartUp(id: byte): boolean;
begin
  result := sendcmd(CMD_FCODE, id, M1_STARTUP_SET_CMD);
end;

function UnSetStartUp(id: byte): boolean;
begin
  result := sendcmd(CMD_FCODE, id, M1_STARTUP_UNSET_CMD);
end;

function SetBaudRate(id, value: byte): boolean;
begin
  result := sendcmdbyte(CMD_FCODE, id, BAUDRATE_SET, value);
end;

function SetPrescaler(id, value: byte): boolean;
begin
  result := sendcmdbyte(CMD_FCODE, id, PRESCALER_SET, value);
end;

function SetPWMFreq(id, value: byte): boolean;
begin
  result := sendcmdbyte(CMD_FCODE, id, PWM_FREQ_SET, value);
end;

function SetCalPWM(id, value: byte): boolean;
begin
  result := sendcmdbyte(CMD_FCODE, id, PWM_CAL_SET, value);
end;

function SetMotorBackSlashMode(id, value: byte): boolean;
begin
  result := sendcmdbyte(CMD_FCODE, id, M1_BACKSLASH_MODE, value);
end;

function SetAuxBackSlashMode(id, value: byte): boolean;
begin
  result := sendcmdbyte(CMD_FCODE, id, M2_BACKSLASH_MODE, value);
end;

function SetLedLevel(id, value: byte): boolean;
begin
  result := sendcmdbyte(CMD_FCODE, id, LED_HALF_CMD, value);
end;

function Set_Motor_Slew_Bit(id, value: byte): boolean;
begin
  result := sendcmdbyte(CMD_FCODE, id, M1_SLEW_CMD_SET, value);
end;

function Readtime(id: byte): boolean;
begin
  sendcmd(CMD_FCODE, id, GET_TICKS);
end;
 Function serial_available ():integer;
 var  InQueue,OutQueue:integer;
 begin
     result:=Bytes_available(fh);
 end;
end.
