% Résolution du problème du plus court chemin dans un graphe
% à la page 57

function [] = resolution_plus_court_chemin_application()

% Modélisation du réseau
% le graphe utilisé est celui de la page 57

% le point de départ et d'arrivée
depart = 1;
arrivee = 8;

% l'ensemble des sommets du graphe
sommets = [1, 2, 3, 4, 5, 6, 7, 8];

% le nombre de successeurs de chaque sommet
pointeurs = [2, 3, 1, 3, 2, 2, 2, 0];

% la liste des successeurs de chaque sommet
successeurs = [2, 3, ... % pour le sommet 1
               3, 4, 5, ... % pour le sommet 2
               6, ... % etc ...
               3, 6, 7, ...
               4, 7, ...
               7, 8, ...
               5, 8 ... % pour le sommet 7
               ]; % pour le sommet 8

% les capacités correspondantes à chaque arc !
capacites = [1, 2, ... % pour le sommet 1
             5, 3, 3, ... % etc ...
             2, ...
             1, 7, 3, ...
             0, 3, ...
             2, 4, ...
             1 ...
             ]; % pour le sommet 8
           
[valeurChemin, chemin] = FFTension(depart, arrivee, successeurs, capacites, pointeurs, sommets);

% Affichage du chemin et de sa valeur
disp("Le chemin a une longueur de " + valeurChemin);
str_chemin = "";
for s = size(chemin, 2)
    if(s < size(chemin, 2)
        str_chemin = str_chemin + s + " -> ";
    else if
        str_chemin = str_chemin + s;
    end
end
disp(str_chemin + "On est arrivee !");

end

