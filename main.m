clear all, close all, clc
video = VideoReader('files/video.wmv');

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
        
    
    % Extraer componente Y de la imagen
    imgY=frame(277:460,188:365,:);
    % Generar imagen binaria de la imagen
    imgYProc = processBinImg(imgY);
    % Usar metodo de distancias si existen centroides
    if(size(yCentroid,1)>0)
        imgYProc = removeFarData(imgYProc,yCentroid(end,:));
    end
    % HAcer una apertura a la imagen con forma de disco de tamaño 1
    imgYProc = morphology(imgYProc,1);
    % borrar ruido de la imagen
    imgYProc = removeDots(imgYProc);


    % Extraer componente Y de la imagen
    imgZ=frame(277:460,397:538,:);
    % Generar imagen binaria de la imagen
    imgZProc = processBinImg(imgZ);
    % Usar metodo de distancias si existen centroides
    if(size(zCentroid,1)>0)
        imgZProc = removeFarData(imgZProc,zCentroid(end,:));
    end
    % HAcer una apertura a la imagen con forma de disco de tamaño 1
    imgZProc = morphology(imgZProc,1);
    % borrar ruido de la imagen
    imgZProc = removeDots(imgZProc);
    
    
    
    %%% COMPONENTE X NO FUNCIONAL AUN %%%
     % Extraer componente X de la imagen
     %imgX=frame(51:171,220:339,:);
     %imgXProc = processBinImg(imgX);
     %imgXProc = imclearborder(imgXProc);
     %figure(2);imshow(imgXProc);impixelinfo;
     %imgXProc = morphology(imgXProc,1);
     %figure(3);imshow(imgXProc);impixelinfo;
    %%% COMPONENTE X NO FUNCIONAL AUN %%%
    
    
    % REFERENCE https://la.mathworks.com/matlabcentral/answers/167108-how-can-i-remove-object-bigger-than-x-pixel

    %%% PROCESS X %%%
    %xCentroid = [xCentroid;ProcessX( imgXProc )];
    %%% PROCESS X %%%
    %      i


    %%% PROCESS Y Encontrar centroide y agregarlo al arreglo de centroides %%%
    yCentroid = [yCentroid;ProcessY( imgYProc )];
    %%% PROCESS Y %%%


    %%% PROCESS Z Encontrar centroide y agregarlo al arreglo de centroides %%%
    zCentroid = [zCentroid;ProcessZ( imgZProc )];
    %%% PROCESS Z %%%
    
   
end
% Extraer la componente de interez de cada arreglo de centroides para hacer
% la grafica tridimencional

%xComponent = xCentroid(:,1);
yComponent = yCentroid(:,1);
zComponent = zCentroid(:,1);
 
% plot3(xComponent,yComponent,zComponent)
%figure(1)

