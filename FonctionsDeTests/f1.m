% Fonction de test f1
% f1 : R3 -> R
function y = f1(x)
    y = 2*(x(1) + x(2) + x(3) -3)^2  +  (x(1)-x(2))^2  +  (x(2) - x(3))^2;
end

