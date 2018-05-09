function cord = ProcessZ( img )
    % Obtener regiones conectadas y estadisticas de las regiones
    cc = bwconncomp(img);
    stats = regionprops(cc);
    % genera una mascara para borrar todas las areas menores al threshold
    threshold = 5;
    removeMask = [stats.Area]<threshold;
    img(cat(1,cc.PixelIdxList{removeMask})) = 0;
    cc = bwconncomp(img);
    % de la nueva imagen se extrae el centroide a retornar
    stats = regionprops(cc);
    if(~isempty(stats) )
        cord = stats.Centroid;
    else
        cord = [0,0];
    end
    
end

