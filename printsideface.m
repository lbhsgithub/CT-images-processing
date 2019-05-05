%选择想看到的面上的点
%打印侧面,然后抠一下图就可以拿来作为位置对照
%读取修补前的切片图
function printsideface()
    global address   %文件夹和文件信息结构体
    global Is_info   %图片信息结构体
    p1 = imread([address.oridir,Is_info.namelist{1},'.jpg']);
    figure('Name','选择需要输出的纵截面上的点','NumberTitle','off');
    imshow(p1);[x,~]=ginput(1);x=floor(x);
    sideface=zeros(Is_info.size(1),Is_info.size(3),'uint8');

    for i = 1 : Is_info.size(3)
        p = imread([address.oridir,Is_info.namelist{i},'.jpg']);
        sideface(:,i) = p(:,x);
    end

    imshow(sideface);
    imwrite(sideface,[address.Nodir,'sideface.jpg']);  
end

