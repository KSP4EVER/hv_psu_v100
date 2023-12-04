% Uki = [0:0.1:6000];
Uki = 800;
Rt = 660000;
% Iki = Uki./Rt;
Iki = [0:0.00001:0.025];
Ube = 9;
at = 100;

f = 40000;
L1 = 420*10^(-6);
Ls = 40*10^(-6);
rds = 0.2;

T = 1/f;

Uzn = repmat(80, [1,60001]);

d = Uki./(Uki+at*Ube);
tbe = d./f;
dIl = Ube/(at*L1).*tbe;
Id = 1./(1-d).*Iki+dIl./2;
Ik = at.*Id;
Ifetrms = sqrt((Ik.^2).*tbe./T);
Pfet = rds.*Ifetrms.^2;
%Uzn = Ube+Uki./at + 1;
Pz = (Uzn/(Uzn-(Uki/at)))*(Ls*f)/2.*(at.*Iki.*(T./(T-tbe))).^2;

Pfeedback = Uki.*(Uki./9910000);

theta1 = (Uki.*Iki)./(Ube.*Ifetrms+Pz+Pfet+Pfeedback);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Uki = 1200;
d = Uki./(Uki+at*Ube);
tbe = d./f;
dIl = Ube/(at*L1).*tbe;
Id = 1./(1-d).*Iki+dIl./2;
Ik = at.*Id;
Ifetrms = sqrt((Ik.^2).*tbe./T);
Pfet = rds.*Ifetrms.^2;
% Uzn = Ube+Uki./at + 1;
Pz = (Uzn/(Uzn-(Uki/at)))*(Ls*f)/2.*(at.*Iki.*(T./(T-tbe))).^2;

Pfeedback = Uki.*(Uki./9910000);

theta2 = (Uki.*Iki)./(Ube.*Ifetrms+Pz+Pfet+Pfeedback);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Uki = 1600;
d = Uki./(Uki+at*Ube);
tbe = d./f;
dIl = Ube/(at*L1).*tbe;
Id = 1./(1-d).*Iki+dIl./2;
Ik = at.*Id;
Ifetrms = sqrt((Ik.^2).*tbe./T);
Pfet = rds.*Ifetrms.^2;
% Uzn = Ube+Uki./at + 1;
Pz = (Uzn/(Uzn-(Uki/at)))*(Ls*f)/2.*(at.*Iki.*(T./(T-tbe))).^2;

Pfeedback = Uki.*(Uki./9910000);

theta3 = (Uki.*Iki)./(Ube.*Ifetrms+Pz+Pfet+Pfeedback);

plot(Iki,theta1,Iki,theta2,Iki,theta3);
title("Hatásfok a terhelőáram függvényében");
ylabel("Hatásfok [%]");
xlabel("Kimeneti áram [A]");
legend({'Uki = 800V','Uki = 1200V','Uki = 1600V'});
grid on;
grid minor;
