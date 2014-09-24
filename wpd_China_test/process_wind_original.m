%   wpd2cfpar.m
%       Parallel version
%		Function to convert full grid cell WPD data to WPD, CFs by province
%       Argument = filename of output from wpdyr_extract.m
%           	Array 'wpdyr' in 'Wpd',s,'yr_',yr_s,'.mat'
%                           e.g. Wpd80yr_2009.mat
%       Exports two variables 'WPDprof', 'CFprof' to:
%           results/full/Prof(s)yr_(yr).mat

tic;
wpdfile = 'Wpd80week_sample_2009';

datadir = 'provinces/';
results = 'results/full/';

fast = false;

%	Open wpd file
load(wpdfile);
if not(exist('wpdyr','var'))
    y=0; return;
end
disp(strcat('Opened  ',wpdfile,' successfully'));

if regexpi(wpdfile,'^wpd(.*).mat$')
    version= strtok(wpdfile(4:length(wpdfile)),'.');
else
    version= strtok(wpdfile,'.');
end
version = strcat('Prof',version);
disp(strcat('Version = ''',version,''''));


hourmin = 0;
hourmax = size(wpdyr,3);
hournum = hourmax-hourmin;
disp(strcat('Hours:',num2str(hourmin),'-',num2str(hourmax)));

% Read province name
[~,prov,~]=xlsread([datadir 'provinces_ab.xlsx']);

WPDprof=zeros(size(prov,1),hournum);
CFprof=zeros(size(prov,1),hournum);

latmin = 2800%1;
latmax = 3000;%4319;
lonmin = 2750;%1;
lonmax = 3000;%7359;

% Read available area info from all the tif files
for i=1%:size(prov,1)
    disp(prov(i));
    
    WPDtemp = zeros(size(prov,1),hournum);
    CFtemp = zeros(size(prov,1),hournum);
    
    fname = strcat(datadir,prov(i),'.tif');
    [A,~] = geotiffread(char(fname));
    
    count = 0;
    
    for lati=latmin:latmax
        for longti=lonmin:lonmax
            if A(4322-lati,longti)==1
                count=count+1;
                for j=1:hournum
                    WPDtemp(i,j) = WPDtemp(i,j) + wpdyr(1+floor(lati/60),1+floor(longti/80),hourmin+j);
%                     CFtemp(i,j) = CFtemp(i,j) + powerCurveSL1500(wpdyr(1+floor(lati/60),1+floor(longti/80),hourmin+j));
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
    
end

save(char(strcat(results,version,'.mat')),'WPDprof', 'CFprof');

y=1;

toc;

