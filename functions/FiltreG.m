function [ G ] = FiltreG( sigma )
% cr�e un filtre gaussien � partir des grids X et Y

[X,Y] = meshgrid(- 3 * sigma : 3 * sigma);
denominateur = 2 * pi * sigma^2;
exposant = (X.^2 + Y.^2)/(2*sigma^2);
G = (1 / denominateur) * exp(-exposant);

end

