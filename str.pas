program prog12;

uses sysutils;

var
	a,b:text;
	c,e,f:AnsiString;
	d,i:longint;
	
function IsntInteger(a:char):boolean;

begin
	if ((Ord(a) < 48) or (Ord(a) > 57)) then
	begin
		IsntInteger:=true;
	end
	else
	begin
		IsntInteger:=false;
	end;
end;

function CekStr(a:AnsiString):AnsiString;

var i,j:integer;
	d:AnsiString;

begin
	d:=a;
	j:=1;
	for i:=1 to (length(a)) do
	begin
		if (IsntInteger(a[i])) then
		begin
			d[j]:=a[i];
			j:=j+1;
		end;
	end;
	CekStr:=d;
end;

function shiftstr(a:AnsiString):AnsiString;

var i:longint;
	b:longint;

begin
	for i:=1 to (length(a)) do
	begin
		b:=ord(a[i])+1;
		a[i]:=chr(b);
	end;
	shiftstr:=a;
end;
	
function IsPrime(a:integer):boolean;

var
	i:integer;
	b:boolean;
begin
	b:=true;
	i:=2;
	while ((b) and (i < a)) do
	begin
		if (a mod i = 0) then
		begin
			b:=false;
		end
		else
		begin
			i:=i+1;
		end;
	end;
	IsPrime:=b;
end;
	
	
function countPC(a:AnsiString):longint;

var
	i,sumcomp,sumprim:integer;
begin
	sumcomp:=0;
	sumprim:=0;
		for i:=1 to (length(a)) do
		begin
		if (not(IsntInteger(a[i]))) then
		begin
			if (((StrToInt(a[i])) >= 2) and ((StrToInt(a[i])) <= 9)) then
			begin
				if (IsPrime(StrToInt(a[i]))) then
				begin
					sumprim:=sumprim+StrToInt(a[i]);
				end
				else
				begin
					sumcomp:=sumcomp+StrToInt(a[i]);
				end;
			end;
		end;
		end;
	
		countPC:=sumcomp*sumprim;
end;
	
begin
	assign(a,'string.txt');
	assign(b,'string2.txt');
	reset(a);
	rewrite(b);
	while not eof(a) do
	
		begin
			read(a,c);
		end;
	e:=CekStr(c);
	
	f:=shiftstr(e);
	

	{for i:=1 to 25 do
	begin
		write(e[i]);
	end;}	

	for i:=1 to 25 do
	begin
		write(b,f[i]);
	end;			
	d:=countPC(c);	
	writeln(b,d);
	
	
	close(a);
	close(b);
end.