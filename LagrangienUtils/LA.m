%% Lagrangien Augmente
function lagrangienAugmente = LA(x, f, c, lambdak, muk)
    lagrangienAugmente = f(x) + lambdak' * c(x) + muk/2 * (norm(c(x))^2);
end

