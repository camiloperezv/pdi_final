function img = morphology( img, size )
    % hacer erocion y dilatacion
    SE = strel('disk',size);
    img = imopen(img, SE);
    %figure(5);imshow(img);impixelinfo;
    
    %filtrar bordes de la imagen para borrarlos
    img = imclearborder(img);
    %figure(4);imshow(img);impixelinfo;

end

