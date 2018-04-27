function img = removeBigDots( imgYProc )
    cc = bwconncomp(imgYProc);
    stats = regionprops(cc);
    minor = 100000;
    if(length(stats) == 1)
        img = imgYProc;
        return
    end
    for object = 1:length(stats)
        if(stats(object).Area < minor)
            minor = stats(object).Area;
        end
    end
    minor = minor+1;
    % Todos los elementos mayores que el elemento pequeno
    % deben ser borrados
    removeMask = [stats.Area]>minor;
    imgYProc(cat(1,cc.PixelIdxList{removeMask})) = 0;
    img = imgYProc;
end

