%% Fonction hessinne

function [h] = Hessienne(f, x)

    if (f==1)
        h = zeros(3,3);
        h(1,1) = 6;
        h(2,1) = 2;
        h(3,1) = 4;
        h(1,2) = 2;
        h(2,2) = 8;
        h(3,2) = 2;
        h(1,3) = 4;
        h(2,3) = 2;
        h(3,3) = 6;
    else 
        h = zeros(2,2);
        h(1,1) = -400* (x(2) - x(1)*x(1)) - 400*x(1) * (-2*x(1)) +2;
        h(2,2) = 200;
        h(1,2) = -400*x(1);
        h(2,1) = -400*x(1);
    end

end

