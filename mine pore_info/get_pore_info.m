function get_pore_info
    V_allpore_withair = readIs;
    V_majorpore_withair = voxel(V_allpore_withair);
    slice_porosity_distribution(V_allpore_withair,V_majorpore_withair);
    save_xlsx;
end

function V = readIs() 
%load image sequence in V (allpore)
    global address
    global Is_info
    V=false(Is_info.size(1:3));
    for i = 1:Is_info.size(3)
        p = imread([address.binarized_dir, Is_info.namelist{i}, '.bmp']); 
        V(:,:,i)=p;
    end
end

function save_xlsx()
    global pore_data
    global address
    for name = string(fieldnames(pore_data))'
        xlswrite(address.dataxlsx,getfield(pore_data,name),name);
    end
end
