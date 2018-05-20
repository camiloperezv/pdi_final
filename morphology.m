function img = morphology( img, size )
    % hacer erocion y dilatacion
    SE = strel('disk',size);
    img = imopen(img, SE);
    % filtrar bordes de la imagen para borrarlos
    %img = imclearborder(img);
end

