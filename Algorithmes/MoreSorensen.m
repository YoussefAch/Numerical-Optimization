%% Algorithme du Pas de More-Sorensen
%% Contrat :
% nom : MoreSorensen
% semantique : Algorithme de calcul du pas de More Sorensen
%entree :
    % g : gradient
    % H : hessienne
    % delta : rayon de la region de confiance
    % epsilon : precision du calcul de la solution de l'equation
    %           ||s(lamda)||^2 - delta^2 = 0
%sortie :
    % s : pas de MoreSorensen : approximation du sous probleme de RC 
    %     g^t * s + 0.5 * s^t * H * s
    % lamdaEt : lamda* approximation du multiplicateur de lagrange associé
    %           à la contrainte ||s|| <= delta
%% Algorithme
function [s, lambdaEt] = MoreSorensen(g, H, delta, epsilon)
    

% decomposition spectrale
[q, d] = eig(H);
% pas de newton
sN = -H \ g;
% recuperation des valeurs propres
lambdas  = diag(d);



% D'abord on cherche s'il y a une solution interieure
if (lambdas(1) >=0 && norm(sN,2) <= delta)
    s = sN;
    lambdaEt = 0;
    return;
% Sinon on cherche une solution sur la frontiere
else
    
    % nombre de colonnes de q
    n = size(q, 2);
   
    if (abs(q(:,1)' * g) > 10e-2)
        % cas simple

        
        % Calcul du numerateur de phi et phiP
        vecteurNumerateurPhi = zeros(size(q ,2));
        for i=1:size(q ,2)
            vecteurNumerateurPhi(i) = (q(:,i)'*g)^2;
        end
        
        % Recuperation des fonctions phi et phiPrime
        phiF = @(lambda) phiGenerique(lambda, lambdas, vecteurNumerateurPhi, delta, 'normal');
        phiD = @(lambda) phiPrimeGenerique(lambda, lambdas, vecteurNumerateurPhi, 'normal');
        
        % Lambda min et lambdaMax
        lambdaMin = max(0, -lambdas(1));
        lambdaMax = lambdaMin + 1;
        
        % Recherche de lamdaMax
        while (phiF(lambdaMin)*phiF(lambdaMax) > 0)
            lambdaMax = lambdaMax + 10;
        end
        
        % Resolution de l equation
        lambdaEt = NewtonDichotomie(phiF, phiD, epsilon, lambdaMin, lambdaMax, 500);
        
        %calcul s(lamdaEt)
        rs = zeros(size(q(:,1)));
        for i=1:size(q ,2)
            rs = rs + ((q(:,i)'*g) / (lambdas(i) + lambdaEt)) * q(:,i);
        end
        s = -rs;
        return
    else
       
        % s-lamda1
        s1 = zeros(size(q(:,1)));
        for i=2:size(q ,2)
            s1 = s1 + ((q(:,i)'*g) / (lambdas(i) - lambdas(1))) * q(:,i);
        end
        s1 = -s1;
     
        if (norm(s1,2) > delta)
            % Calcul du numerateur de phi et phiP
            vecteurNumerateurPhi = zeros(size(q ,2)-1);
            for i=2:size(q ,2)
                vecteurNumerateurPhi(i) = (q(:,i)'*g)^2;
            end
            
            % Recuperation des fonctions phi et phiPrime
            phiF = @(lambda) phiGenerique(lambda, lambdas(2:n), vecteurNumerateurPhi, delta, 'normal');
            phiD = @(lambda) phiPrimeGenerique(lambda, lambdas(2:n), vecteurNumerateurPhi, 'normal');
            
            % lambdaMin et lambdaMax
            lambdaMin = max(0, -lambdas(1));
            lambdaMax = lambdaMin;
            
            % Recherche de lambdaMax
            while (phiF(lambdaMin)*phiF(lambdaMax) > 0)
                lambdaMax = lambdaMax + 100;
            end
            
            % Resolution de l'equation
            lambdaEt = NewtonDichotomie(phiF, phiD, epsilon, lambdaMin, lambdaMax, 500);

            % calcul de s(lamdaEt)
            rs = zeros(size(q(:,1)));
            for i=2:size(q ,2)
                rs = rs + (q(:,i)'*g) / (lambdas(i) + lambdaEt) * q(:,i);
            end
            s = -rs;
            return
        else
            % Cas difficile
            alpha = sqrt(delta^2 - norm(s1)^2);
            s = s1 + alpha*q(:,1);
            lambdaEt = -lambdas(1);
            return;
        end
    end
    
end

end