%% Tests  de l'algorithme de NewtonDichotomie
disp('---------- Tests de NewtonDichotomie ----------');

%% Fonction 1 choix 1
disp('----- Fonction phi1 = ||s(lamda)||^2 - &^2 -----');
disp('--------- Exemple 1 avec & = 0.5');
delta = 0.5;

epsilon = 10e-6;
lamdaMin = -9;
lamdaMax = 1000;

phi = @(lamda) phiGenerique(lamda, [2; 14], [4; 36], delta, 'normal');
phiP = @(lamda) phiPrimeGenerique(lamda, [2; 14], [4; 36], 'normal');

[sol, it, flag] = NewtonDichotomie(phi, phiP, epsilon, lamdaMin, lamdaMax, 500);
disp(['Solution : ', num2str(sol)]);
disp(['valeur de Phi(solution) : ', num2str(phi(sol))]);
disp(['Nombre iterations :', num2str(it)]);
disp(['valeur du flag : ', num2str(flag)]);
disp('valeur attendue de Phi(solution) : 0');
disp('--------------------------------------------------------');
disp('--------------------------------------------------------');

%% Fonction 1 choix 2
disp('----- Fonction phi1 =  ||s(lamda)||^2 - &^2 -----');
disp('--------- Exemple 2 avec & = 0.2');
delta = 0.2;
epsilon = 10e-6;
lamdaMin = -9;
lamdaMax = 100000;

phi = @(lamda) phiGenerique(lamda, [-38; 20], [4; 400], delta, 'normal');
phiP = @(lamda) phiPrimeGenerique(lamda, [-38; 20], [4; 400], 'normal');

[sol, it, flag] = NewtonDichotomie(phi, phiP, epsilon, lamdaMin, lamdaMax, 500);
disp(['Solution : ', num2str(sol)]);
disp(['valeur de Phi(solution) : ', num2str(phi(sol))]);
disp(['Nombre iterations :', num2str(it)]);
disp(['valeur du flag : ', num2str(flag)]);
disp('valeur attendue de Phi(solution) : 0');
disp('--------------------------------------------------------');
disp('--------------------------------------------------------');


%% Fonction 2 choix 1
disp('----- Fonction phi1 =  ||s(lamda)||^2 - &^2 -----');
disp('--------- Exemple 1 avec & = 0.7');
delta = 0.7;

epsilon = 10e-6;
lamdaMin = -9;
lamdaMax = 1000;

phi = @(lamda) phiGenerique(lamda, [-38; 20], [4; 400], delta, 'normal');
phiP = @(lamda) phiPrimeGenerique(lamda, [-38; 20], [4; 400], 'normal');


[sol, it, flag] = NewtonDichotomie(phi, phiP, epsilon, lamdaMin, lamdaMax, 500);
disp(['Solution : ', num2str(sol)]);
disp(['valeur de Phi(solution) : ', num2str(phi(sol))]);
disp(['Nombre iterations :', num2str(it)]);
disp(['valeur du flag : ', num2str(flag)]);
disp('valeur attendue de Phi(solution) : 0');
disp('--------------------------------------------------------');
disp('--------------------------------------------------------');

%% Fonction 1 choix 2
disp('----- Fonction phi2 = 1 / ||s(lamda)||^2 - 1 / &^2 -----');
disp('--------- Exemple 1 avec & = 0.5');
delta = 0.5;

epsilon = 10e-6;
lamdaMin = -9;
lamdaMax = 100000;

phi = @(lamda) phiGenerique(lamda, [2; 14], [4; 36], delta, 'inverse');
phiP = @(lamda) phiPrimeGenerique(lamda, [2; 14], [4; 36], 'inverse');

[sol, it, flag] = NewtonDichotomie(phi, phiP, epsilon, lamdaMin, lamdaMax, 500);
disp(['Solution : ', num2str(sol)]);
disp(['Nombre iterations :', num2str(it)]);
disp(['valeur du flag : ', num2str(flag)]);
disp(['valeur de Phi(solution) : ', num2str(phi(sol))]);
disp('valeur attendue de Phi(solution) : 0');
disp('--------------------------------------------------------');
disp('--------------------------------------------------------');

%% Fonction 2 choix 1
disp('----- Fonction phi2 = 1 / ||s(lamda)||^2 - 1 / &^2 -----');
disp('--------- Exemple 2 avec & = 0.2');
delta = 0.2;

epsilon = 10e-6;
lamdaMin = -9;
lamdaMax = 1000;

phi = @(lamda) phiGenerique(lamda, [-38; 20], [4; 400], delta, 'inverse');
phiP = @(lamda) phiPrimeGenerique(lamda, [-38; 20], [4; 400], 'inverse');

[sol, it, flag] = NewtonDichotomie(phi, phiP, epsilon, lamdaMin, lamdaMax, 500);
disp(['Solution : ', num2str(sol)]);
disp(['valeur de Phi(solution) : ', num2str(phi(sol))]);
disp(['Nombre iterations :', num2str(it)]);
disp(['valeur du flag : ', num2str(flag)]);
disp('valeur attendue de Phi(solution) : 0');
disp('--------------------------------------------------------');
disp('--------------------------------------------------------');

%% Fonction 1 choix 2
disp('----- Fonction phi2 = 1 / ||s(lamda)||^2 - 1 / &^2 -----');
disp('--------- Exemple 2 avec & = 0.7');
delta = 0.7;

epsilon = 10e-6;
lamdaMin = -10000;
lamdaMax = 100000;

phi = @(lamda) phiGenerique(lamda, [-38; 20], [4; 400], delta, 'inverse');
phiP = @(lamda) phiPrimeGenerique(lamda, [-38; 20], [4; 400], 'inverse');


[sol, it, flag] = NewtonDichotomie(phi, phiP, epsilon, lamdaMin, lamdaMax, 500);
disp(['Solution : ', num2str(sol)]);
disp(['valeur de Phi(solution) : ', num2str(phi(sol))]);
disp(['Nombre iterations :', num2str(it)]);
disp(['valeur du flag : ', num2str(flag)]);
disp('valeur attendue de Phi(solution) : 0');
disp('--------------------------------------------------------');
disp('--------------------------------------------------------');
