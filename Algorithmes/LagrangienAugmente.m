%% Algorithme du Lagrangien Augmente
%% Contrat :
% nom : Lagrangien Augmente
% semantique : Algorithme qui permet la resolution des problemes avec
%              contraintes
%entree :
    % f : fonction à minimiser
    % grad_f : gradient de f
    % H_f : hessienne de f
    % c : fonction des contraintes
    % J_c : jacobienne des contraintes
    % H_c : hessienne des contraintes
    % mu0 : constante de pénalisation
    % tau : taux de croissance de pénalisation
    % eta0t : précision du respect de la contrainte
    % alpha : constante > 0
    % beta : constante > 0
    % epsilon0 : précision initiale du probleme du lagrangien
    % x0 : point de depart
    % lambda0 : multiplicateur de lagrange
    % nbIterMax : nombre d'iterations maximal
    % typePas : 'Cauchy' ou 'MoreSorensen'
%sortie :
    % xk : solution du probleme
    % lambdak : multiplicateur de lagrange
    % muk : parametre de pénalisation
    % k : nombre d iterations
    % flag : flag de sortie
        % flag = 0 : convergence
        % flag = 
%% Algorithme
function [xk, lambdak, muk, k] = LagrangienAugmente(f, grad_f, H_f, c, J_c, H_c, mu0, tau, eta0t, alpha, beta, epsilon0, eta0, x0, lambda0, nbIterMax, typePas)


    % Intitialisations
    k = 0;
    xk = x0;
    lambdak = lambda0;
    epsilonk = epsilon0;
    etak = eta0;
    muk = mu0;
    
    % Criteres
    normGL0 = norm(GL(x0, grad_f, J_c, lambda0));
    critereGradientLagrangien = 10e-8 * (normGL0 + sqrt(10e-6)); 
    convergence = (norm(GL(xk, grad_f, J_c, lambda0)) <= critereGradientLagrangien);
    critereContrainte = true;
    critereStagnationX = true;
    
    
    % Tant qu'il n'y a pas de convergence
    while(k < nbIterMax && ~convergence && critereContrainte && critereStagnationX)
        
        % Calcul du minimum du probleme du lagrangien augmente
        
        % r�cuperation des fonctions utilitaires du lagrangien augmente
        LA_f = @(x) LA(x, f, c, lambdak, muk);
        GLA_f = @(x) GradientLA(x, grad_f, J_c, c, lambdak, muk);
        HLA_f = @(x) hessienneLA(x, H_f, c, J_c, H_c, muk, lambdak);
        iter = 0;
        
        % On stocke l ancienne valeur de x pour le critere de stagnation
        % sur x
        xp = xk;
        
        % Recherche du minimiseur du probleme du lagrangien augmente
        while (norm(GradientLA(xk, grad_f, J_c, c, lambdak, muk)) > epsilonk && iter < 100)
            if (strcmp(typePas,'Newton'))
               [xk, ~, ~, ~] = NewtonLocal(LA_f, GLA_f, HLA_f, xk, epsilon0, 100);
            else
                [xk, ~, ~, ~, ~, ~] = RegionConfiance(LA_f, GLA_f, HLA_f, xk, epsilonk, 0.5, 2, 0.5, 2, 0.25, 0.75, 100, typePas);
            end
            iter = iter + 1;
        end
        
        % Mise a jour des criteres
        critereContrainte = (norm(c(xk)) > 10e-6);
        critereStagnationX = (norm(xp - xk) > 10e-8);
        convergence = (norm(GL(xk, grad_f, J_c, lambdak)) <= critereGradientLagrangien);
        
        
        % Verification de la convergence de l algorithme global
        if (~convergence)
            if (norm(c(xk)) <= etak)
                lambdak = lambdak + muk*c(xk);
                epsilonk = epsilonk / muk;
                etak = etak / (muk ^ beta);
            else
                muk = muk * tau;
                epsilonk = epsilon0 / muk;
                etak = eta0t / (muk^alpha);
            end
        end
        k = k + 1;
    end

end