function [ pointNouveau ] = EstimationNouveauCoin( pointActuel, pointAncien )
% Estime grâce à un modèle linéaire la position du point à la prochaine
% frame. On utilise pour cela les coordonnées du point actuel Xt, et celles
% du point précédent Xt-1.
% On passe en argument le couple de coordonnées [X Y] des points

pointNouveau = pointActuel + (pointActuel - pointAncien) ./ 2;
end

