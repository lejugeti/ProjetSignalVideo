x = 1;
y = 2;
[X, Y] = meshgrid();

sigma = 2;
denominateur = 2 * pi * sigma*sigma;
exposant = (X*X + Y*Y)/2*sigma*sigma;
filtre_gaussien = (1 / denominateur) * exp(-exposant);