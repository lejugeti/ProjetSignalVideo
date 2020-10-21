function [ img ] = DecoupeImagette( imageEntree, centre , ajoutFenetre)
% d�coupe une imagette, c'est � dire une partie de l'image donn�e 
% en entr�e, autour du point donn�

W = 37; %zone de pixels dans laquelle on va chercher les coins

% [X, Y] = centre.Coord;

X = centre.X;
Y = centre.Y;

Xmin = X - (ajoutFenetre+(W-1))/2;
Xmax = X + (ajoutFenetre+(W))/2;
Ymin = Y - (ajoutFenetre+(W-1))/2;
Ymax = Y + (ajoutFenetre+(W))/2;

img = imageEntree(Ymin:Ymax, Xmin:Xmax);
end

