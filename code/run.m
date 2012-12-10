
%Run.m is a runscript for our project. It cleans up the workspace first
%and then reinitialises a new copy of the simulation.m environment.
%This copy can be accessed trough the sim variable. See the documentation
%about the simulation.m to find out which modes are supported.

%Example run:

%run

%Which runmode?
%Input: normal / fasttest ... [optional parameters]
%Save output [Y/N]? Y
%Write data to: 
%Input: [file]

%The programm should respond after this with some details about the
%simulation:

%Running normal mode:

%And some time about the Simulation time:

%Actual time on system: 15 h 39 min 4.424000e+00 sec
%Time elapsed: 12 Seconds 

%Note: The time elapsed can vary with the perfomance of the host system!

%After the simulation a "profile view" opens the profiler data to measure
%the perfomance of the code, and the measurement results are available
%trough different matrices inside of the sim object.
%They can be used with a simle sim.[matrice] command.

profile off
profile on
clear
clc
defineConstants();
sim = simulation();
sim.init()

mode = input('Which runmode? ','s');
ifSave = input('Save output [Y/N]? ','s');
if ifSave == 'Y'
    outName = input('Write data to: ', 's');
    copyfile('defineConstants.m',['sim/' outName '.txt']);
    fileID = fopen(['sim/' outName '.txt'],'a+');
    fprintf(fileID,['\nMode utilized: ' mode]);
    fclose(fileID);
end

sim.runMode(mode);

if ifSave == 'Y'
    save(['sim/' outName '.mat']);
    sim.draw.plotStep();
    print('-dpng',['sim/' outName '.png']);
    %load(<pfad>)
end
