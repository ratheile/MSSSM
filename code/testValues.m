clear all

defineConstants();
global SPEED
figure(1); clf;
draw = drawing2('asdf','asdf','asdf');
%draw.agentArray = [agent(0.25,2.5,2,1.5,2) agent(0.25,2.6,3.2,-1.5,1) agent(0.25,0.3,1,1.3,2) agent(0.25,.4,4,-1.5,2) agent(0.25,3.2,1,1.2,1)];
draw.agentArray = [agent(0.25,0.4,1,1.4,1) agent(0.25,1.5,1,1.5,1) agent(0.25,2.55,1,1.43,1) agent(0.25,3.51,1,1.3,1) agent(0.25,4.4,1,1.5,1) agent(0.25,0.55,4,-1.54,1) agent(0.25,1.52,4,-1.4,1) agent(0.25,2.4,4,-1.5,1) agent(0.25,3.43,4,-1.33,1) agent(0.25,4.5,4,-1.45,1)]; 
draw.plotStep();

%logicFunction(draw.agentArray, 1, 3, [2 1], draw.wallArray)
for i = 1:100
Iteration2(draw.agentArray, draw.wallArray);
draw.plotStep();
pause(SPEED)
end

% agentsArray = draw.agentArray
% wallArray = draw.wallArray
%Zum Spawn: Es sollte IMMER mindestens 1 Agent vorhanden sein


%ag = [agent(0.25,0.4,1,1.4,1) agent(0.25,1.5,1,1.5,1) agent(0.25,2.55,1,1.43,1) agent(0.25,3.51,1,1.3,1) agent(0.25,4.4,1,1.5,1) agent(0.25,0.55,4,-1.54,1) agent(0.25,1.52,4,-1.4,1) agent(0.25,2.4,4,-1.5,1) agent(0.25,3.43,4,-1.33,1) agent(0.25,4.5,4,-1.45,1) agent(0,0,0,0,0) agent(1,1,1,1,0)]; 

