function [player_data] =pos_check(p2c,pdat)
if 1==strcmp(p2c,pdat)
    player_data=pdat;
else
player_data=[];
end
end