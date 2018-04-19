function cord = ProcessZ( img )
    cc = bwconncomp(img);
    stats = regionprops(cc);
    threshold = 5;
    removeMask = [stats.Area]<threshold;
    img(cat(1,cc.PixelIdxList{removeMask})) = 0;
%     figure(5);imshow(img);impixelinfo;
    cc = bwconncomp(img);
    stats = regionprops(cc);
    if(~isempty(stats) )
        cord = stats.Centroid;
    else
        cord = [0,0];
    end
    
end

