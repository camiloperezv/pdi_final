function img = removeDots( imgYProc, lastChord )
    cc = bwconncomp(imgYProc);
    stats = regionprops(cc);
    mayor = 0;
    if(length(stats) == 1)
        img = imgYProc;
        return
    end
    for object = 1:length(stats)
        if(stats(object).Area > mayor)
            if exist('lastChord','var')
                matDist = [lastChord;stats(object).Centroid];
                d = pdist(matDist,'euclidean');
                if(d>9)
                    % Debido a que el centroide esta a mas de 5 del
                    % este elemento no se debe tener en cuenta como
                    % elemento a cambiar
                    continue;
                end
            end
            mayor = stats(object).Area;
        end
    end
    mayor = mayor-1;
    % Todos los elementos menores que el elemento mas grande encontrado
    % deben ser borrados
    removeMask = [stats.Area]<mayor;
    imgYProc(cat(1,cc.PixelIdxList{removeMask})) = 0;
    img = imgYProc;
end

