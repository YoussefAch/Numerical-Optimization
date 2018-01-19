disp('TEST LAGRANGIEN');


% Recuperer les fonctions 
grad_f1 = @(x) fun_f1(x, 'gradient');
H_f1 = @(x) fun_f1(x, 'hessienne');
f1 = @(x) fun_f1(x, 'fonction');

c1 = @(x) c1(x);
Jc1 = @(x) J_c1(x);
H_c1 = @(x) H_c1(x);
eta0t = 0.1258925;

x01 = [0;1;1];
x02 = [0.5;1.25;1];
lambda0 = 1;
mu0 = 10;
tau = 100;

alpha = 0.1;
beta = 0.9;
epsilon0 = 1/mu0;
eta0 = eta0t / mu0^alpha;

disp('Test 1 : Fonction f1');
disp('------> x0 = [0;1;1] (realisable)');
[x, lambdak, muk, k] = LagrangienAugmente(f1, grad_f1, H_f1, c1, Jc1, H_c1, mu0, tau, eta0t, alpha, beta, epsilon0, eta0, x01, lambda0, 100, 'Cauchy');
disp(['Valeur de x = ','[',num2str(x(1)),';',num2str(x(2)),';',num2str(x(3)),']']);
disp(['Nombre iterations : ',num2str(k)]);
disp(['Valeur de lambdak = ', num2str(lambdak)]);
disp(['Valeur de muk = ',num2str(muk)]);

disp('------> x0 = [0.5;1.25;1] (non realisable)');
[x, lambdak, muk, k] = LagrangienAugmente(f1, grad_f1, H_f1, c1, Jc1, H_c1, mu0, tau, eta0t, alpha, beta, epsilon0, eta0, x02, lambda0, 100, 'Cauchy');
disp(['Valeur de x = ','[',num2str(x(1)),';',num2str(x(2)),';',num2str(x(3)),']']);
disp(['Nombre iterations : ',num2str(k)]);
disp(['Valeur de lambdak = ', num2str(lambdak)]);
disp(['Valeur de muk = ',num2str(muk)]);

disp('--------------------------------------------------');
disp('--------------------------------------------------');
grad_f2 = @(x) fun_f2(x, 'gradient');
H_f2 = @(x) fun_f2(x, 'hessienne');
f2 = @(x) fun_f2(x, 'fonction');

c2 = @(x) c2(x);
Jc2 = @(x) J_c2(x);
H_c2 = @(x) H_c2(x);
x01 = [1; 0];
x02 = [sqrt(3)/2; sqrt(3)/2];

disp('Test 2 : Fonction f2');
disp('------> x0 = [1; 0] (non realisable)');
[x, lambdak, muk, k] = LagrangienAugmente(f2, grad_f2, H_f2, c2, Jc2, H_c2, mu0, tau, eta0t, alpha, beta, epsilon0, eta0, x01, lambda0, 100, 'Cauchy');
disp(['Valeur de x = ','[',num2str(x(1)),';',num2str(x(2)),']']);
disp(['Nombre iterations : ',num2str(k)]);
disp(['Valeur de lambdak = ', num2str(lambdak)]);
disp(['Valeur de muk = ',num2str(muk)]);
disp('--------------------------------------------------');
disp('--------------------------------------------------');
disp('------> x0 = [sqrt(3)/2; sqrt(3)/2] (realisable)');
[x, lambdak, muk, k] = LagrangienAugmente(f2, grad_f2, H_f2, c2, Jc2, H_c2, mu0, tau, eta0t, alpha, beta, epsilon0, eta0, x02, lambda0, 100, 'Cauchy');
disp(['Valeur de x = ','[',num2str(x(1)),';',num2str(x(2)),']']);
disp(['Nombre iterations : ',num2str(k)]);
disp(['Valeur de lambdak = ', num2str(lambdak)]);
disp(['Valeur de muk = ',num2str(muk)]);



