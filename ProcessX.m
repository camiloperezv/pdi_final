function cord = ProcessX( img )
    cc = bwconncomp(img);
    stats = regionprops(cc);
    threshold = 5;
    removeMask = [stats.Area]<threshold;
    img(cat(1,cc.PixelIdxList{removeMask})) = 0;
    
    cc = bwconncomp(img);
    stats = regionprops(cc);
    cord = stats.Centroid;
end

