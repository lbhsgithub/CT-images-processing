function slice_porosity_distribution(V_allpore_withair,V_majorpore_withair)
    %% initialize
    global address
    global Is_info
    S = prod(Is_info.size(1:2));
    A_porosity = zeros(Is_info.size(3),1);
    M_porosity = A_porosity;
    A_distribution = [];
    M_distribution = [];
    %% get porosity and pore distribution
    for i = 1 : Is_info.size(3)
        %major pore
        pA = V_allpore_withair(:,:,i);
        [A_porosity(i),porelist] = eliminateAIR_saveI(pA, S, address.all_pore_dir, Is_info.namelist{i});
        A_distribution(i,1:length(porelist)) = porelist;
        %all pore
        pM = V_majorpore_withair(:,:,i);
        [M_porosity(i),porelist] = eliminateAIR_saveI(pM, S, address.major_pore_dir, Is_info.namelist{i});
        M_distribution(i,1:length(porelist)) = porelist;
    end
    %% save result
    % aviod 0 in result
    A_distribution(A_distribution==0) = NaN;
    M_distribution(M_distribution==0) = NaN; 
    % record
    global pore_data
    pore_data.all_pore = [A_porosity, A_distribution]; 
    pore_data.major_pore = [M_porosity, M_distribution];
end
%length(numPixels)的方法不错，不然会报错 ：默认继承上一个的end，但是指定长度也可以扩充