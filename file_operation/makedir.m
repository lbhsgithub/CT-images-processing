function dir = makedir(name)
%��address�е�dir�����Ҫ�������ļ���
    global address
    dir = [address.processeddir,name,'\'];
    if ~exist(dir,'dir')
        mkdir(dir);
    end
end