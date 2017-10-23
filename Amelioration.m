function [ flots ] = Amelioration( puits, source , sommets, marques, pointeurs, successeurs, flots, capacite)
%% Améliore le flot compatible courant avec le marquage spécifié
%% EN ENTREE :
% puits : sommet d'arrivée du graphe
% source : sommet de départ du graphe
% sommets : Les sommets du graphe
% marques : marquage permettant d'améliorer le flot
% pointeurs : tableau du nombre d'arcs sortant de chaque sommet
% successeurs : tableau des sommets pointés par des arcs
% flots : flot associé à chaque arc

%% EN SORTIE 
% flots : flots améliorés

t = puits;
%% Trouver la quantité maximale à ajouter au flot
minFlot = inf;
while( t ~= source)
    
    % s : sommet précédent t dans le marquage, pondéré par le sens de l'arc
    % les reliant
    s = marques(t);
    
    % Recherche de l'indice de l'arc liant s et t
    % arc orienté positivement
    if (s > 0)
        indArc = getIndArc(s, t, pointeurs, successeurs);
        minFlot = min(minFlot, capacite(indArc) - flots(indArc));
    % arc orienté négativement
    else
        indArc = getIndArc(t, -s, pointeurs, successeurs);
        minFlot = min(minFlot, flots(indArc));
    end
    
    % calcul du nouveau flot maximal à ajouter
    if (s ~= 0)
    end
    t = abs(s);
end

%% Affecter la nouvelle valeur du flot à chaque arc 
t = puits;
while( t ~= source)
    
    % arc orienté négativement
    if (marques(sommets(t)) > 0)
        s = marques(t);
        indArc = getIndArc(s, t, pointeurs, successeurs);
        flots(indArc) = flots(indArc) + minFlot;
    % arc orienté négativement
    elseif (marques(t) < 0)
        s = marques(t);
        indArc = getIndArc(t, -s, pointeurs, successeurs);
        flots(indArc) = flots(indArc) - minFlot;
    end
    t = abs(s);
end

return
end

