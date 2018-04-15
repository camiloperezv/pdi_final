function img = processImg( originalImg )
    img=rgb2gray(originalImg);
    img = img<180;
    img = logical(img);
end

