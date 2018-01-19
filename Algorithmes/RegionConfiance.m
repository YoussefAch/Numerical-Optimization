%% Algorithme de Region de confiance
%% Contrat :
% nom : Region de confiance
% semantique : Algorithme de resolution du probleme (min f(x))
% entree :
    % f : fonction a minimiser
    % grad_f : fonction gradient de f
    % H_f : fonction Hessienne de f
    % x0 : point de depart
    % epsilon : precision de la solution
    % delta0 : rayon initial de la region de confiance
    % deltaMax : rayon maximal de la region de confiance
    % gamma1 : coefficient pour réduire la region de confiance 
    % gamma2 : coefficient pour étendre la region de confiance
    % eta1 : coefficient  pour déterminer si literation est reussie
    % eta2 : coefficient  pour déterminer si literation est très reussie
    % nbIterMax : nombre maximum d'iterations
    % typePas : Cauchy ou MoreSorensen
% sortie :
    % x : solution approchee du probleme min f(x) 
    % minf : valeur de f en x
    % ngsol : norme du gradient en x
    % nbIter : nombre d'iteration.
    % nevals : nombre d'appels a la fonction et ses derivees
        % nevals(1) : nombre d'appels a la fonction
        % nevals(2) : nombre d'appels au gradient
        % nevals(3) : nombre d'appels a la hessienne
    % flag : flag de sortie indiquant la condition de sortie
        % flag = 0 : Convergence
        % flag = 1 : Distance entre iteres trop faible pour poursuivre
        % flag = 2 : Distance entre les f(iteres) trop faibles
        % flag = 3 : nombre maximum d'iterations depasse
% preconditions :
    % deltaMax > 0
    % 0 < delta0 <= deltaMax
    % 0 < gamma1 < 1 < gamma2
    % 0 < eta1 < eta2 < 1
% conditions d'arret :
    % |gradf(xk)| < epsilon * (|gradf(x0)| + sqrt(10e-6))
    % |xk+1 - xk| < epsilon * (|xk| + sqrt(10e-6))
    % |f(xk+1) - f(xk)| < epsilon * (|f(xk)| + sqrt(10e-6))
    % iter > nbIterMax
%% Algorithme
function [x, minf, ngsol, nbIter, nevals, flag] = RegionConfiance(f, grad_f, H_f, x0, epsilon, delta0, deltaMax, gamma1, gamma2, eta1, eta2, nbIterMax, typePas)

    % Initialisations 
    xk = x0;
    gk = grad_f(xk);
    hk = H_f(xk);
    fk = f(xk);
    
    nevals(1) = 1;
    nevals(2) = 1;
    nevals(3) = 1;
    iter = 0;
    deltak = delta0;
    
    normG0 = norm(gk,2);
    
    critereGradient = epsilon * (normG0 + sqrt(10e-10));    
    stagX = true;
    stagF = true;
    convergence = (norm(gk,2) > critereGradient);
    
    % Boucle principale
    while (iter < nbIterMax && convergence && stagX && stagF)
        
        % Calcul du pas
        if (strcmp(typePas,'Cauchy'))
            sk = pasCauchy(gk, hk, deltak);
        elseif (strcmp(typePas,'MoreSorensen'))
            [sk, ~] = MoreSorensen(gk, hk, deltak, 0.000000001);
        end
 
        
        % Calcul du nouveau point 
        xp = xk + sk;
        fp = f(xp);
        nevals(1) = nevals(1) + 1;
        
        % Calcul du rapport rho
        Rho = (fp - fk) / (gk' * sk + 0.5 * sk' * hk * sk);
       
        % Evaluation de rho
        if (Rho >= eta1)
            Difference = norm(xp - xk, 2);
            DiffDeF = norm(fp-fk,2);
            normXk = norm(xk, 2);
            normFk = abs(fk);
            stagF = (DiffDeF > epsilon * (normFk + sqrt(10e-6)));
            stagX = (Difference > epsilon * (normXk + sqrt(10e-6)));
            
            xk = xp;
            
            % Mise a jour des donnees
            gk = grad_f(xk);
            nevals(2) = nevals(2) + 1;

            convergence = (norm(gk,2) > critereGradient);
            if (convergence && (iter + 1) ~= nbIterMax)
                hk = H_f(xk);
                nevals(3) = nevals(3) + 1;
            end
            fk = fp;
            
        end
        
        
        % Mise a jour de la region de confiance
        if (Rho >= eta2)
            deltak = min(gamma2*deltak, deltaMax);
        else
            if (Rho < eta1)
                deltak = gamma1 * deltak;
            end
        end
        

        % Passer a l iteraion suivante
        iter = iter + 1;

    end
    
    
    %% Retourner les r�sultats
    x = xk;
    minf = fk;
    nbIter = iter;
    ngsol = norm(gk);
    % Retourner le flag indiquant si l'algorithme a converg� ou pas
    if (iter >= nbIterMax)
        flag = 3;
    elseif (norm(gk) <= critereGradient)
        flag = 0;
    elseif (stagX)
        flag = 1;
    elseif (stagF)
        flag = 2;
    else
        flag = inf;
    end
   

end
