
clear
load('Imagery.mat');
%spreadsheet has a lot of data.  Below is the key for the columns
% 1Subject	2block	3trial	4correct words	5actual response	6#substitutions
%7substituted words	8substitute list	9mistake in previous list?	10learning list #
% 11interference type	12RT	13mismatch Word	14mismatch kind	15mismatch new word
% 16mismatch seenit	17mismatch testlist	18 mismatch accuracy
% 19 task switch  20 same finger  21 index finger  22 left/right
% 23 target/probe on same side? 24 targets from left or right 25 probe from
% left or right 26 target was face or scene 27 probe was face or scene

file1 = 'Subject2fMRI.xlsx';
data1 = xlsread(file1);
data1 = data1(1:60, :);
rt1 = data1(:, 13);
lrt1 = log(rt1);
zlrt1= (lrt1 - nanmean(lrt1))/nanstd(lrt1);

file2 = 'Subject3fMRI.xlsx';
data2 = xlsread(file2);
data2 = data2(1:60, :);
rt2 = data2(:, 13);
lrt2 = log(rt2);
zlrt2= (lrt2 - nanmean(lrt2))/nanstd(lrt2);

file3 = 'Subject5fMRI.xlsx';
data3 = xlsread(file3);
data3 = data3(1:60, :);
rt3 = data3(:, 13);
lrt3 = log(rt3);
zlrt3= (lrt3 - nanmean(lrt3))/nanstd(lrt3);

file4 = 'Subject6fMRI.xlsx';
data4 = xlsread(file4);
data4 = data4(1:60, :);
rt4 = data4(:, 13);
lrt4 = log(rt4);
zlrt4= (lrt4 - nanmean(lrt4))/nanstd(lrt4);

file5 = 'Subject7fMRI.xlsx';
data5 = xlsread(file5);
data5 = data5(1:60, :);
rt5 = data5(:, 13);
lrt5 = log(rt5);
zlrt5= (lrt5 - nanmean(lrt5))/nanstd(lrt5);

file6 = 'Subject9fMRI.xlsx';
data6 = xlsread(file6);
data6 = data6(1:60, :);
rt6 = data6(:, 13);
lrt6 = log(rt6);
zlrt6= (lrt6 - nanmean(lrt6))/nanstd(lrt6);

file7 = 'Subject10fMRI.xlsx';
data7 = xlsread(file7);
data7 = data7(1:60, :);
rt7 = data7(:, 13);
lrt7 = log(rt7);
zlrt7= (lrt7 - nanmean(lrt7))/nanstd(lrt7);



%full set
data = vertcat(data1, data2, data3, data4, data5, data6, data7);
rt = vertcat(rt1, rt2, rt3, rt4, rt5, rt6, rt7);
lrt =vertcat(lrt1, lrt2, lrt3, lrt4, lrt5, lrt6, lrt7);
zlrt = vertcat(zlrt1, zlrt2, zlrt3, zlrt4, zlrt5, zlrt6, zlrt7);

datacell = {data1, data2, data3, data4, data5, data6, data7};

for i = 1:7
    zlrtcell{i} = zlrt((i*60)-59: i*60);
end


for i = 1:7
    rtcell{i} = rt((i*60)-59: i*60);
end

load('FourWaySubject2parsedData.mat')
load('FourWaySubject3parsedData.mat')
load('FourWaySubject5parsedData.mat')
load('FourWaySubject6parsedData.mat')
load('FourWaySubject7parsedData.mat')
load('FourWaySubject9parsedData.mat')
load('FourWaySubject10parsedData.mat')

parsedDataCell = {FourWaySubject2parsedData, FourWaySubject3parsedData,...
    FourWaySubject5parsedData, FourWaySubject6parsedData,...
    FourWaySubject7parsedData, FourWaySubject9parsedData,...
    FourWaySubject10parsedData};

for subject = 1:7
        for block = 1:5
              for parsetrial = 1:12
                       ZL(subject, (block-1)*12+parsetrial) =...
                                    parsedDataCell{subject}(block, parsetrial).sameEvidence-...
                                    parsedDataCell{subject}(block, parsetrial).otherEvidence;
                    end
                end
end

%ZLRTMulti = NaN(32,2,60);
for subject = 1:7
    % for each subject, we want RT + #words just for same bucket trials
    ZLRTMulti(subject,:, 1) = NaN(1, 60);
    ZLRTMulti(subject,:, 2) = NaN(1, 60);
    for trial = 1:60
        if datacell{1, subject}(trial, 15) > -1%used to be same bucket trial, now making it any trial
%             ZLRTMulti(subject, trial, 2) = zlrtcell{subject}(trial);
            context = datacell{1, subject}(trial, 11);
            ZLRTMulti(subject, trial, 1) = Imagery(subject, context+1);
            ZLRTMulti(subject, trial, 2) = ZL(subject,trial); 
        end
    end
end

for subject = 1:7
    figure(2)
    hold on
    scatter(ZLRTMulti(subject, :, 1), ZLRTMulti(subject, :, 2));
end

xlabel('imagery per targets per trial')
ylabel('zscored rt per trial')
title('all trials all subjects')

   




[pAllBuckets rawEffects subjSamples opts] = ghootstrap(ZLRTMulti, 'verbose', true);








for subject = 1:7
        % for each subject, we want RT + #words just for same bucket trials
        ZLRTSameMulti(subject,:, 1) = NaN(1, 60);
        ZLRTSameMulti(subject,:, 2) = NaN(1, 60);
        for trial = 1:60
        if datacell{1, subject}(trial, 15) == 3%same bucket trial
            context = datacell{1, subject}(trial, 11);
            ZLRTSameMulti(subject, trial, 1) = Imagery(subject, context+1);
            ZLRTSameMulti(subject, trial, 2) = ZL(subject,trial); 
%             
%         ZLRTSameMulti(subject, trial, 2) = zlrtcell{subject}(trial);
%         end
%         for block = 1:5
%             for parsetrial = 1:12
%                         ZLRTSameMulti(subject, trial, 1) =...
%                             parsedDataCell{subject}(block, parsetrial).sameEvidence-...
%                             parsedDataCell{subject}(block, parsetrial).otherEvidence;;
%             end
         end
        end
end

[pDifferentBucket rawEffects subjSamples opts] = ghootstrap(ZLRTSameMulti);

for subject = 1:7
    figure(3)
    hold on
    scatter(ZLRTSameMulti(subject, :, 1), ZLRTSameMulti(subject, :, 2));
end

xlabel('imagery per targets per trial')
ylabel('zscored rt per trial')
title('same bucket trials all subjects')
%
% for subject = 1:7
%         % for each subject, we want RT + #words just for same bucket trials
%         ZLRTMulti(subject,:, 1) = NaN(1, 60);
%         ZLRTMulti(subject,:, 2) = NaN(1, 60);
%         for trial = 1:60
%         if datacell{1, subject}(trial, 15) == 3%same bucket trial
%         ZLRTMulti(subject, trial, 2) = zlrtcell{subject}(trial);
%         end
%         for block = 1:5
%             for parsetrial = 1:12
%                         ZLRTMulti(subject, trial, 1) =...
%                             parsedDataCell{subject}(block, parsetrial).sameEvidence-...
%                             parsedDataCell{subject}(block, parsetrial).otherEvidence;;
%             end
%         end
%         end
% end
%
% [pDifferentBucket rawEffects subjSamples opts] = ghootstrap(ZLRTMulti);