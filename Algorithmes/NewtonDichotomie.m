%% Algorithme de Newton (Local)
%% Contrat :
% nom : NewtonLocal
% semantique : Algorithme de resolution du probleme :  phi(lamda) = 0
%entree :
    % phi : fonction phi
    % phiP : dérivée de la fonction phi
    % epsilon : precision de la résolution de ||s(lamda)||^2 - &^2
    % lambdaMin : borne inf de l'intervalle de recherche
    % lambdaMax : borne sup de l'intervalle de recherche
    % nbIterMax : nombre d'iteration maximum
%sortie :
    % sol : solution lamda de l'equation
    % it : nombre d'iterations
    % flag : flag de sortie
        % flag = 0 : convergence
        % flag = 1 : nombre maximum diterations atteint
%conditions d'arret :
    % |phi(lamda)| < epsilon 
    % it  >= nbIterMax
%% Algorithme Safe guarded Newton pour la resolution des equation non lineaires
function [sol, it, flag] = NewtonDichotomie(phi, phiP, epsilon, lambdaMin, lambdaMax, nbIterMax)
    
    [minimum, ind] = min([abs(phi(lambdaMin)); abs(phi(lambdaMax))]);
    % vérifier si on est deja sur la solution qui satisfait la precision
    if  minimum < epsilon
        if (ind == 1)
            sol = lambdaMin;
        else
            sol = lambdaMax;
        end
        flag = 0;
    else
        lambda = lambdaMax;
        it = 0;
        % Recherche de la solution 
        while ((abs(phi(lambda)) >= epsilon) && it < nbIterMax)
           
           phi_lambda = phi(lambda);
           phiPrime_lambda = phiP(lambda);
           % iteration de Newton
           lambdaN = lambda - phi_lambda/phiPrime_lambda;
            
           % si l'iteration de Newton est acceptee
           if (lambdaN >= lambdaMin && lambdaN <= lambdaMax  && abs(phi(lambdaN)) < 0.5*abs(phi_lambda))
               lambda = lambdaN;
           % Sinon on utilise la dichotomie
           else
               lambdaD = (lambdaMin + lambdaMax)/2;
               lambda = lambdaD;
           end
           % Mise à jour de lambda max ou min
               if (phi(lambdaMin)*phi(lambda) <= 0)
                   lambdaMax = lambda;
               elseif (phi(lambda)*phi(lambdaMax) <= 0)
                   lambdaMin = lambda;
               end
            % Passer a l'iteration suivante
            it = it + 1;
        end
        
        % Mise a jour du flag
        if (it == nbIterMax)
            flag = 1;
        else
            flag = 0;
        end
        sol = lambda;
    end
    
end

