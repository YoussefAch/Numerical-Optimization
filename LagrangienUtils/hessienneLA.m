%% Hessienne du lagrangien augmente
function h = hessienneLA(x, H_f, c, J_c, H_c, muk, lambdak)
    H_f_x = H_f(x);
    somme = zeros(size(H_f_x));
    for i=1:size(c(x),2)
        c_x = c(x);
       somme = somme + H_c(i) * (lambdak + muk*c_x(i));
    end
    h = H_f_x + muk * J_c(x)' * J_c(x) + somme;
end
