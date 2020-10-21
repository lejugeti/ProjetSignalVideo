function [ pointNouveau ] = EstimationNouveauCoin( pointActuel, pointAncien )
% Estime gr�ce � un mod�le lin�aire la position du point � la prochaine
% frame. On utilise pour cela les coordonn�es du point actuel Xt, et celles
% du point pr�c�dent Xt-1.
% On passe en argument le couple de coordonn�es [X Y] des points

pointNouveau = pointActuel + (pointActuel - pointAncien) ./ 2;
end

