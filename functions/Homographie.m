function [h] = Homographie(PGH, PGB, PDH, PDB, lengthX, lengthY)


%renvoie la matrice d'homographie

x1 = 1; %gauche haut

y1 = 1;


x2 = 1; %gauche bas

y2 = lengthY;


x3 = lengthX; % droite haut

y3 = 1;

x4 = lengthX; % droite bas

y4 = lengthY;



A = [
    
	x1 y1 1 0 0 0 -x1*PGH.X -y1*PGH.X;

    	0 0 0 x1 y1 1 -x1*PGH.Y -y1*PGH.Y;

	x2 y2 1 0 0 0 -x2*PGB.X -y2*PGB.X;

	0 0 0 x2 y2 1 -x2*PGB.Y -y2*PGB.Y;
    
	x3 y3 1 0 0 0 -x3*PDH.X -y3*PDH.X;
    
	0 0 0 x3 y3 1 -x3*PDH.Y -y3*PDH.Y;
    
	x4 y4 1 0 0 0 -x4*PDB.X -y4*PDB.X;
    
	0 0 0 x4 y4 1 -x4*PDB.Y -y4*PDB.Y;
    
    ];



c = [PGH.X PGH.Y PGB.X PGB.Y PDH.X PDH.Y PDB.X PDB.Y]';



temp = A\c;



h = [
    
	temp(1),temp(2), temp(3);
    
	temp(4), temp(5), temp(6);
    
	temp(7), temp(8), 1
    
    ];



end
