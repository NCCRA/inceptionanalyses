
%%

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
    
        
 
    for subject = 1:7
           noISame = 1; loISame = 1; hiISame = 1; medISame = 1;
    noIDiff = 1; loIDiff = 1; hiIDiff = 1; medIDiff = 1;
        for trial = 1:60
            if datacell{1, subject}(trial, 15) == 2 %same word
        if Imagery(subject, 7) == Imagery(subject, 8)
            if and(zlrtcell{subject}(trial) ~= 0, ~isnan(zlrtcell{subject}(trial)))
            noImagerySameBoot{subject} (noISame) = zlrtcell{subject}(trial);
            noISame = noISame +1;
            end
        elseif or(datacell{1, subject}(trial, 11) == Imagery(subject, 7), datacell{1, subject}(trial, 11) == Imagery(subject, 8))
            if and(zlrtcell{subject}(trial) ~= 0, ~isnan(zlrtcell{subject}(trial)))
            loImagerySameBoot{subject}(loISame) = zlrtcell{subject}(trial);
            rawloImagerySameBoot{subject}(loISame) = rtcell{subject}(trial);
            loISame = loISame +1;
        end
        elseif or(datacell{1, subject}(trial, 11) == Imagery(subject, 9), datacell{1, subject}(trial, 11) == Imagery(subject, 10))
            if and(zlrtcell{subject}(trial) ~= 0, ~isnan(zlrtcell{subject}(trial)))
            hiImagerySameBoot{subject} (hiISame) = zlrtcell{subject}(trial);
            rawhiImagerySameBoot{subject} (hiISame) = rtcell{subject}(trial);
            hiISame = hiISame +1;
            end
            elseif and(zlrtcell{subject}(trial) ~= 0, ~isnan(zlrtcell{subject}(trial)))
                medImagerySameBoot{subject}(medISame) = zlrtcell{subject}(trial);
                rawmedImagerySameBoot{subject}(medISame) = rtcell{subject}(trial);
            medISame = medISame +1;
        end
            elseif datacell{1, subject}(trial, 15) == 3 %different word
                        if Imagery(subject, 7) == Imagery(subject, 8)
                            if and(zlrtcell{subject}(trial) ~= 0, ~isnan(zlrtcell{subject}(trial)))
            noImageryDifferentBoot{subject}(noIDiff) = zlrtcell{subject}(trial);
            noIDiff = noIDiff +1;
                            end
                        elseif or(datacell{1, subject}(trial, 11) == Imagery(subject, 7),datacell{1, subject}(trial, 11) == Imagery(subject, 8))
            if and(zlrtcell{subject}(trial) ~= 0, ~isnan(zlrtcell{subject}(trial)))
            loImageryDifferentBoot{subject}(loIDiff) = zlrtcell{subject}(trial);
            rawloImageryDifferentBoot{subject}(loIDiff) = rtcell{subject}(trial);
            loIDiff = loIDiff +1;
            end
                            elseif or(datacell{1, subject}(trial, 11) == Imagery(subject, 9),datacell{1, subject}(trial, 11) == Imagery(subject, 10))
            if and(zlrtcell{subject}(trial) ~= 0, ~isnan(zlrtcell{subject}(trial)))
            hiImageryDifferentBoot{subject}(hiIDiff) = zlrtcell{subject}(trial);
             rawhiImageryDifferentBoot{subject}(hiIDiff) = rtcell{subject}(trial);
            hiIDiff = hiIDiff +1;
            end
                        elseif and(zlrtcell{subject}(trial) ~= 0, ~isnan(zlrtcell{subject}(trial)))
                            medImageryDifferentBoot{subject}(medIDiff) = zlrtcell{subject}(trial);
            medIDiff = medIDiff +1;
                            end
                        end
            end
        end
 
       for subject = 1:7
           hidiff(subject) = mean(hiImagerySameBoot{subject}) - mean(hiImageryDifferentBoot{subject});  
         lodiff(subject) = mean(loImagerySameBoot{subject}) - mean(loImageryDifferentBoot{subject});  
         rawhidiff(subject) = mean(rawhiImagerySameBoot{subject}) - mean(rawhiImageryDifferentBoot{subject});  
         rawlodiff(subject) = mean(rawloImagerySameBoot{subject}) - mean(rawloImageryDifferentBoot{subject});  
       end
       figure(1)
       h1 = histogram(hidiff);
hold on
h2 = histogram(lodiff);
h1.Normalization = 'probability';
h1.BinWidth = 0.15;
h2.Normalization = 'probability';
h2.BinWidth = 0.15;
ylabel('relative number of observations')
xlabel('rt slow down for same context words effect size')
legend('low imagery lists', 'hi imagery lists')
title('slow down for high imagery and low imagery contexts within subjects')
hold off

figure(2)
hold on
h3 = histogram(rawlodiff);
h4 = histogram(rawhidiff);
h3.Normalization = 'probability';
h3.BinWidth = 50;
h4.Normalization = 'probability';
h4.BinWidth = 50;
ylabel('relative number of observations')
xlabel('rt slow down for same context words per subject')
legend('low imagery lists', 'high imagery lists')
title('slow down for high imagery and low imagery contexts within subjects')
hold off
% 
% 3. to assess the reliability of this effect, do the following, 1000 times.
% 
% Select N (N=# of subjects, 7 right?) random numbers, from 1:N, with replacement, 
% e.g. randSubjs = ceil(rand(1,7)*7);
% 
% Then, for each of those random numbers, take that subject's entire batch of 
%     trials, and add it to the pool for this run. You will repeat some subjects - that's okay, that's the point!
% 
% Then apply the above analysis, from step 2, to this run's pool of trials.
% 
% Save that effect size.
% 
% 4. You will now have 1000 effect size numbers. Plot the histogram. What 
% % of them are positive? This is the p-value.
% 
% 

for subject = 1:7
    SubjectRTsLo{subject} = [loImageryDifferentBoot{subject}, loImagerySameBoot{subject}];
    SubjectRTsHi{subject} = [hiImageryDifferentBoot{subject}, hiImagerySameBoot{subject}];
end
