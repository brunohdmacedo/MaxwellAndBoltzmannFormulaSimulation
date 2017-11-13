clear all, close all;
n = input('Enter the number of random speed you want to enter:');
rndNum = [];
for i = 1:n
 num = 1+(3000*rand(1));
 rndNum(i) = num;
end

rndNum = sort(rndNum);

mass = 5.312967e-26;
massHe = 6.6455288e-27;
massXe = 2.1798605e-25;
massAr = 6.6336765e-26;
massNe = 3.3509963e-26;
temp = 300;
k = 1.38065e-23;

const = mass/(2*pi*k*temp);
const = 4*pi*(const)^1.5;
constHe = massHe/(2*pi*k*temp);
constHe = 4*pi*(constHe)^1.5;
constXe = massXe/(2*pi*k*temp);
constXe = 4*pi*(constXe)^1.5;
constAr = massAr/(2*pi*k*temp);
constAr = 4*pi*(constAr)^1.5;
constNe = massNe/(2*pi*k*temp);
constNe = 4*pi*(constNe)^1.5;

final = [];
finalHe = [];
finalXe = [];
finalAr = [];
finalNe = [];
for i = 1:n
    expPower = ((-1*mass)/(2*k*temp));
    final(i) = const * (rndNum(i) ^ 2) * exp(expPower*(rndNum(i)^2));
    expPower = ((-1*massHe)/(2*k*temp));
    finalHe(i) = constHe * (rndNum(i) ^ 2) * exp(expPower*(rndNum(i)^2));
    expPower = ((-1*massXe)/(2*k*temp));
    finalXe(i) = constXe * (rndNum(i) ^ 2) * exp(expPower*(rndNum(i)^2));
    expPower = ((-1*massAr)/(2*k*temp));
    finalAr(i) = constAr * (rndNum(i) ^ 2) * exp(expPower*(rndNum(i)^2));
    expPower = ((-1*massNe)/(2*k*temp));
    finalNe(i) = constNe * (rndNum(i) ^ 2) * exp(expPower*(rndNum(i)^2));
end


temp1 = input('Please enter Temperature T1 (in Kelvin):');
temp2= input('Please enter Temperature T2 (in Kelvin):');
const1 = mass/(2*pi*k*temp1);
const1 = 4*pi*(const1)^1.5;
const2 = mass/(2*pi*k*temp2);
const2 = 4*pi*(const2)^1.5;
final2 = [];
final3 = [];

for i = 1:n
    expPower = ((-1*mass)/(2*k*temp1));
    final2(i) = const1 * (rndNum(i) ^ 2) * exp(expPower*(rndNum(i)^2));
    hold on;
    expPower = ((-1*mass)/(2*k*temp2));
    final3(i) = const2 * (rndNum(i) ^ 2) * exp(expPower*(rndNum(i)^2));
    hold on;
end

figure(1);
plot(rndNum, final,'-');
xlabel('Speed (m/s)');
ylabel('Distribution function');
title( sprintf('Distribution of Oxygen molecule at 300K') );

figure(2);
plot(rndNum, final2,'-');
hold on;
plot(rndNum, final3,'-');
xlabel('Speed (m/s)');
ylabel('Distribution function');
title( sprintf('Distribution of Oxygen molecule at temperature, T1: %d and temperature T2: %d', temp1, temp2') );

figure(3);
plot(rndNum, finalHe,'-');
hold on;
plot(rndNum, finalNe,'-');
hold on;
plot(rndNum, finalAr,'-');
hold on;
plot(rndNum, finalXe,'-');
legend('He', 'Ne', 'Ar', 'Xe');
xlabel('Speed (m/s)');
ylabel('Distribution function');
title( sprintf('Maxwell-Boltzmann Molecular Speed Distribution for Noble gases') );
