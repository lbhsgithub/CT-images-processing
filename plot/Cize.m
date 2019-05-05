function list = Cize(list,type)
pixel=0.08565574^2;
voxel=pixel*0.1;
if type==2
    list=(list*pixel/pi).^(1/2);
end
if type==3
    list=(list*voxel/pi*0.75).^(1/3);
end
end

