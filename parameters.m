function parameters()
%PARAMETERS set all parameters in one function
global Parameters
%% regard pore(equal to sphere with r>0.4) as major pore
% in .\CT-images-processing\pore_data and 3Dimage\voxel.m
min_c=0.4;
Parameters.min_volume = min_c^3*4/3*pi/(0.08565574^2*0.1);
%% critical c for crack
% in .\plot\Plot.m
Parameters.Ccrit = 1;
%% open('\CT-images-processing\2ize and repair\shape_filter.m')
end

