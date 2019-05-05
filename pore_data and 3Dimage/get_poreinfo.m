function get_poreinfo
    Va=readIs;%(fixed)
    [V,Sair]=voxel(Va);
    cut(V,Sair);
    out;%(fixed)
end

function V=readIs() 
%load image sequences only once here,<1min
    global address
    global Is_info
    V=false(Is_info.size(1:3));
    for i = 1:Is_info.size(3)
        bagfile = [address.binarydir,Is_info.namelist{i},'.bmp'];
        p = imread(bagfile); 
        V(:,:,i)=p;
    end
end

function out()
    global output
    output_(output.max_section,'MPmaxSection');
    output_(output.Voxelslist','3Ddistribution');
    output_(output.all_pore,'all_pore');
    output_(output.major_pore,'major_pore');
end

function output_(list,name)
    global address
    if ~isempty(list)
        xlswrite(address.dataxlsx,list,name);
    end
end
