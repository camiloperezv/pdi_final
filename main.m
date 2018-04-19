clear all, close all, clc
video = VideoReader('files/video.wmv');

xCentroid = [];
yCentroid = [];
zCentroid = [];

% for DEBUG ONLY
% nFrames = 1146;
% init = nFrames;

init = 1;
nFrames = get(video, 'NumberOfFrames');
for i=init:nFrames

     frame=read(video,i);
%     frame=read(video,1);
%      figure(1);imshow(frame);impixelinfo;
    
%     imgX=frame(51:171,220:339,:);
%     figure(2);imshow(imgX);impixelinfo;
%     imgXProc = processBinImg(imgX);
%     figure(3);imshow(imgXProc);impixelinfo;
%     imgXProc = morphology(imgXProc,1);
%     figure(4);imshow(imgXProc);impixelinfo;
%     
     imgY=frame(277:460,188:365,:);
     imgYProc = processBinImg(imgY);
     imgYProc = morphology(imgYProc,1);
%      figure(4);imshow(imgYProc);impixelinfo;
   
     imgZ=frame(277:460,397:538,:);
     imgZProc = processBinImg(imgZ);
     imgZProc = morphology(imgZProc,1);

     % REFERENCE https://la.mathworks.com/matlabcentral/answers/167108-how-can-i-remove-object-bigger-than-x-pixel
    
    %%% PROCESS X %%%
%     xCentroid = [xCentroid;ProcessX( imgXProc )];
    %%% PROCESS X %%%
%     i
    
    
    %%% PROCESS Y %%%
    yCentroid = [yCentroid;ProcessY( imgYProc )];
    %%% PROCESS Y %%%
    
    
    %%% PROCESS Z %%%
    zCentroid = [zCentroid;ProcessZ( imgZProc )];
    %%% PROCESS Z %%%
    
    
end
figure(1)
plot(yCentroid(:,1),yCentroid(:,2))
figure(2)
plot(zCentroid(:,1),zCentroid(:,2))
