%% Interface de la fonction de test f2

function [res] = fun_f2(x, choix)

    if (strcmp(choix,'gradient'))
        res = grad(2, x);
    elseif (strcmp(choix,'hessienne'))
        res = Hessienne(2, x);
    elseif (strcmp(choix,'fonction'))
        res = f2(x);
    end
   
end
