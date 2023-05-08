clc
clear variables
close all

player_data =table2cell(readtable('pll-player-stats.csv','ReadVariableNames',false));
player_data(:,3)=[];
[len,~]=size(player_data);
SSDMdex=1;
FOdex=1;
Gdex=1;
Mdex=1;
Adex=1;
LSMdex=1;
Ddex=1;
SSDMdat=num2cell(zeros(22,39));
FOdat=num2cell(zeros(15,39));
Gdat=num2cell(zeros(19,39));
Mdat=num2cell(zeros(52,39));
Adat=num2cell(zeros(48,39));
LSMdat=num2cell(zeros(16,39));
Ddat=num2cell(zeros(40,39));
for i=1:len
    if 1==strcmp('SSDM',player_data(i,3))
        SSDMdat(SSDMdex,:)=player_data(i,:);
        SSDMdex=SSDMdex+1;
    end
    if 1==strcmp('FO',player_data(i,3))
        FOdat(FOdex,:)=player_data(i,:);
        FOdex=FOdex+1;
    end
    if 1==strcmp('G',player_data(i,3))
        Gdat(Gdex,:)=player_data(i,:);
        Gdex=Gdex+1;
    end
    if 1==strcmp('M',player_data(i,3))
        Mdat(Mdex,:)=player_data(i,:);
        Mdex=Mdex+1;
    end
    if 1==strcmp('A',player_data(i,3))
        Adat(Adex,:)=player_data(i,:);
        Adex=Adex+1;
    end
    if 1==strcmp('LSM',player_data(i,3))
        LSMdat(LSMdex,:)=player_data(i,:);
        LSMdex=LSMdex+1;
    end
    if 1==strcmp('D',player_data(i,3))
        Ddat(Ddex,:)=player_data(i,:);
        Ddex=Ddex+1;
    end
end

