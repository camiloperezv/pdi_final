function img = processBinImg( originalImg, margin )
    % imagen a blanco y negro
    img=rgb2gray(originalImg);
    % convertir a imagen binaria
    img = img<margin;
    img = logical(img);
end

