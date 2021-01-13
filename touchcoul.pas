program tptouchcoul;

uses crt;


type tableau = array[1..10,1..10] of char;


var plateauJ1 : tableau;
	plateauJ2 : tableau;
	i,j, horiz, verti, pvJ2 : integer;
	posit : string;

procedure Init(var plateau : tableau);

	// lance le plateau
	BEGIN
		for i:= 1 to 10 do
		begin
			for j:=1 to 10 do
				begin
					plateau[i,j]:='O';
				end;
		end;
	END;


procedure Affich(var plateau : tableau);
	//permet de nommer les colonnes et les lignes et leur couleurs
	var i,j : integer;

	BEGIN
		TextBackground(blue);
		writeln(' ABCDEFGHIJ');
		for i:= 1 to 10 do
			begin
				write(i-1);
				for j:=1 to 10 do
					begin
						if plateau[i,j]='O'then
							begin
								TextColor(white);
							end
						else
							begin
								TextColor(black);
							end;
						write(plateau[i,j]);
						TextColor(white);
					end;
					writeln;
			end;
		
		readln;
	END;


procedure BateauDepart(var plateau : tableau);
	//permet de changer la case en 'X' en fonction de la selection
	BEGIN

		writeln('Vous devez placer 1 porte-avion de 5 cases, 1 croiseur de 4 cases, 2 contre-torpilleurs de 3 cases et 1 tropilleur de 2 cases.');
		writeln('Veuillez selectionner une case afin de poser vos bateaux. Ils ne peuvent pas se toucher ni etre mis en diagonale.');
		readln(posit);

		case posit[1] of
			'A':begin
					verti:=1;
				end;
			'B':begin
					verti:=2;
				end;
			'C':begin
					verti:=3;
				end;
			'D':begin
					verti:=4;
				end;
			'E':begin
					verti:=5;
				end;
			'F':begin
					verti:=6;
				end;
			'G':begin
					verti:=7;
				end;
			'H':begin
					verti:=8;
				end;
			'I':begin
					verti:=9;
				end;
			'J':begin
					verti:=10;
				end;	
		end;

		case posit[2] of
			'0':begin
					horiz:=1;
				end;
			'1':begin
					horiz:=2;
				end;
			'2':begin
					horiz:=3;
				end;
			'3':begin
					horiz:=4;
				end;
			'4':begin
					horiz:=5;
				end;
			'5':begin
					horiz:=6;
				end;
			'6':begin
					horiz:=7;
				end;
			'7':begin
					horiz:=8;
				end;
			'8':begin
					horiz:=9;
				end;
			'9':begin
					horiz:=10;
				end;
		end;

		plateau[horiz,verti]:='X';
		affich(plateau);
		readln;
	END;

procedure Feu(var plateau, plateauselect: tableau);
	//permet au J2 de voir ou il a deja tire et si il a touche un babteau ou non
	BEGIN

		writeln('Veuillez selectionner une case sur laquelle vous aller tirer.');
		readln(posit);

		case posit[1] of
			'A':begin
					verti:=1;
				end;
			'B':begin
					verti:=2;
				end;
			'C':begin
					verti:=3;
				end;
			'D':begin
					verti:=4;
				end;
			'E':begin
					verti:=5;
				end;
			'F':begin
					verti:=6;
				end;
			'G':begin
					verti:=7;
				end;
			'H':begin
					verti:=8;
				end;
			'I':begin
					verti:=9;
				end;
			'J':begin
					verti:=10;
				end;	
		end;

		case posit[2] of
			'0':begin
					horiz:=1;
				end;
			'1':begin
					horiz:=2;
				end;
			'2':begin
					horiz:=3;
				end;
			'3':begin
					horiz:=4;
				end;
			'4':begin
					horiz:=5;
				end;
			'5':begin
					horiz:=6;
				end;
			'6':begin
					horiz:=7;
				end;
			'7':begin
					horiz:=8;
				end;
			'8':begin
					horiz:=9;
				end;
			'9':begin
					horiz:=10;
				end;
		end;

		if plateauselect[horiz,verti]='X' then
			begin
			    writeln('Touche !');
				plateau[horiz,verti]:='*';
			end
		else
			begin
				pvJ2 := pvJ2-1;
				writeln('Plouf !');
				plateau[horiz, verti]:='X';
			end;

		affich(plateau);
		readln;

	END;

	

// Code principal
BEGIN
	clrscr;
	pvJ2 := 10;
	Init(plateauJ1);
	Init(plateauJ2);
	//J1 place ses bateaux
	for i:=1 to 2 do
		begin
			clrscr;
			BateauDepart(plateauJ1);
		end;

	//J2 fait feu tantqu'il a des pv
	clrscr;
	while pvJ2 > 0 do
		begin
			writeln('Il vous reste ',pvJ2 ,' essai(s) pour couler les bateaux ennemis.');
			Feu(plateauJ2, plateauJ1);
		end;
	if pvJ2 = 0 then
		begin
			clrscr;
			writeln('Vous avez perdu...');
			readln;
		end;	
END.

