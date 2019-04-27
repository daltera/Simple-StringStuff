program WordUnscrabler;

uses sysutils;

type
	texting = file of string;
	udin = array [1..1275] of string;
	
function convert(a:string):integer;

var i:integer;
    sum:integer;
    
begin

  sum :=0;

  for i:=1 to length(a) do
   begin
    sum:=sum+ord(a[i]);
   end;

convert:=sum;

end;

function matchstr2(a,b:string):boolean;

begin
   matchstr2:=false;
   if (convert(a) = convert(b)) then
   begin
      matchstr2 :=true;
   end;
end;
	

procedure delElmt(pos:integer; var neff:integer; var arrin:string);
var i:integer;

begin
		for i:=pos to neff do
		begin
			arrin[i]:=arrin[i+1];
		end;
		neff:=neff-1;
end;

function matchstr(a,c:string):boolean;

  var i,j,e,d:integer;
	b,g:boolean;
begin
	b:=true;
	g:=false;
	e:=length(a);
	d:=length(c);
	j:=1;
	for i:=1 to e do
	begin
		while ((j <= d) and (not(g))) do
		begin
			if (a[i] = c[j]) then
			begin
				delElmt(j,d,c);
				g:=true;
			end
			else
			begin
				j:=j+1;
			end;
		end;
		g:=false;
		j:=1;
	end;
	
	if (d <> 0) then
	begin
		b:=false;
	end;
	matchstr:=b;
end;
  


var
	i,j:integer;
	c : udin;
	d,a :string;
	e: array [1..10] of string;
	q: array [1..10] of string;
	fin,fin2,fin3: text;
	g:boolean;
	
begin
	i:=1;
	j:=1;
	g:=false;
	assign(fin,'wordlist.txt');
	assign(fin2,'wordlist2.txt');
	assign(fin3,'wordlist3.txt');
	reset(fin);
	reset(fin2);
	rewrite(fin3);
	while not eof(fin) do
	
		begin
			for i:=1 to 1275 do
			begin
				readln(fin,d);
				c[i] := d;
			end;
		end;
		
	while not eof(fin2) do
	
		begin
			for i:=1 to 10 do
			begin
				readln(fin2,a);
				e[i] := a;
			end;
		end;
		
	for i:=1 to 10 do
	begin
		for j:=1 to 1275 do
		begin
			if ((matchstr(e[i],c[j])) and (matchstr2(e[i],c[j]))) then
			begin
				writeln(fin3,c[j]);
			end;
		end;
		writeln(fin3,',');
	end;
	
	
	
	close(fin);
	close(fin2);
	close(fin3);
		
end.