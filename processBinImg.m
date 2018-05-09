function img = processBinImg( originalImg )
    % imagen a blanco y negro
    img=rgb2gray(originalImg);
    % convertir a imagen binaria
    img = img<180;
    img = logical(img);
end

