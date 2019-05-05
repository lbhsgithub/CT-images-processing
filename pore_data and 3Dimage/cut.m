function O=cut(V,Sair)
    %% create folders
    dirA = makedir('allpore');
    dirM = makedir('majorpore');
    %% initialize
    global Is_info
    S=Is_info.size(1)*Is_info.size(2);
    kpa=zeros(Is_info.size(3),1);kpm=kpa;
    kda=[];kdm=kda;
    %% get porosity and pore distribution
    for i = 1 : Is_info.size(3)
        S_=S-Sair(i);
        %major pore
        pa = V{1}(:,:,i);
        [kpa(i),list]=cut_record(pa,S_,dirA,Is_info.namelist{i});
        kda(i,1:length(list))=list;
        %all pore
        pm = V{2}(:,:,i);
        [kpm(i),list]=cut_record(pm,S_,dirM,Is_info.namelist{i});
        kdm(i,1:length(list))=list;
    end
    %% save result
    global output
    O=cell(1,2);
    kda(kda==0)=NaN;kdm(kdm==0)=NaN; %aviod 0 in result
    output.all_pore=[kpa,kda];%storage of all pore data
    output.major_pore=[kpm,kdm];%storage of major pore data
end
%length(numPixels)的方法不错，不然会报错 ：是默认继承上一个的end，但是指定长度也可以扩充