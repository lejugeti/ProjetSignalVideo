function [ G ] = FiltreDeriveeG(coordonnee)
% cr�e une filtre d'une d�riv�e d'une gaussienne � partir d'une grid
% coordonnee indique s'il faut cr�er ce filtre en X ou en Y

sigma = 2;

[X,Y] = meshgrid(-3*sigma:3*sigma);

if(coordonnee=='X')
    direction = X;
elseif(coordonnee=='Y')
    direction = Y;
end

denominateurDerivee = 2 * pi * sigma^4;
exposant = (X.^2 + Y.^2)/(2*sigma^2);
G = (-1 * direction / denominateurDerivee) .* exp(-exposant);

end

