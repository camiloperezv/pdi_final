function cord = ProcessY( imgYProc )
    figure(4);imshow(imgYProc);impixelinfo;
    cc = bwconncomp(imgYProc);
    stats = regionprops(cc);
    threshold = 100;
    removeMask = [stats.Area]<threshold;
    imgYProc(cat(1,cc.PixelIdxList{removeMask})) = 0;
    figure(5);imshow(imgYProc);impixelinfo;
    cord = stats.Centroid;
end

