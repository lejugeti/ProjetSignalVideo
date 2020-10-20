function [ img ] = DecoupeImagette( imageEntree, coordonnees )
% d�coupe une imagette, c'est � dire une partie de l'image donn�e 
% en entr�e, autour du point donn�

W = 37; %zone de pixels dans laquelle on va chercher les coins

X = coordonnees(1);
Y = coordonnees(2);

Xmin = X - (50+(W-1))/2;
Xmax = X + (50+(W+1))/2;
Ymin = Y - (50+(W-1))/2;
Ymax = Y + (50+(W+1))/2;

img = imageEntree(Xmin:Xmax, Ymin:Ymax);
end

