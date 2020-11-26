function [h] = Homographie3D(PGH, PGB, PDH, PDB, PB1, PB2, lengthX, lengthY)
%renvoie la matrice d'homographie 3D

x1 = 1; %gauche haut
y1 = 1;
z1 = 1;
x2 = 1; %gauche bas
y2 = 1080;
z2 = 1;
x3 = 1920; % droite haut
y3 = 1;
z3 = 1;
x4 = 1920; % droite bas
y4 = 1080/4;
z4 = 1;
x5 = 1920/8; % cube1
y5 = 1080/2;
z5 = 2;
x6 = 1920/2; % cube2
y6 = 1080/2;
z6 = 3;

A = [
    
	x1 y1 z1 1 0 0 0 0 -x1*PGH.X -y1*PGH.X 0;

    0 0 0 0 x1 y1 z1 1 -x1*PGH.Y -y1*PGH.Y 0;

	x2 y2 z2 1 0 0 0 0 -x2*PGB.X -y2*PGB.X 0;

	0 0 0 0 x2 y2 z1 1 -x2*PGB.Y -y2*PGB.Y 0;
    
	x3 y3 z3 1 0  0 0 0 -x3*PDH.X -y3*PDH.X 0;
    
	0 0 0 0 x3 y3 z3 1 -x3*PDH.Y -y3*PDH.Y 0;
    
	x4 y4 z4 1 0 0 0 0 -x4*PDB.X -y4*PDB.X 0;
    
	0 0 0 0 x4 y4 z4 1 -x4*PDB.Y -y4*PDB.Y 0;
    
    x5 y5 z5 1 0 0 0 0 -x5*PB1.X -y5*PB1.X -z5*PB1.X;

    0 0 0 0 x5 y5 z5 1 -x5*PB1.Y -y5*PB1.Y -z5*PB1.Y;
    
    x6 y6 z6 1 0 0 0 0 -x6*PB2.X -y6*PB2.X -z6*PB2.X;

    0 0 0 0 x6 y6 z6 1 -x6*PB2.Y -y6*PB2.Y -z6*PB2.Y;
    ];

c = [PGH.X PGH.Y PGB.X PGB.Y PDH.X PDH.Y PDB.X PDB.Y PB1.X PB1.Y PB2.X PB2.Y]';

temp = inv(A'*A) * A' * c;

h = [
	temp(1),temp(2), temp(3), temp(4);
	temp(5), temp(6), temp(7), temp(8);
	temp(9), temp(10), temp(11), 1
    ];
end

