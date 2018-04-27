function newImg = removeFarData( img, lastChord )
    cc = bwconncomp(img);
    stats = regionprops(cc);
    for object = 1:length(stats)
        matDist = [lastChord;stats(object).Centroid];
        distance = pdist(matDist,'euclidean');
        if(distance>30)
            from1 = round(stats(object).BoundingBox(2));
            to1 = round(stats(object).BoundingBox(2) + stats(object).BoundingBox(4));
            
            from2 = round(stats(object).BoundingBox(1));
            to2 = round(stats(object).BoundingBox(1) + stats(object).BoundingBox(3));
            
            img(from1:to1,from2:to2)=0;
        end
    end
    newImg = img;
end

