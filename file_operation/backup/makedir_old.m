function MD()
%��address�е�dir�����Ҫ�������ļ���
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