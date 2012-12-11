%Seed51-Distanzen nur -0.2 bis 0.2 (alle top!)
subplot(3,3,1);
plot(0.1:0.1:120, DistDispFactM02Seed51, 0.1:0.1:120, DistDispFactM01Seed51, 0.1:0.1:120, DistDispFact00Seed51, 0.1:0.1:120, DistDispFact01Seed51, 0.1:0.1:120, DistDispFact02Seed51);
legend('-0.2','-0.1','0.0','0.1','0.2'); axis([0 120 0 10]); xlabel('Time'); ylabel('Total Distance'); title('DispersionFactor Series - Seed 51 (1/3)');

%Seed51-Distanzen nur 0.3 bis 0.6 (nur 0.4 gut, Rest kackt ab)
subplot(3,3,4);
plot(0.1:0.1:120, DistDispFact03Seed51, 0.1:0.1:120, DistDispFact04Seed51, 0.1:0.1:120, DistDispFact05Seed51, 0.1:0.1:120, DistDispFact06Seed51);
legend('0.3','0.4','0.5','0.6'); axis([0 120 0 10]); xlabel('Time'); ylabel('Total Distance'); title('DispersionFactor Series - Seed 51 (2/3)');

%Seed51-Distanzen nur 0.7 bis 1.0 (alle kacken ab)
subplot(3,3,7);
plot(0.1:0.1:120, DistDispFact07Seed51, 0.1:0.1:120, DistDispFact08Seed51, 0.1:0.1:120, DistDispFact09Seed51, 0.1:0.1:120, DistDispFact10Seed51);
legend('0.7','0.8','0.9','1.0'); axis([0 120 0 10]); xlabel('Time'); ylabel('Total Distance'); title('DispersionFactor Series - Seed 51 (3/3)');

%Seed151-Distanzen nur -0.2 bis 0.2 (alle top!)
subplot(3,3,2);
plot(0.1:0.1:120, DistDispFactM02Seed151, 0.1:0.1:120, DistDispFactM01Seed151, 0.1:0.1:120, DistDispFact00Seed151, 0.1:0.1:120, DistDispFact01Seed151, 0.1:0.1:120, DistDispFact02Seed151);
axis([0 120 0 10]); xlabel('Time'); ylabel('Total Distance'); title('DispersionFactor Series - Seed 151 (1/3)');

%Seed151-Distanzen nur 0.3 bis 0.6 (0.3+0.4 gut, 0.5+0.6 kacken ab)
subplot(3,3,5);
plot(0.1:0.1:120, DistDispFact03Seed151, 0.1:0.1:120, DistDispFact04Seed151, 0.1:0.1:120, DistDispFact05Seed151, 0.1:0.1:120, DistDispFact06Seed151);
axis([0 120 0 10]); xlabel('Time'); ylabel('Total Distance'); title('DispersionFactor Series - Seed 151 (2/3)');

%Seed151-Distanzen nur 0.7 bis 1.0 (0.7+0.8 gut, 0.9+1.0 kacken ab)
subplot(3,3,8);
plot(0.1:0.1:120, DistDispFact07Seed151, 0.1:0.1:120, DistDispFact08Seed151, 0.1:0.1:120, DistDispFact09Seed151, 0.1:0.1:120, DistDispFact10Seed151);
axis([0 120 0 10]); xlabel('Time'); ylabel('Total Distance'); title('DispersionFactor Series - Seed 151 (3/3)');

%Seed351-Distanzen nur -0.2 bis 0.2 (alle top!)
subplot(3,3,3);
plot(0.1:0.1:120, DistDispFactM02Seed351, 0.1:0.1:120, DistDispFactM01Seed351, 0.1:0.1:120, DistDispFact00Seed351, 0.1:0.1:120, DistDispFact01Seed351, 0.1:0.1:120, DistDispFact02Seed351);
axis([0 120 0 10]); xlabel('Time'); ylabel('Total Distance'); title('DispersionFactor Series - Seed 351 (1/3)');

%Seed351-Distanzen nur 0.3 bis 0.6 (0.3+0.6 gut, 0.4+0.5 kacken ab)
subplot(3,3,6);
plot(0.1:0.1:120, DistDispFact03Seed351, 0.1:0.1:120, DistDispFact04Seed351, 0.1:0.1:120, DistDispFact05Seed351, 0.1:0.1:120, DistDispFact06Seed351);
axis([0 120 0 10]); xlabel('Time'); ylabel('Total Distance'); title('DispersionFactor Series - Seed 351 (2/3)');

%Seed351-Distanzen nur 0.7 bis 1.0 (alle kacken ab)
subplot(3,3,9);
plot(0.1:0.1:120, DistDispFact07Seed351, 0.1:0.1:120, DistDispFact08Seed351, 0.1:0.1:120, DistDispFact09Seed351, 0.1:0.1:120, DistDispFact10Seed351);
axis([0 120 0 10]); xlabel('Time'); ylabel('Total Distance'); title('DispersionFactor Series - Seed 351 (3/3)');