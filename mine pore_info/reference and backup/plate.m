%（现在没有接触边缘的问题就不加盖板了，要加和去可以单独起一个readIs）
%return 加好了盖板的三维矩阵（注意图片数量前后各+1了）
% %初始化3维矩阵
% V=false(Is_info.size(1),Is_info.size(2),Is_info.size(3)+2);
% %创建白边黑板,还可以用padarray
% slab=true(Is_info.size(1),Is_info.size(2));
% slab(11:Is_info.size(1)-10,11:Is_info.size(2)-10)=false;
% %盖上白边黑板
% V(:,:,1)=slab;
% V(:,:,Is_info.size(3)+2)=slab;
