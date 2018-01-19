%% Gradient du lagrangien
function gradientLagrangien = GL(x, grad_f, J_c, lambdak)
    gradientLagrangien = grad_f(x) + J_c(x)' * lambdak;
end

