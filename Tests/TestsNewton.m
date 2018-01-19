%% Tests  de l'algorithme de Newton local
disp('---------- Tests de Newton ----------');

%% Fonction f1
disp('----- Fonction f1 -----');

% Recuperer les fonctions 
grad_f1 = @(x) fun_f1(x, 'gradient');
H_f1 = @(x) fun_f1(x, 'hessienne');
f1 = @(x) fun_f1(x, 'fonction');

% initialisation des parametres
x011 = [1; 0; 0];
x012 = [10; 3; -2.2];
nbIterMax = 100;
epsilon = 10e-10;

disp('--');
% execution de la fonction testee et v�rification des r�sultats
disp('-------- Test pour la valeur initiale [1; 0; 0]');
[x, minf1, flag, nbIter] = NewtonLocal(f1, grad_f1, H_f1, x011, epsilon, nbIterMax);
if (flag == 0)
    disp(['algo de Newton a converge en ', num2str(nbIter), ' iteration(s).']);   
elseif (flag == 1)
    disp(['Distance entre iteres trop faible pour poursuivre',  num2str(nbIter), ' iteration(s).']);
elseif (flag == 2)
    disp(['Distance entre f(xk) et f(xk+1) trop faible pour poursuivre : ',  num2str(nbIter), ' iteration(s).']);
elseif (flag == 3)
    disp(['Nombre maximum d iterations atteint !!!!!!!!!!  ',  num2str(nbIter), ' iteration(s).']);
end
    disp(['Valeur de x atteint comme minimum : ','[',num2str(x(1)),'; ',num2str(x(2)),'; ',num2str(x(3)),']']);
    disp('Valeur de x attendue : [1; 1; 1] ');
    disp(['Valeur de f atteinte :  ', num2str(minf1)]);

disp('--');
disp('-------- Test pour la valeur initiale [10; 3; -2.2]');
[x, minf1, flag, nbIter] = NewtonLocal(f1, grad_f1, H_f1, x012, epsilon, nbIterMax);
if (flag == 0)
    disp(['algo de Newton a converge en ', num2str(nbIter), ' iteration(s).']);   
elseif (flag == 1)
    disp(['Distance entre iteres trop faible pour poursuivre',  num2str(nbIter), ' iteration(s).']);
elseif (flag == 2)
    disp(['Distance entre f(xk) et f(xk+1) trop faible pour poursuivre : ',  num2str(nbIter), ' iteration(s).']);
elseif (flag == 3)
    disp(['Nombre maximum d iterations atteint !!!!!!!!!!  ',  num2str(nbIter), ' iteration(s).']);
end
    disp(['Valeur de x atteint comme minimum : ','[',num2str(x(1)),'; ',num2str(x(2)),'; ',num2str(x(3)),']']);
    disp('Valeur de x attendue : [1; 1; 1] ');
    disp(['Valeur de f atteinte :  ', num2str(minf1)]);

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
nbIterMax = 100;
epsilon = 10e-10;


% execution de la fonction testee et v�rification des r�sultats
disp('-------- Test pour la valeur initiale [-1.2; 1].');
[x, minf2, flag, nbIter] = NewtonLocal(f2, grad_f2, H_f2, x021, epsilon, nbIterMax);
if (flag == 0)
    disp(['algo de Newton a converge en ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 1)
    disp(['Distance entre iteres trop faible pour poursuivre',  num2str(nbIter), ' iteration(s).']);
elseif (flag == 2)
    disp(['Distance entre f(xk) et f(xk+1) trop faible pour poursuivre : ',  num2str(nbIter), ' iteration(s).']);
elseif (flag == 3)
    disp(['Nombre maximum d iterations atteint !!!!!!!!!!  ',  num2str(nbIter), ' iteration(s).']);
end
    disp(['Valeur de x atteint comme minimum : ','[',num2str(x(1)),'; ',num2str(x(2)),']']);
    disp('Valeur de x attendue : [1; 1] ');
    disp(['Valeur de f atteinte :  ', num2str(minf2)]);


disp('--');
disp('-------- Test pour la valeur initiale [10; 0]');
[x, minf2, flag, nbIter] = NewtonLocal(f2, grad_f2, H_f2, x022, epsilon, nbIterMax);
if (flag == 0)
    disp(['algo de Newton a converge en ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 1)
    disp(['Distance entre iteres trop faible pour poursuivre',  num2str(nbIter), ' iteration(s).']);
elseif (flag == 2)
    disp(['Distance entre f(xk) et f(xk+1) trop faible pour poursuivre : ',  num2str(nbIter), ' iteration(s).']);
elseif (flag == 3) 
    disp(['Nombre maximum d iterations atteint !!!!!!!!!!  ',  num2str(nbIter), ' iteration(s).']);
end
    disp(['Valeur de x atteint comme minimum : ','[',num2str(x(1)),'; ',num2str(x(2)),']']);
    disp('Valeur de x attendue : [1; 1] ');
    disp(['Valeur de f atteinte :  ', num2str(minf2)]);

disp('--');
disp('-------- Test pour la valeur initiale [0; 1/200 + 10e-12]');
[x, minf2, flag, nbIter] = NewtonLocal(f2, grad_f2, H_f2, x023, epsilon, nbIterMax);
if (flag == 0)
    disp(['algo de Newton a converge en ', num2str(nbIter), ' iteration(s).']);
elseif (flag == 1)
    disp(['Distance entre iteres trop faible pour poursuivre',  num2str(nbIter), ' iteration(s).']);
elseif (flag == 2)
    disp(['Distance entre f(xk) et f(xk+1) trop faible pour poursuivre : ',  num2str(nbIter), ' iteration(s).']);
elseif (flag == 3)
    disp(['Nombre maximum d iterations atteint !!!!!!!!!!  ',  num2str(nbIter), ' iteration(s).']);
end
    disp(['Valeur de x atteint comme minimum : ','[',num2str(x(1)),'; ',num2str(x(2)),']']);
    disp('Valeur de x attendue : [1; 1] ');
    disp(['Valeur de f atteinte :  ', num2str(minf2)]);

disp('------------------------Fin Tests');