function slice_porosity_distribution(V,Sair)
    %% create output folders
    global address
    %% initialize
    global Is_info
    S = Is_info.size(1)*Is_info.size(2);
    A_porosity = zeros(Is_info.size(3),1);
    M_porosity = A_porosity;
    A_distribution = [];
    M_distribution = [];
    %% get porosity and pore distribution
    for i = 1 : Is_info.size(3)
        S_no_air=S-Sair(i);
        %major pore
        pA = V{1}(:,:,i);
        [A_porosity(i),list] = cut_record(pA, S_no_air, address.all_pore_dir, Is_info.namelist{i});
        A_distribution(i,1:length(list)) = list;
        %all pore
        pM = V{2}(:,:,i);
        [M_porosity(i),list] = cut_record(pM, S_no_air, address.major_pore_dir, Is_info.namelist{i});
        M_distribution(i,1:length(list)) = list;
    end
    %% save result
    % aviod 0 in result
    A_distribution(A_distribution==0) = NaN;
    M_distribution(M_distribution==0) = NaN; 
    % save
    global pore_data
    pore_data.all_pore = [A_porosity, A_distribution]; 
    pore_data.major_pore = [M_porosity, M_distribution];
end
%length(numPixels)的方法不错，不然会报错 ：是默认继承上一个的end，但是指定长度也可以扩充