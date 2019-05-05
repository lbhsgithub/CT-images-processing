function MD()
%用address中的dir来标记要创建的文件夹
    global address
    for str=string(fieldnames(address))'
        if contains(str,'dir')
            dir=(eval(['address.',char(str)]));
            if ~exist(dir,'dir')
                mkdir(dir);
            end
        end
    end
end