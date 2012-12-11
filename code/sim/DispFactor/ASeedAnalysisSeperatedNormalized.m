%Plots 3x3-Matrix with subplots analyzing the seeds, the seeds being
%seperated into smaller groups for better readability (-0.2 - 0.2 ; 0.3 -
%0.6 ; 0.7 - 1.0).
%The legends have to be moved manually so that one can see the plots.
%The total Distance per Iteration is divided by the number of agents in the
%system, that's why we call it "normalized".

%Seed51-Distanzen nur -0.2 bis 0.2 (alle top!)
subplot(3,3,1);
plot(0.1:0.1:120, DistDispFactM02Seed51./AISDispFactM02Seed51, 0.1:0.1:120, DistDispFactM01Seed51./AISDispFactM01Seed51, 0.1:0.1:120, DistDispFact00Seed51./AISDispFact00Seed51, 0.1:0.1:120, DistDispFact01Seed51./AISDispFact01Seed51, 0.1:0.1:120, DistDispFact02Seed51./AISDispFact02Seed51);
legend('-0.2','-0.1','0.0','0.1','0.2'); xlabel('Time'); ylabel('Total Distance'); title('DispersionFactor Series - Seed 51 (1/3)'); axis([0 120 0 0.16]);

%Seed51-Distanzen nur 0.3 bis 0.6 (nur 0.4 gut, Rest kackt ab)
subplot(3,3,4);
plot(0.1:0.1:120, DistDispFact03Seed51./AISDispFact03Seed51, 0.1:0.1:120, DistDispFact04Seed51./AISDispFact04Seed51, 0.1:0.1:120, DistDispFact05Seed51./AISDispFact05Seed51, 0.1:0.1:120, DistDispFact06Seed51./AISDispFact06Seed51);
legend('0.3','0.4','0.5','0.6'); xlabel('Time'); ylabel('Total Distance'); title('DispersionFactor Series - Seed 51 (2/3)'); axis([0 120 0 0.16]);

%Seed51-Distanzen nur 0.7 bis 1.0 (alle kacken ab)
subplot(3,3,7);
plot(0.1:0.1:120, DistDispFact07Seed51./AISDispFact07Seed51, 0.1:0.1:120, DistDispFact08Seed51./AISDispFact08Seed51, 0.1:0.1:120, DistDispFact09Seed51./AISDispFact09Seed51, 0.1:0.1:120, DistDispFact10Seed51./AISDispFact10Seed51);
legend('0.7','0.8','0.9','1.0'); xlabel('Time'); ylabel('Total Distance'); title('DispersionFactor Series - Seed 51 (3/3)'); axis([0 120 0 0.16]);

%Seed151-Distanzen nur -0.2 bis 0.2 (alle top!)
subplot(3,3,2);
plot(0.1:0.1:120, DistDispFactM02Seed151./AISDispFactM02Seed151, 0.1:0.1:120, DistDispFactM01Seed151./AISDispFactM01Seed151, 0.1:0.1:120, DistDispFact00Seed151./AISDispFact00Seed151, 0.1:0.1:120, DistDispFact01Seed151./AISDispFact01Seed151, 0.1:0.1:120, DistDispFact02Seed151./AISDispFact02Seed151);
xlabel('Time'); ylabel('Total Distance'); title('DispersionFactor Series - Seed 151 (1/3)'); axis([0 120 0 0.16]);

%Seed151-Distanzen nur 0.3 bis 0.6 (0.3+0.4 gut, 0.5+0.6 kacken ab)
subplot(3,3,5);
plot(0.1:0.1:120, DistDispFact03Seed151./AISDispFact03Seed151, 0.1:0.1:120, DistDispFact04Seed151./AISDispFact04Seed151, 0.1:0.1:120, DistDispFact05Seed151./AISDispFact05Seed151, 0.1:0.1:120, DistDispFact06Seed151./AISDispFact06Seed151);
xlabel('Time'); ylabel('Total Distance'); title('DispersionFactor Series - Seed 151 (2/3)'); axis([0 120 0 0.16]);

%Seed151-Distanzen nur 0.7 bis 1.0 (0.7+0.8 gut, 0.9+1.0 kacken ab)
subplot(3,3,8);
plot(0.1:0.1:120, DistDispFact07Seed151./AISDispFact07Seed151, 0.1:0.1:120, DistDispFact08Seed151./AISDispFact08Seed151, 0.1:0.1:120, DistDispFact09Seed151./AISDispFact09Seed151, 0.1:0.1:120, DistDispFact10Seed151./AISDispFact10Seed151);
xlabel('Time'); ylabel('Total Distance'); title('DispersionFactor Series - Seed 151 (3/3)'); axis([0 120 0 0.16]);

%Seed351-Distanzen nur -0.2 bis 0.2 (alle top!)
subplot(3,3,3);
plot(0.1:0.1:120, DistDispFactM02Seed351./AISDispFactM02Seed351, 0.1:0.1:120, DistDispFactM01Seed351./AISDispFactM01Seed351, 0.1:0.1:120, DistDispFact00Seed351./AISDispFact00Seed351, 0.1:0.1:120, DistDispFact01Seed351./AISDispFact01Seed351, 0.1:0.1:120, DistDispFact02Seed351./AISDispFact02Seed351);
xlabel('Time'); ylabel('Total Distance'); title('DispersionFactor Series - Seed 351 (1/3)'); axis([0 120 0 0.16]);

%Seed351-Distanzen nur 0.3 bis 0.6 (0.3+0.6 gut, 0.4+0.5 kacken ab)
subplot(3,3,6);
plot(0.1:0.1:120, DistDispFact03Seed351./AISDispFact03Seed351, 0.1:0.1:120, DistDispFact04Seed351./AISDispFact04Seed351, 0.1:0.1:120, DistDispFact05Seed351./AISDispFact05Seed351, 0.1:0.1:120, DistDispFact06Seed351./AISDispFact06Seed351);
xlabel('Time'); ylabel('Total Distance'); title('DispersionFactor Series - Seed 351 (2/3)'); axis([0 120 0 0.16]);

%Seed351-Distanzen nur 0.7 bis 1.0 (alle kacken ab)
subplot(3,3,9);
plot(0.1:0.1:120, DistDispFact07Seed351./AISDispFact07Seed351, 0.1:0.1:120, DistDispFact08Seed351./AISDispFact08Seed351, 0.1:0.1:120, DistDispFact09Seed351./AISDispFact09Seed351, 0.1:0.1:120, DistDispFact10Seed351./AISDispFact10Seed351);
xlabel('Time'); ylabel('Total Distance'); title('DispersionFactor Series - Seed 351 (3/3)'); axis([0 120 0 0.16]);
