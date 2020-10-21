function [ D ] = DetecteurRobuste( lum )
% Renvoie une image trait�e par un d�tecteur de Harris robuste, c'est �
% dire en combinant deux d�tecteur avec une dispersion des filtres
% diff�rentes.
% On passe en argument la luminance d'une image RGB

D1 = DetecteurHarris(lum, 3);
D2 = DetecteurHarris(lum, 5);
D = min(D1 .* abs(D2), D2 .* abs(D1));
end

