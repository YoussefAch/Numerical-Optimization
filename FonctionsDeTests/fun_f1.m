%% Interface de la fonction de test f1

function [res] = fun_f1(x, choix)

   if (strcmp(choix,'gradient'))
        res = grad(1, x);
   elseif (strcmp(choix,'hessienne'))
        res = Hessienne(1, x);
   elseif (strcmp(choix,'fonction'))
        res = f1(x);
   end
   
end

