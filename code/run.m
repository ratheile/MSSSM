%   run
%   sim.runMode('normal')

profile off
profile on
clear
clc
defineConstants();
sim = simulation();
sim.init()

mode = input('Which runmode? ','s');
sim.runMode(mode);

ifSave = input('Save output [Y/N]? ','s');

if ifSave == 'Y'
    outName = input('Write data to: ', 's');
    copyfile('defineConstants.m',['sim/' outName '.txt']);
    fileID = fopen(['sim/' outName '.txt'],'a+');
    fprintf(fileID,['\nMode utilized: ' mode]);
    fclose(fileID);
    save(['sim/' outName '.mat']);
    print('-dpng',['sim/' outName '.png']);
    %load(<pfad>)
end
