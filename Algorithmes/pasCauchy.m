%% Algorithme du Pas de Cauchy
%% Contrat :
% nom : pasCauchy
% semantique : Algorithme de du calcul du pas de cauchy
%entree :
    % gk : gradient
    % Hk : hessienne
    % deltak : rayon de la region de confiance
%sortie :
    % s : pas de cauchy
%% Algorithme   
function s = pasCauchy(gk, Hk, deltak)

    a = 0.5 * gk' * Hk * gk;
    normg = norm(gk, 2);
    borne = deltak / normg;
    b = - normg^2;
    
    if a <= 0
        if normg < 10e-10
            t = 1;
        else
            t = borne;
        end
    else
        t = min(borne, - b / (2 * a));
    end
    s = - t * gk;
end

