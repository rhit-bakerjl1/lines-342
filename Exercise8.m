clc
clear variables
close all

player_data =table2cell(readtable('pll-player-stats.csv','ReadVariableNames',false));
player_data(:,end+1)=num2cell(2021);
temp_dat=table2cell(readtable('pllplayerstats2020.csv','ReadVariableNames',false));
temp_dat(:,end+1)=num2cell(2020);
player_data=[player_data;temp_dat];
temp_dat=table2cell(readtable('pllplayerstats2019.csv','ReadVariableNames',false));
temp_dat(:,end+1)=num2cell(2019);
player_data=[player_data;temp_dat];
player_data(:,3)=[];
[len,~]=size(player_data);
SSDMdex=1;
FOdex=1;
Gdex=1;
Mdex=1;
Adex=1;
LSMdex=1;
Ddex=1;
for i=1:len
    if cell2mat(player_data(i,4))~=0
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
end
for i=1:(Mdex-1)
    if 1==strcmp('Schreiber',Mdat(i,2)) && cell2mat(Mdat(i,40))~=2021
        Mdat(i,41)=num2cell(1);
    elseif 1==strcmp('Currier',Mdat(i,2)) && cell2mat(Mdat(i,40))==2021
        Mdat(i,41)=num2cell(1);
    else
        Mdat(i,41)=num2cell(0);
    end
end
