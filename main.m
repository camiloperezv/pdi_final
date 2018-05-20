clear all, close all, clc
video = VideoReader('files/Video22.wmv');

% Declaracion de arreglos que contendran los centroides de la pulga
xCentroid = [];
yCentroid = [];
zCentroid = [];

%Obtener numero de frames del video
init = 1;
nFrames = get(video, 'NumberOfFrames');

% Recorrer frame a frame
for i=init:nFrames
    % Obtener framedel video
    frame=read(video,i);
    
    %figure(2);imshow(frame);impixelinfo;title(i);
    % Extraer componente X de la imagen
    imgX=frame(74:184,207:324,:);
    %figure(1);imshow(imgX);impixelinfo;title(i);
    imgXProc = processBinImg(imgX,190);
    imgXProc = imclearborder(imgXProc);
    % Usar metodo de distancias si existen centroides
    if(size(xCentroid,1)>0)
        imgXProc = removeFarData(imgXProc,xCentroid(end,:));
    end   
    % Hacer una apertura a la imagen con forma de disco de tamaño 1
    %imgXProc = morphology(imgXProc,1);    
    % borrar ruido de la imagen
    imgXProc = removeDots(imgXProc);
    %figure(4);imshow(imgXProc);impixelinfo;title(i);
    if(size(xCentroid,1)>0)
        xCentroid = [xCentroid;ProcessX( imgXProc, xCentroid(end,:) )]; 
    else
        xCentroid = [xCentroid;ProcessX( imgXProc,[0,0] )];
    end
    %%% COMPONENTE X NO FUNCIONAL AUN %%%
    
    
    % Extraer componente Y de la imagen
    %imgY=frame(277:460,188:365,:);
    imgY=frame(277:455,190:345,:);
    %figure(1);imshow(imgY);impixelinfo;title(i);
    % Generar imagen binaria de la imagen
    imgYProc = processBinImg(imgY,180);
    % Usar metodo de distancias si existen centroides
    if(size(yCentroid,1)>0)
        imgYProc = removeFarData(imgYProc,yCentroid(end,:));
    end
    % HAcer una apertura a la imagen con forma de disco de tamaño 1
    imgYProc = morphology(imgYProc,3);
    
    % borrar ruido de la imagen
    imgYProc = removeDots(imgYProc);
    %figure(2);imshow(imgYProc);impixelinfo;title(i);
    if(size(yCentroid,1)>0)
        yCentroid = [yCentroid;ProcessY( imgYProc, yCentroid(end,:) )];
    else
        yCentroid = [yCentroid;ProcessY( imgYProc,[0,0] )];
    end

    
    % Extraer componente Z de la imagen
    %imgY=frame(277:460,188:365,:);
    imgZ=frame(277:455,417:551,:);
    %figure(1);imshow(imgZ);impixelinfo;title(i);
    % Generar imagen binaria de la imagen
    imgZProc = processBinImg(imgZ,180);
    %figure(2);imshow(imgZProc);impixelinfo;title(i);
    % Usar metodo de distancias si existen centroides
    if(size(zCentroid,1)>0)
        imgZProc = removeFarData(imgZProc,zCentroid(end,:));
    end
    % HAcer una apertura a la imagen con forma de disco de tamaño 1
    imgZProc = morphology(imgZProc,3);
    %figure(3);imshow(imgZProc);impixelinfo;title(i);
    % borrar ruido de la imagen
    imgZProc = removeDots(imgZProc);
    %figure(4);imshow(imgZProc);impixelinfo;title(i);
    if(size(zCentroid,1)>0)
        zCentroid = [zCentroid;ProcessZ( imgZProc, zCentroid(end,:) )];
    else
        zCentroid = [zCentroid;ProcessZ( imgZProc,[0,0] )];
    end

end
% Extraer la componente de interez de cada arreglo de centroides para hacer
% la grafica tridimencional

xComponent = xCentroid(:,2);
yComponent = yCentroid(:,1);
zComponent = zCentroid(:,2);
% valores de referencia para simular que cada plano inicia en 0 y poder
% comparar los valores de los 3 centroides, de no ser asi, no coincidirian 
xComponent = xComponent-74;
yComponent = yComponent-190;
zComponent = zComponent-277;
figure(1);
plot3(xComponent,yComponent,zComponent)

