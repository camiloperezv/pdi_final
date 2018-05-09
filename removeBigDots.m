function img = removeBigDots( imgYProc )
    minor = 100000;
    % obtener regiones conectadas
    cc = bwconncomp(imgYProc);
    % Obtener informacion de cada region
    stats = regionprops(cc);
    
    if(length(stats) == 1)
        % Solo hay un objeto en la imagen y se asumira que es la pulga
        img = imgYProc;
        return
    end
    % re recorre cada objeto y a la variable minor se asigna el objeto con
    % menor area, el cual sera la pulga
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

