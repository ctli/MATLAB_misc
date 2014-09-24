clear all
close all
clc
format compact

tic;
wpdfile = 'Wpd80week_sample_2009';

datadir = 'provinces/';
results = 'results/full/';

fast = false;

load(wpdfile);
if not(exist('wpdyr','var'))
    y=0; return;
end
% disp(['Opened ', wpdfile,' successfully']);

if regexpi(wpdfile,'^wpd(.*).mat$')
    version= strtok(wpdfile(4:length(wpdfile)),'.');
else
    version= strtok(wpdfile,'.');
end
version = strcat('Prof',version);
% disp(strcat('Version = ''',version,''''));

hourmin = 0;
hourmax = size(wpdyr,3);
hournum = hourmax-hourmin;
% disp(strcat('Hours:',num2str(hourmin),'-',num2str(hourmax)));

% Read province name
[~,prov,~]=xlsread([datadir 'provinces_ab.xlsx']);

WPDprof = zeros(size(prov,1),hournum);
CFprof = zeros(size(prov,1),hournum);

latmin = 1;
latmax = 1000;%4319;
lonmin = 1;
lonmax = 550;%7359;

lat_range = latmin:latmax;
log_range = lonmin:lonmax;

% Read available area info from all the tif files
tic;
for i=1:size(prov,1)
    disp(prov(i));
    
    WPDtemp = zeros(size(prov,1),hournum);
    CFtemp = zeros(size(prov,1),hournum);
    
    fname = strcat(datadir,prov(i),'.tif');
    A = geotiffread(char(fname));
    
    count = 0;
    
    for lati=latmin:latmax
        x = 1+floor(lati/60);
        for longti=lonmin:lonmax
            y = 1+floor(longti/80);
            if A(4322-lati,longti) == 1
                count = count+1;
                for j = 1:hournum
                    WPDtemp(i,j) = WPDtemp(i,j) + wpdyr(x,y,j);
                    CFtemp(i,j) = CFtemp(i,j) + powerCurveSL1500(wpdyr(x,y,j));
                end
            end
        end
    end
    
    if count==0
        disp('Error: count = 0');
        continue;
    end
    
%     for j=1:hournum
%         WPDtemp(i,j) = WPDtemp(i,j) / count;
%         if (fast)
%             CFtemp(i,j) = powerCurveSL1500(WPDprof(i,j));
%         else
%             CFtemp(i,j) = CFtemp(i,j) / count;
%         end
%     end
%     
%     WPDprof(i,1:hournum) = WPDtemp(i,1:hournum);
%     CFprof(i,1:hournum) = CFtemp(i,1:hournum);
%     toc;
end

save(char(strcat(results,version,'.mat')),'WPDprof', 'CFprof');

y=1;

toc;


