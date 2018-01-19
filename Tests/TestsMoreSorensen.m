%% Tests  du Pas de Cauchy
disp('---------- Tests du Pas de MoreSorensen ----------');

%% Quadratique 1
g1 = [0; 0];
H1 = [-2 0; 0 10];
delta = 1;
epsilon = 10e-8;
disp('TEST g1 = [0; 0] et H1 = [-2 0; 0 10] et delta = 1');
disp('le pas de MoreSorensen est : ');

[s, lamdaEt] = MoreSorensen(g1, H1, delta, epsilon);
disp(['s = [',num2str(s(1)),'; ',num2str(s(2)),']']);
disp(['de norme : ',num2str(norm(s))]);
s = etalonms(g1,H1,delta,epsilon);
disp('Valeur obtenue par l etalon est : ');
disp(['s = [',num2str(s(1)),'; ',num2str(s(2)),']']);
disp('---------------------------------------------');
disp('---------------------------------------------');
%% Quadratique 2
g2 = [2; 3];
H2 = [4 6; 6 5];
delta = 1;
epsilon = 10e-8;
disp('TEST g2 = [2; 3] et H2 = [4 6; 6 5] et delta = 1');
disp('le pas de MoreSorensen est : ');
[s, lamdaEt] = MoreSorensen(g2, H2, delta, epsilon);
disp(['s = [',num2str(s(1)),'; ',num2str(s(2)),']']);
disp(['de norme : ',num2str(norm(s))]);
s = etalonms(g2,H2,delta,epsilon);
disp('Valeur obtenue par l etalon est : ');
disp(['s = [',num2str(s(1)),'; ',num2str(s(2)),']']);
disp('---------------------------------------------');
disp('---------------------------------------------');
%% Quadratique 2
g3 = [2; 0];
H3 = [4 0; 0 -15];
delta = 1;
epsilon = 10e-8;
disp('TEST g3 = [2; 0] et H3 = [4 0; 0 -15] et delta = 1');
disp('le pas de MoreSorensen est : ');
[s, lamdaEt] = MoreSorensen(g3, H3, delta, epsilon);

disp(['s = [',num2str(s(1)),'; ',num2str(s(2)),']']);
disp(['de norme : ',num2str(norm(s))]);
s = etalonms(g3,H3,delta,epsilon);
disp('Valeur obtenue par l etalon est : ');
disp(['s = [',num2str(s(1)),'; ',num2str(s(2)),']']);
disp('---------------------------------------------');
disp('---------------------------------------------');



delta = 0.5;
epsilon = 10e-8;
disp('TEST g3 = [2; 0] et H3 = [4 0; 0 -15] et delta = 0.5');
disp('le pas de cauchy est : ');
[s, lamdaEt] = MoreSorensen(g3, H3, delta, epsilon);

disp(['s = [',num2str(s(1)),'; ',num2str(s(2)),']']);
disp(['de norme : ',num2str(norm(s))]);
s = etalonms(g3,H3,delta,epsilon);
disp('Valeur obtenue par l etalon est : ');
disp(['s = [',num2str(s(1)),'; ',num2str(s(2)),']']);
disp('---------------------------------------------');
disp('---------------------------------------------');