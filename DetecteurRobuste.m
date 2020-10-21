function [ D ] = DetecteurRobuste( lum )
% Renvoie une image traitée par un détecteur de Harris robuste, c'est à
% dire en combinant deux détecteur avec une dispersion des filtres
% différentes.
% On passe en argument la luminance d'une image RGB

D1 = DetecteurHarris(lum, 3);
D2 = DetecteurHarris(lum, 5);
D = min(D1 .* abs(D2), D2 .* abs(D1));
end

