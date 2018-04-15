function cord = ProcessX( imgXProc )
    figure(2);imshow(imgXProc);impixelinfo;
    cc = bwconncomp(imgXProc);
    stats = regionprops(cc);
    threshold = 50;
    removeMask = [stats.Area]>threshold;
    imgXProc(cat(1,cc.PixelIdxList{removeMask})) = 0;
    
    cc = bwconncomp(imgXProc);
    stats = regionprops(cc);
    threshold = 4;
    removeMask = [stats.Area]<threshold;
    imgXProc(cat(1,cc.PixelIdxList{removeMask})) = 0;
    
    figure(3);imshow(imgXProc);impixelinfo;
    
    cord = stats.Centroid;
end

