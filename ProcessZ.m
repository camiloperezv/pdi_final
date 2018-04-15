function cord = ProcessZ( imgZProc )
    figure(6);imshow(imgZProc);impixelinfo;
    cc = bwconncomp(imgZProc);
    stats = regionprops(cc);
    threshold = 50;
    removeMask = [stats.Area]<threshold;
    imgZProc(cat(1,cc.PixelIdxList{removeMask})) = 0;
    cc = bwconncomp(imgZProc);
    stats = regionprops(cc);
    threshold = 55;
    removeMask = [stats.Area]<threshold;
    imgZProc(cat(1,cc.PixelIdxList{removeMask})) = 0;
    figure(7);imshow(imgZProc);impixelinfo;
    cord = stats.Centroid;
end

