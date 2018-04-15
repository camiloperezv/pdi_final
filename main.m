clear all, close all, clc
video = VideoReader('files/video.wmv');
nFrames = get(video, 'NumberOfFrames');


for i=1:1
    frame=read(video,1);
    figure(1);imshow(frame);impixelinfo;
    
    imgX=frame(51:171,220:339,:);
    imgY=frame(277:455,188:365,:);
    imgZ=frame(277:455,397:538,:);
    
    imgXProc = processImg(imgX);
    imgYProc = processImg(imgY);
    imgZProc = processImg(imgZ);
    % REFERENCE https://la.mathworks.com/matlabcentral/answers/167108-how-can-i-remove-object-bigger-than-x-pixel
    
    %%% PROCESS X %%%
    xCentroid = ProcessX( imgXProc );
    %%% PROCESS X %%%
    
    
    
    %%% PROCESS Y %%%
    yCentroid = ProcessY( imgYProc );
    %%% PROCESS Y %%%
    
    
    %%% PROCESS Z %%%
    zCentroid = ProcessZ( imgZProc );
    %%% PROCESS Z %%%
    
    
end