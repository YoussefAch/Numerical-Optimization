%% Fonction gradient

function [gradient] = grad(f, x)

    if (f == 1)
        gradient = zeros(3,1);
        gradient(1) = 4*(x(1) + x(2) + x(3) -3) + 2*(x(1)-x(2));
        gradient(2) = 4*(x(1) + x(2) + x(3) -3) - 2*(x(1) - x(2)) + 2*(x(2) - x(3));
        gradient(3) = 4*(x(1) + x(2) + x(3) -3) - 2*(x(2) - x(3));
    else 
        gradient = zeros(2,1);
        gradient(1) = -400*x(1) * (x(2) - x(1)*x(1)) - 2*(1 - x(1));
        gradient(2) = 200*(x(2)  - x(1)*x(1));
    end

end

