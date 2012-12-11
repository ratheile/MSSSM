%Part 3 of 3 of "all in one" plots. Data "normalized" (total distance :
%#agents), and coloured (blue=low dispFac ; red=high dispFac). Because the
%colors are "gone through" from red to blue, blue is drawn last and is very
%dominant in the plot -> "blue".

farbMat = [linspace(0,1,13); zeros(1,13); linspace(1,0,13)];
hold on;
plot(0.1:0.1:120, DistDispFact10Seed351./AISDispFact10Seed351, 'Color', farbMat(:,13)');
plot(0.1:0.1:120, DistDispFact10Seed151./AISDispFact10Seed151, 'Color', farbMat(:,13)');
plot(0.1:0.1:120, DistDispFact10Seed51./AISDispFact10Seed51, 'Color', farbMat(:,13)');
plot(0.1:0.1:120, DistDispFact09Seed351./AISDispFact09Seed351, 'Color', farbMat(:,12)');
plot(0.1:0.1:120, DistDispFact09Seed151./AISDispFact09Seed151, 'Color', farbMat(:,12)');
plot(0.1:0.1:120, DistDispFact09Seed51./AISDispFact09Seed51, 'Color', farbMat(:,12)');
plot(0.1:0.1:120, DistDispFact08Seed351./AISDispFact08Seed351, 'Color', farbMat(:,11)');
plot(0.1:0.1:120, DistDispFact08Seed151./AISDispFact08Seed151, 'Color', farbMat(:,11)');
plot(0.1:0.1:120, DistDispFact08Seed51./AISDispFact08Seed51, 'Color', farbMat(:,11)');
plot(0.1:0.1:120, DistDispFact07Seed351./AISDispFact07Seed351, 'Color', farbMat(:,10)');
plot(0.1:0.1:120, DistDispFact07Seed151./AISDispFact07Seed151, 'Color', farbMat(:,10)');
plot(0.1:0.1:120, DistDispFact07Seed51./AISDispFact07Seed51, 'Color', farbMat(:,10)');
plot(0.1:0.1:120, DistDispFact06Seed351./AISDispFact06Seed351, 'Color', farbMat(:,9)');
plot(0.1:0.1:120, DistDispFact06Seed151./AISDispFact06Seed151, 'Color', farbMat(:,9)');
plot(0.1:0.1:120, DistDispFact06Seed51./AISDispFact06Seed51, 'Color', farbMat(:,9)');
plot(0.1:0.1:120, DistDispFact05Seed351./AISDispFact05Seed351, 'Color', farbMat(:,8)');
plot(0.1:0.1:120, DistDispFact05Seed151./AISDispFact05Seed151, 'Color', farbMat(:,8)');
plot(0.1:0.1:120, DistDispFact05Seed51./AISDispFact05Seed51, 'Color', farbMat(:,8)');
plot(0.1:0.1:120, DistDispFact04Seed351./AISDispFact04Seed351, 'Color', farbMat(:,7)');
plot(0.1:0.1:120, DistDispFact04Seed151./AISDispFact04Seed151, 'Color', farbMat(:,7)');
plot(0.1:0.1:120, DistDispFact04Seed51./AISDispFact04Seed51, 'Color', farbMat(:,7)');
plot(0.1:0.1:120, DistDispFact03Seed351./AISDispFact03Seed351, 'Color', farbMat(:,6)');
plot(0.1:0.1:120, DistDispFact03Seed151./AISDispFact03Seed151, 'Color', farbMat(:,6)');
plot(0.1:0.1:120, DistDispFact03Seed51./AISDispFact03Seed51, 'Color', farbMat(:,6)');
plot(0.1:0.1:120, DistDispFact02Seed351./AISDispFact02Seed351, 'Color', farbMat(:,5)');
plot(0.1:0.1:120, DistDispFact02Seed151./AISDispFact02Seed151, 'Color', farbMat(:,5)');
plot(0.1:0.1:120, DistDispFact02Seed51./AISDispFact02Seed51, 'Color', farbMat(:,5)');
plot(0.1:0.1:120, DistDispFact01Seed351./AISDispFact01Seed351, 'Color', farbMat(:,4)');
plot(0.1:0.1:120, DistDispFact01Seed151./AISDispFact01Seed151, 'Color', farbMat(:,4)');
plot(0.1:0.1:120, DistDispFact01Seed51./AISDispFact01Seed51, 'Color', farbMat(:,4)');
plot(0.1:0.1:120, DistDispFact00Seed351./AISDispFact00Seed351, 'Color', farbMat(:,3)');
plot(0.1:0.1:120, DistDispFact00Seed151./AISDispFact00Seed151, 'Color', farbMat(:,3)');
plot(0.1:0.1:120, DistDispFact00Seed51./AISDispFact00Seed51, 'Color', farbMat(:,3)');
plot(0.1:0.1:120, DistDispFactM01Seed351./AISDispFactM01Seed351, 'Color', farbMat(:,2)');
plot(0.1:0.1:120, DistDispFactM01Seed151./AISDispFactM01Seed151, 'Color', farbMat(:,2)');
plot(0.1:0.1:120, DistDispFactM01Seed51./AISDispFactM01Seed51, 'Color', farbMat(:,2)');
plot(0.1:0.1:120, DistDispFactM02Seed351./AISDispFactM02Seed351, 'Color', farbMat(:,1)');
plot(0.1:0.1:120, DistDispFactM02Seed151./AISDispFactM02Seed151, 'Color', farbMat(:,1)');
plot(0.1:0.1:120, DistDispFactM02Seed51./AISDispFactM02Seed51, 'Color', farbMat(:,1)');
hold off;
legend('-0.2','-0.1','0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0','Location','SouthWest'); xlabel('Time'); ylabel('Total Distance'); title('DispersionFactor Series - 3 Seeds');
