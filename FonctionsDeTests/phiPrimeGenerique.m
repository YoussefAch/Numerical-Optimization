%% Fonction phi prime Generique
%% Contrat :
% nom : phiGenerique
% semantique : fonction generique pour calculer la derivee des fonction de type 
%               ||s(lambda||^2 - delta^2 (normal)
%               1/||s(lambda||^2 - 1/delta^2 (inverse)
%entree :
    % lambda : variable de la phonction
    % lambdaVals : valeurs propres
    % vecteurNumerateur : vecteur qui contient les valeurs du numérateurs
    %                     associées a chaque valeur propre
    % choix : 'normal' ou 'inverse' selon le type de fonction souhaitee
%sortie :
    % phiP : resultat de phiPrime(lambda)
%% Fonction PhiPrimeGenerique
function phiP = phiPrimeGenerique(lamda, lamdaVals, vecteurNumerateur, choix)
    phiP = 0;
    n = size(lamdaVals,1);
    if (strcmp(choix,'normal'))
        for i=1:n
           phiP = phiP + (vecteurNumerateur(i))/(lamda + lamdaVals(i))^3;
        end
        phiP = -2 * phiP;
    elseif (strcmp(choix,'inverse'))
        phi = phiGenerique(lamda, lamdaVals, vecteurNumerateur, 0, 'normal');
        phiPrime = 0;
        for i=1:n
           phiPrime = phiPrime + (vecteurNumerateur(i))/(lamda + lamdaVals(i))^3;
        end
        phiPrime = -2 * phiPrime;
        phiP = - phiPrime / ((phi)^2);
    end
end

