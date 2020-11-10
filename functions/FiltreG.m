function [ G ] = FiltreG( sigma )
% crée un filtre gaussien à partir des grids X et Y

sigmaG = sigma;
[X,Y] = meshgrid(- 3 * sigmaG : 3 * sigmaG);
denominateur = 2 * pi * sigmaG^2;
exposant = (X.^2 + Y.^2)/(2*sigmaG^2);
G = (1 / denominateur) * exp(-exposant);

end

