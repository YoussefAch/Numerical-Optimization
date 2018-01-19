%% Algorithme de Newton (Local)
%% Contrat :
% nom : NewtonLocal
% semantique : Algorithme de resolution du probleme (min f(x))
%entree :
    % grad_f : fonction gradient de f
    % H_f : fonction Hessienne de f
    % x0 : premiere approximation de la solution cherchee
    % epsilon : precision de la solution
    % nbIterMax : nombre maximum d'iterations
%sortie :
    % x : solution approchee du probleme min f(x) 
    % minf : valeur de f en x
    % flag : flag de sortie indiquant la condition de sortie
        % flag = 0 : Convergence
        % flag = 1 : Distance entre iteres trop faible pour poursuivre
        % flag = 2 : Distance entre les f(iteres) trop faibles
        % flag = 3 : nombre maximum d'iterations atteint
    % nbIter : nombre d'iteration.
%conditions d'arret :
    % |gradf(xk)| < epsilon * (|gradf(x0)| + sqrt(10e-6))
    % |xk+1 - xk| < epsilon * |xk|
    % |f(xk+1) - f(xk)| < epsilon * (|f(xk)| + sqrt(10e-6))
    % iter > nbIterMax
%% Algorithme    
function [x, minf, flag, nbIter] = NewtonLocal(f, grad_f, H_f, x0, epsilon, nbIterMax)

    % Initialisations
    xk = x0;
    gk = grad_f(xk);
    normG0 = norm(gk,2);
    normXk = norm(xk,2);
    critereGradient = epsilon * (normG0 + 1);
    Difference = 3 * epsilon * normXk;
    stagF = true;
    iter = 0;
    
    
    %% Boucle principale
    while (iter <= nbIterMax && norm(gk,2) > critereGradient &&  Difference > epsilon * normXk && stagF)
        
        % Calcul du pas
        dk = - H_f(xk)\grad_f(xk);
        
        % Mise à jour du point
        xp = xk + dk;
        
        % Mise à jour des données et criteres d'arret
        Difference = norm(xp - xk, 2);
        normXk = norm(xk, 2);
        f_xk = f(xk);
        stagF = (norm(f(xp) - f_xk) > epsilon * (norm(f_xk)));
        xk = xp;
        gk = grad_f(xk);
        
        
        % Passer à l'itération suivante
        iter = iter + 1;
    end
    
    %% Retourner les r�sultats
    x = xk;
    minf = f(xk);
    nbIter = iter;
    
    % Retourner le flag indiquant si l'algorithme a convergé ou pas
    if (iter > nbIterMax)
        flag = 3;
    elseif (norm(gk) <= critereGradient)
        flag = 0;
    elseif (Difference <= epsilon * normXk)
        flag = 1;
    elseif (~stagF)
        flag = 2;
    end
    
    
    
end

