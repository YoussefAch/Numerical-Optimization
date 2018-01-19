%% Tests  de l'algorithme de Newton local
disp('---------- Tests de Region de Confiance MoreSorensen ----------');

%% Fonction f1
disp('----- Fonction f1 -----');

% Recuperer les fonctions 
grad_f1 = @(x) fun_f1(x, 'gradient');
H_f1 = @(x) fun_f1(x, 'hessienne');
f1 = @(x) fun_f1(x, 'fonction');

% initialisation des parametres
x011 = [1; 0; 0];
x012 = [10; 3; -2.2];
nbIterMax = 50;
delta0 = 2;
epsilon = 0.001;
deltaMax = 10;
gamma1 = 0.5;
gamma2 = 2;
eta1 = 0.25;
eta2 = 0.75;


disp('--');
% execution de la fonction testee et v�rification des r�sultats
disp('-------- Test pour la valeur initiale [1; 0; 0]');
[x, minf, ngsol, nbIter, nevals, flag] = RegionConfiance(f1, grad_f1, H_f1, x011, epsilon, delta0, deltaMax, gamma1, gamma2, eta1, eta2, nbIterMax, 'MoreSorensen');

if (flag == 0)
    disp(['algo de Region de Confiance a converge en ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 1)
    disp(['Stagnation sur x ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 2)
    disp(['Stagnation sur f ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 3)
    disp(['Nombre maximum d iterations atteint !!!!!!!!!!', ' ', num2str(nbIter), ' iterations.']);
end
    disp(['Valeur de x atteint comme minimum : ','[',num2str(x(1)),'; ',num2str(x(2)),'; ',num2str(x(3)),']']);
    disp('Valeur de x attendue : [1; 1] ');
    disp(['Valeur de f atteinte :  ', num2str(minf)]);
    disp(['Norme du gradient en x :  ', num2str(ngsol)]);
    disp(['Nombre d evaluation de f  : ', num2str(nevals(1))]);
    disp(['Nombre d evaluation de grad f : ', num2str(nevals(2))]);
    disp(['Nombre d evaluation de la hessienne de f : ', num2str(nevals(3))]);
    
    
disp('--');
disp('-------- Test pour la valeur initiale [10; 3; -2.2]');
[x, minf, ngsol, nbIter, nevals, flag] = RegionConfiance(f1, grad_f1, H_f1, x012, epsilon, delta0, deltaMax, gamma1, gamma2, eta1, eta2, nbIterMax, 'MoreSorensen');
if (flag == 0)
    disp(['algo de Region de Confiance a converge en ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 1)
    disp(['Stagnation sur x ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 2)
    disp(['Stagnation sur f ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 3)
    disp(['Nombre maximum d iterations atteint !!!!!!!!!!', ' ', num2str(nbIter), ' iterations.']);
end
    disp(['Valeur de x atteint comme minimum : ','[',num2str(x(1)),'; ',num2str(x(2)),'; ',num2str(x(3)),']']);
    disp('Valeur de x attendue : [1; 1] ');
    disp(['Valeur de f atteinte :  ', num2str(minf)]);
    disp(['Norme du gradient en x :  ', num2str(ngsol)]);
    disp(['Nombre d evaluation de f : ', num2str(nevals(1))]);
    disp(['Nombre d evaluation de grad f : ', num2str(nevals(2))]);
    disp(['Nombre d evaluation de la hessienne de f : ', num2str(nevals(3))]);
    
    
%% Fontion f2
disp('--');
disp('--');
disp('----- Fonction f2 -----');

% Recuperer les fonctions 
grad_f2 = @(x) fun_f2(x, 'gradient');
H_f2 = @(x) fun_f2(x, 'hessienne');
f2 = @(x) fun_f2(x, 'fonction');


% initialisation des parametres
x021 = [-1.2; 1];
x022 = [10; 0];
x023 = [0; 1/200 + 10e-12];
%x023 = [0; 0.005];

deltaMax = 100000;
nbIterMax = 50;
delta0 = 1;
epsilon = 0.001;
gamma1 = 0.5;
gamma2 = 2;
eta1 = 0.25;
eta2 = 0.75;


% execution de la fonction testee et v�rification des r�sultats
disp('-------- Test pour la valeur initiale [-1.2; 1].');
[x, minf2, ngsol, nbIter, nevals, flag] = RegionConfiance(f2, grad_f2, H_f2, x021, epsilon, delta0, deltaMax, gamma1, gamma2, eta1, eta2, nbIterMax, 'MoreSorensen');
if (flag == 0)
    disp(['algo de Region de Confiance a converge en ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 1)
    disp(['Stagnation sur x ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 2)
    disp(['Stagnation sur f ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 3)
    disp(['Nombre maximum d iterations atteint !!!!!!!!!!', ' ', num2str(nbIter), ' iterations.']);
end
    disp(['Valeur de x atteint comme minimum : ','[',num2str(x(1)),'; ',num2str(x(2)),']']);
    disp('Valeur de x attendue : [1; 1] ');
    disp(['Valeur de f atteinte :  ', num2str(minf2)]);
    disp(['Norme du gradient en x :  ', num2str(ngsol)]);
    disp(['Nombre d evaluation de f : ', num2str(nevals(1))]);
    disp(['Nombre d evaluation de grad f : ', num2str(nevals(2))]);
    disp(['Nombre d evaluation de la hessienne de f : ', num2str(nevals(3))]);

disp('--');
disp('-------- Test pour la valeur initiale [10; 0]');
[x, minf2, ngsol, nbIter, nevals, flag] = RegionConfiance(f2, grad_f2, H_f2, x022, epsilon, delta0, deltaMax, gamma1, gamma2, eta1, eta2, nbIterMax, 'MoreSorensen');
if (flag == 0)
    disp(['algo de Region de Confiance a converge en ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 1)
    disp(['Stagnation sur x ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 2)
    disp(['Stagnation sur f ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 3)
    disp(['Nombre maximum d iterations atteint !!!!!!!!!!', ' ', num2str(nbIter), ' iterations.']);
end
    disp(['Valeur de x atteint comme minimum : ','[',num2str(x(1)),'; ',num2str(x(2)),']']);
    disp('Valeur de x attendue : [1; 1] ');
    disp(['Valeur de f atteinte :  ', num2str(minf2)]);
    disp(['Norme du gradient en x :  ', num2str(ngsol)]);
    disp(['Nombre d evaluation de f : ', num2str(nevals(1))]);
    disp(['Nombre d evaluation de grad f : ', num2str(nevals(2))]);
    disp(['Nombre d evaluation de la hessienne de f : ', num2str(nevals(3))]);

disp('--');
disp('-------- Test pour la valeur initiale [0; 1/200 + 10e-12]');
[x, minf2, ngsol, nbIter, nevals, flag] = RegionConfiance(f2, grad_f2, H_f2, x023, epsilon, delta0, deltaMax, gamma1, gamma2, eta1, eta2, nbIterMax, 'MoreSorensen');
if (flag == 0)
    disp(['algo de Region de Confiance a converge en ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 1)
    disp(['Stagnation sur x ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 2)
    disp(['Stagnation sur f ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 3)
    disp(['Nombre maximum d iterations atteint !!!!!!!!!!', ' ', num2str(nbIter), ' iterations.']);
end
    disp(['Valeur de x atteint comme minimum : ','[',num2str(x(1)),'; ',num2str(x(2)),']']);
    disp('Valeur de x attendue : [1; 1] ');
    disp(['Valeur de f atteinte :  ', num2str(minf2)]);
    disp(['Norme du gradient en x :  ', num2str(ngsol)]);
    disp(['Nombre d evaluation de f : ', num2str(nevals(1))]);
    disp(['Nombre d evaluation de grad f : ', num2str(nevals(2))]);
    disp(['Nombre d evaluation de la hessienne de f : ', num2str(nevals(3))]);


disp('Fin Tests Annexe ------------------------------------------------------');

disp('Debut autres tests pour la fonction f2');
% initialisation des parametres
x024 = [0; 1];
x025 = [2; 1];
x026 = [1; 2];

disp('--');
disp('-------- Test pour la valeur initiale [0; 1]');
[x, minf2, ngsol, nbIter, nevals, flag] = RegionConfiance(f2, grad_f2, H_f2, x024, epsilon, delta0, deltaMax, gamma1, gamma2, eta1, eta2, nbIterMax, 'MoreSorensen');
if (flag == 0)
    disp(['algo de Region de Confiance a converge en ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 1)
    disp(['Stagnation sur x ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 2)
    disp(['Stagnation sur f ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 3)
    disp(['Nombre maximum d iterations atteint !!!!!!!!!!', ' ', num2str(nbIter), ' iterations.']);
end
    disp(['Valeur de x atteint comme minimum : ','[',num2str(x(1)),'; ',num2str(x(2)),']']);
    disp('Valeur de x attendue : [1; 1] ');
    disp(['Valeur de f atteinte :  ', num2str(minf2)]);
    disp(['Norme du gradient en x :  ', num2str(ngsol)]);
    disp(['Nombre d evaluation de f : ', num2str(nevals(1))]);
    disp(['Nombre d evaluation de grad f : ', num2str(nevals(2))]);
    disp(['Nombre d evaluation de la hessienne de f : ', num2str(nevals(3))]);

    
disp('--');
disp('-------- Test pour la valeur initiale [2; 1]');
[x, minf2, ngsol, nbIter, nevals, flag] = RegionConfiance(f2, grad_f2, H_f2, x025, epsilon, delta0, deltaMax, gamma1, gamma2, eta1, eta2, nbIterMax, 'MoreSorensen');
if (flag == 0)
    disp(['algo de Region de Confiance a converge en ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 1)
    disp(['Stagnation sur x ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 2)
    disp(['Stagnation sur f ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 3)
    disp(['Nombre maximum d iterations atteint !!!!!!!!!!', ' ', num2str(nbIter), ' iterations.']);
end
    disp(['Valeur de x atteint comme minimum : ','[',num2str(x(1)),'; ',num2str(x(2)),']']);
    disp('Valeur de x attendue : [1; 1] ');
    disp(['Valeur de f atteinte :  ', num2str(minf2)]);
    disp(['Norme du gradient en x :  ', num2str(ngsol)]);
    disp(['Nombre d evaluation de f : ', num2str(nevals(1))]);
    disp(['Nombre d evaluation de grad f : ', num2str(nevals(2))]);
    disp(['Nombre d evaluation de la hessienne de f : ', num2str(nevals(3))]);

    
disp('--');
disp('-------- Test pour la valeur initiale [1; 2]');
[x, minf2, ngsol, nbIter, nevals, flag] = RegionConfiance(f2, grad_f2, H_f2, x026, epsilon, delta0, deltaMax, gamma1, gamma2, eta1, eta2, nbIterMax, 'MoreSorensen');
if (flag == 0)
    disp(['algo de Region de Confiance a converge en ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 1)
    disp(['Stagnation sur x ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 2)
    disp(['Stagnation sur f ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 3)
    disp(['Nombre maximum d iterations atteint !!!!!!!!!!', ' ', num2str(nbIter), ' iterations.']);
end
    disp(['Valeur de x atteint comme minimum : ','[',num2str(x(1)),'; ',num2str(x(2)),']']);
    disp('Valeur de x attendue : [1; 1] ');
    disp(['Valeur de f atteinte :  ', num2str(minf2)]);
    disp(['Norme du gradient en x :  ', num2str(ngsol)]);
    disp(['Nombre d evaluation de f : ', num2str(nevals(1))]);
    disp(['Nombre d evaluation de grad f : ', num2str(nevals(2))]);
    disp(['Nombre d evaluation de la hessienne de f : ', num2str(nevals(3))]);