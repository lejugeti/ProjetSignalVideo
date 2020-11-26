function [ D ] = DetecteurHarris( lum, sigmaCov )
%Renvoie une image traitée avec le détecteur de Harris
%On traite en entrée la luminance Y d'une image
%sigmaCov correspond à la dispersion du filtre gaussient


lambda = 0.05;

G = FiltreG(sigmaCov);
Gx = FiltreDeriveeG('X');
Gy = FiltreDeriveeG('Y');

Ix = conv2(lum, Gx, 'same');
Iy = conv2(lum, Gy, 'same');

Cxx = conv2((Ix .* Ix),  G, 'same');
Cxy = conv2((Ix .* Iy),  G, 'same');
Cyy = conv2((Iy .* Iy),  G, 'same');

D = Cxx .* Cyy - Cxy .* Cxy - (lambda .* (Cxx + Cyy).^2);
end

