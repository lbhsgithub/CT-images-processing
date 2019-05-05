function dir = makedir(name)
%用address中的dir来标记要创建的文件夹
    global address
    dir = [address.processeddir,name,'\'];
    if ~exist(dir,'dir')
        mkdir(dir);
    end
end