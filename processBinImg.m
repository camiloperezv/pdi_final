function img = processBinImg( originalImg )
    %figure(2);imshow(originalImg);impixelinfo;
    %imagen a blanco y negro
    img=rgb2gray(originalImg);
    % convertir a imagen binaria
    img = img<180;
    img = logical(img);
    %figure(3);imshow(img);impixelinfo;
end

