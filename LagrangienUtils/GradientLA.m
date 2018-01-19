%% Grandient du lagrangien Augmente
function gradientLagrangienAug = GradientLA(x, grad_f, J_c, c, lambdak, muk)
    gradientLagrangienAug = grad_f(x) + J_c(x)' * (lambdak + muk*c(x));
end

