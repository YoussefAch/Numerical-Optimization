%% Tests  du Pas de Cauchy
disp('---------- Tests du Pas de cauchy ----------');

%% Quadratique 1
g1 = [0; 0];
H1 = [7 0; 0 2];
disp('TEST g1 = [0; 0] et H1 = [7 0; 0 2] et delta = 1');
disp('le pas de cauchy est : ');

s = pasCauchy(g1, H1, 1);

disp(['s = [',num2str(s(1)),'; ',num2str(s(2)),']']);
disp(['de norme : ',num2str(norm(s))]);
disp('---------------------------------------------');
disp('---------------------------------------------');
%% Quadratique 2
g2 = [6; 2];
H2 = [7 0; 0 2];

disp('TEST g2 = [6; 2] et H2 = [7 0; 0 2] et delta = 1');
disp('le pas de cauchy est : ');
s = pasCauchy(g2, H2, 1);
disp(['s = [',num2str(s(1)),'; ',num2str(s(2)),']']);
disp(['de norme : ',num2str(norm(s))]);

disp('---------------------------------------------');
disp('---------------------------------------------');
%% Quadratique 2
g3 = [-2; 1];
H3 = [-2 0; 0 10];

disp('TEST g3 = [-2; 1] et H3 = [-2 0; 0 10] et delta = 1');
disp('le pas de cauchy est : ');
s = pasCauchy(g3, H3, 1);

disp(['s = [',num2str(s(1)),'; ',num2str(s(2)),']']);
disp(['de norme : ',num2str(norm(s))]);
disp('---------------------------------------------');
disp('---------------------------------------------');

disp('TEST g3 = [-2; 1] et H3 = [-2 0; 0 10] et delta = 0.5');
disp('le pas de cauchy est : ');
s = pasCauchy(g3, H3, 0.5);

disp(['s = [',num2str(s(1)),'; ',num2str(s(2)),']']);
disp(['de norme : ',num2str(norm(s))]);
disp('---------------------------------------------');
disp('---------------------------------------------');