function cord = ProcessX( img )
    %Obtener regiones conectadas y estadisticas de las regiones
    cc = bwconncomp(img);
    stats = regionprops(cc);
    % genera una mascara para borrar todas las areas menores al threshold
    threshold = 5;
    removeMask = [stats.Area]<threshold;
    img(cat(1,cc.PixelIdxList{removeMask})) = 0;
    % de la nueva imagen se extrae el centroide a retornar
    cc = bwconncomp(img);
    stats = regionprops(cc);
    cord = stats.Centroid;
end

