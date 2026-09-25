clc;clear;

V0=24;
I0=0.6; 
Vin=12;
Vd=0.5;%Schottky diode voltage
D=(V0+Vd-Vin)/(V0+Vd); %Dmax
Rrt=10000; 
Cct=0.68*10^-9;
fsw=1.72/(Rrt*Cct); 

IL=I0/(1-D); %mean coil current
diL=0.6*IL;
L=Vin*D/(fsw*diL); 
Lmin= D*(1-D)*Vin/(I0*fsw);
Ipk=I0/(1-D)+0.5*diL;

%output cap
dVo=V0*0.02; %low output voltage ripple
C0min=I0*D/(dVo*fsw); 
C0=(10+3*1)*10^-6; %margin. Polymer + 3 ceramic caps
ESR=(1/0.2+3/0.03)^-1; 
RC=ESR; 

dVo1=Ipk*ESR;
dVo2=I0*D/(C0*fsw);
dVo3=diL*ESR;
dVotot=dVo1+dVo2-dVo3;%estimated final ripple

Rsns=1/Ipk;  %0.6(1/2.4||1/2.4||1/2.4||1/2.4)


Mideal=(1/pi + 0.5)/(1-D);
Sn=Rsns*Vin/L; % 0.6*12/(33uH)=0.218 V/uS
Se=(Mideal-1)*Sn; %to achieve this, Rcsf needs to be calculated
Qn=1/(pi*(-D+0.5+(1-D)*Se/Sn) );

Rramp=Rrt*2;
Cramp=10*10^-9;
Zc=1/(2*pi*fsw*Cramp);

Dmin=0.50;
tonmin=Dmin/fsw;
Sosc=1.7/tonmin;
Rcsf=Rramp/(Sosc/Se -1);
Ccsf=47*10^-12; 
zzz=1/(2*pi*4300*47*10^-12);

R0=V0/I0; 
ACS=3;%for UC3843
Aps=(1-D)*R0/(2*Rsns*ACS); 

%ESR zero
W_zesr=1/(RC*C0);
f_z=W_zesr/(2*pi);

%LFP
W_LEP=1/(0.5*(R0+ESR)*C0);
f_LFP=W_LEP/(2*pi); 

%RHP
W_RHP= (R0*(Vin/V0)^2)/L; 
f_RHP=W_RHP/(2*pi); 

W_n=pi*fsw;

f = logspace(0, 6, 10000);
s= 1i*2*pi*f;
Gps=Aps*((1+s/W_zesr) .* (1-s/W_RHP)) ./ ((1+s/W_LEP) .* (1+s/(Qn*W_n)+ s.^2/W_n^2) );

semilogx(f, 20*log10(abs(Gps)), 'k', 'LineWidth', 2);
hold on;
grid on;
figure(2);
semilogx(f, angle(Gps)*(180/pi), 'k', 'LineWidth', 2);
grid on;


%compensation
margin_RHP=f_RHP/4; % assumed range from 1/3 to 1/10. Result: 10kHz
A=3.67; %at 10kHz it's -16dB, which in a 20dB/dec system is 0.15 V/V, ok

RFB2=20000;
R1 = A * RFB2; %75k
%R1=75000;
%calculating zero to compensate for the f_LPF pole
C2=1/(2*pi*R1*f_LFP); % choosing 3.3nF

% calculating pole to compensate for fsw (has nothing to do with previous zeros)
% choosing around 1/5 of fsw
C1=C2/(2*pi*C2*R1*fsw/5-1); %47pF

GBW=1000000; % amplifier bandwidth in the circuit
ADC=5600; %open-loop gain is 75dB

%open-loop gain 
OPG=2*pi*GBW./(s+2*pi*GBW/ADC);

%transfer function of the operational amplifier with negative feedback
G_EA = 1/(RFB2*(C1+C2)) * (s*R1*C2+1) ./ ( s.*( (s*R1*C1*C2/(C1+C2)) + 1 ) );

G_EA_ACTUAL=G_EA.*OPG./(G_EA+OPG); %transformed formula for closed-loop system gain

G=Gps.*G_EA_ACTUAL;

figure(3);
semilogx(f, 20*log10(abs(G)), 'k', 'LineWidth', 2);
hold on;
grid on;
figure(4);
semilogx(f, angle(G)*(180/pi), 'k', 'LineWidth', 2);
grid on;


