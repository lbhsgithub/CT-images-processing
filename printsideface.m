%ѡ���뿴�������ϵĵ�
%��ӡ����,Ȼ���һ��ͼ�Ϳ���������Ϊλ�ö���
%��ȡ�޲�ǰ����Ƭͼ
function printsideface()
    global address   %�ļ��к��ļ���Ϣ�ṹ��
    global Is_info   %ͼƬ��Ϣ�ṹ��
    p1 = imread([address.raw_images_dir,Is_info.namelist{1},'.jpg']);
    figure('Name','ѡ����Ҫ������ݽ����ϵĵ�','NumberTitle','off');
    imshow(p1);[x,~]=ginput(1);x=floor(x);
    sideface=zeros(Is_info.size(1),Is_info.size(3),'uint8');

    for i = 1 : Is_info.size(3)
        p = imread([address.raw_images_dir,Is_info.namelist{i},'.jpg']);
        sideface(:,i) = p(:,x);
    end

    imshow(sideface);
    imwrite(sideface,[address.No_dir,'sideface.jpg']);  
end

