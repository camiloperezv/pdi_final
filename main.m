clear all, close all, clc
video = VideoReader('files/video.wmv');

xCentroid = [];
yCentroid = [];
zCentroid = [];

% for DEBUG ONLY
nFrames = 1146;
init = 1;

% init = 1;
% nFrames = get(video, 'NumberOfFrames');
for i=init:500

    frame=read(video,i);
    %frameN=read(video,i+1);
%     imgX=frame(51:171,220:339,:);
%     figure(1);imshow(imgX);impixelinfo;
%     imgXProc = processBinImg(imgX);
%     imgXProc = imclearborder(imgXProc);
%     figure(2);imshow(imgXProc);impixelinfo;
%     imgXProc = morphology(imgXProc,1);
%     figure(3);imshow(imgXProc);impixelinfo;

    
    imgY=frame(277:460,188:365,:);
    imgYProc = processBinImg(imgY);
%     figure(2);imshow(imgYProc);impixelinfo;
    if(size(yCentroid,1)>0)
        imgYProc = removeFarData(imgYProc,yCentroid(end,:));
    end
%     figure(3);imshow(imgYProc);impixelinfo;
    imgYProc = morphology(imgYProc,1);
     
    imgYProc = removeDots(imgYProc);
%     figure(5);imshow(imgYProc);impixelinfo;



    imgZ=frame(277:460,397:538,:);
    imgZProc = processBinImg(imgZ);
    if(size(zCentroid,1)>0)
        imgZProc = removeFarData(imgZProc,zCentroid(end,:));
    end
    imgZProc = morphology(imgZProc,1);
    imgZProc = removeDots(imgZProc);
    
    
    % REFERENCE https://la.mathworks.com/matlabcentral/answers/167108-how-can-i-remove-object-bigger-than-x-pixel

    %%% PROCESS X %%%
    %xCentroid = [xCentroid;ProcessX( imgXProc )];
    %%% PROCESS X %%%
    %      i


    %%% PROCESS Y %%%
    yCentroid = [yCentroid;ProcessY( imgYProc )];
    %%% PROCESS Y %%%


    %%% PROCESS Z %%%
    zCentroid = [zCentroid;ProcessZ( imgZProc )];
    %%% PROCESS Z %%%
    
   
end
%xComponent = xCentroid(:,1);
yComponent = yCentroid(:,1);
zComponent = zCentroid(:,1);
% xComponent = yComponent;
% 
% plot3(xComponent,yComponent,zComponent)
%figure(1)

