%% Fonction phi Generique
%% Contrat :
% nom : phiGenerique
% semantique : fonction generique pour calculer les fonction de type 
%               ||s(lambda||^2 - delta^2 (normal)
%               1/||s(lambda||^2 - 1/delta^2 (inverse)
%entree :
    % lambda : variable de la phonction
    % lambdaVals : valeurs propres
    % vecteurNumerateur : vecteur qui contient les valeurs du numérateurs
    %                     associées a chaque valeur propre
    % delta : constante
    % choix : 'normal' ou 'inverse' selon le type de fonction souhaitee
%sortie :
    % phi : resultat de phi(lambda)
%% Fonction PhiGenerique
function phi = phiGenerique(lambda, lambdaVals, vecteurNumerateur, delta, choix)
    n = size(lambdaVals,1);
    phi = 0;
    
    normS = 0;
    for i=1:n
       normS = normS + vecteurNumerateur(i)/(lambda + lambdaVals(i))^2;
    end
    
    if (strcmp(choix,'normal'))
        phi = normS - delta^2;
    elseif (strcmp(choix,'inverse'))
        phi = 1/normS - 1/(delta^2);
    end
end

