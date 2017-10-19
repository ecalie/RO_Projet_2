function[indice] = getIndSucc(Pointeur,Sommets,Sommet)
% retourne les indices de début et de fin des arcs sortant de Sommet dans
% Successeurs
%% ENTREE
% Pointeur : tableaux du nombre d'arcs sortant pour chaque sommet
% Sommets : tableau des Sommets du graphe
% Sommet : sommet dont on cherche les arcs sortant*

%% SORTIE
% indice : tableau 1*2 contenant l'indice du premier arc sortant et du
% dernier arc sortant

%% Note : l'indice du sommet dans Sommets est aussi la valeur du Sommet

indice(1)=1; % indice du premier arc partant de Sommet
for i = 1:Sommet-1
   indice(1) = indice(1) + Pointeur(i);
end
%indice du dernier arc partant de Sommet
indice(2) = indice(1) + Pointeur(Sommet) - 1;
return;
