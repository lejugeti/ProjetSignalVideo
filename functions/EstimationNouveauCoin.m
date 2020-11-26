function [ pointNouveau ] = EstimationNouveauCoin( pointActuel, pointAncien )
% Estime gr�ce � un mod�le lin�aire la position du point � la prochaine
% frame. On utilise pour cela les coordonn�es du point actuel Xt, et celles
% du point pr�c�dent Xt-1.
% On passe en argument le couple de coordonn�es [X Y] des points


newCoord = pointActuel.Coord + (pointActuel.Coord - pointAncien.Coord) / 3;
pointNouveau = Point(newCoord(1), newCoord(2));
end

