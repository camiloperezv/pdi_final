function img = removeDots( imgYProc, lastChord )
    mayor = 0;
    % obtener regiones conectadas
    cc = bwconncomp(imgYProc);
    % Obtener informacion de cada region
    stats = regionprops(cc);
    if(length(stats) == 1)
        % Solo hay un objeto en la imagen y se asumira que es la pulga
        img = imgYProc;
        return
    end
    % se recorren todos los objetos de la imagen con el objetivo de
    % encontrar cual es el elemento mas grande de la imagen, el cual se
    % asumira que es la pulga
    for object = 1:length(stats)
        if(stats(object).Area > mayor)
            %if exist('lastChord','var')
                %matDist = [lastChord;stats(object).Centroid];
                %d = pdist(matDist,'euclidean');
                % antes de llamar esta funcion se debe invocar
                % removeFarDots para que no tenga que entrar a este if,
                % pues todos los puntos lejanos ya habran sido borrados
                %if(d>9)
                    % Debido a que el centroide esta a mas de 9 del
                    % este elemento no se debe tener en cuenta como
                    % elemento a cambiar
                %    continue;
                %end
            %end
            % Se asigna el numero como elemento mayor
            mayor = stats(object).Area;
        end
    end
    % restar uno al m ayor para no borrarlo
    mayor = mayor-1;
    % Todos los elementos menores que el elemento mas grande encontrado
    % deben ser borrados
    removeMask = [stats.Area]<mayor;
    imgYProc(cat(1,cc.PixelIdxList{removeMask})) = 0;
    % retorno
    img = imgYProc;
end

