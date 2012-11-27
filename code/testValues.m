clear all

defineConstants();
figure(1); clf;
draw = drawing('asdf','asdf','asdf');
draw.agentArray = [agent(0.25,2.5,2,1.5,2) agent(0.25,2.6,3.2,-1.5,1) agent(0.25,0.3,1,1.3,3) agent(0.25,.4,4,-1.5,4)];
draw.plotStep();

%logicFunction(draw.agentArray, 1, 3, [2 1], draw.wallArray)
for i = 1:20
Iteration(draw.agentArray, draw.wallArray);
draw.plotStep();
pause
end
