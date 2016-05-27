% 
% For each TR n, for each subject, make a vector that is every n'th TR of 
%     every trial for every subject. So you have n a two dimensional arrays 
%     that are each k by s, k trials rows and s subjects columns).
% 
% Each element of that array should be a binary value that is set to 1 
% if the same-same evidence at that n'th TR in that trial is:
% a. the maximum of the four values.
% OR
% b. greater than the average of the three other values.
% 
% You can pick a or b, or try them both separately. Whichever. (But not both at the same time!)
% 
% Then, take the mean of each of those columns (so mean across trials, within-subjects).
% Now, for each TR, you should have s values between 0 and 1, representing 
%     the fraction of trials on which each subject showed superior same-same evidence.
% 
% You can then t-test those TRs against a threshold value - 0.25 or 0.5. 
% (You can just use ttest(vector, 0.5)).
% 
% I feel like if you do 0.25 it will come out with every TR significant, but 
% maybe not. I say try it, and if it gives you too many TRs then something is
% sketchy (since this is only 6 subjects). Might as well try both! All the work
% is in making the arrays. Once you've got em you can go to town on em :)
% 
% FWIW, I'm almost certain that these distributions are not going to be gaussian, 
% and may in fact be heavily skewed (this is why I was super skeptical). 
% But, you know what, it's probably fine.

clear;

%% thresholding ken style

LearningListStimulusKind = [3 1 4 2];
%category 1 = left face = global learning list 3
%category 2 = right face = global learning list 1
%category 3 = left scence = global learning list 4
%category 4 = right scence = global learning list 2


subjectCount = 0;

%for overallsubject = [12 15 18 25];
%for overallsubject = [12 15 18 20 25];
for overallsubject = [15 18 19 29 28 29 30 33 34 35 37 39 40:44];
    subjectCount = subjectCount + 1;
    subjectnumber = ['Subject' num2str(overallsubject)];
    
    a= load([subjectnumber 'parsedData_leftrightfacescene_wholeTrial']);
    parsedData = a.parsedData;
  
    
    %matrix = tr columns, trial rows
    ThresholdMatrix = zeros(60, 33);
    trialCount = 0;

    for block = 1:5
        for trial = 2:11
            trialCount = trialCount + 1;
            %category 1 = left face = global learning list 3
            %category 2 = right face = global learning list 1
            %category 3 = left scence = global learning list 4
            %category 4 = right scence = global learning list 2
            if parsedData(block, trial).Category == 1
                SameCatSameSide(trialCount, :) = parsedData(block, trial).leftFace;
                SameCatOtherSide(trialCount, :) = parsedData(block, trial).rightFace;
                OtherCatSameSide(trialCount, :) = parsedData(block, trial).leftScene;
                OtherCatOtherSide(trialCount, :) = parsedData(block, trial).rightScene;
            elseif parsedData(block, trial).Category == 2
                SameCatOtherSide(trialCount, :) = parsedData(block, trial).leftFace;
                SameCatSameSide(trialCount, :) = parsedData(block, trial).rightFace;
                OtherCatOtherSide(trialCount, :) = parsedData(block, trial).leftScene;
                OtherCatSameSide(trialCount, :) = parsedData(block, trial).rightScene;
            elseif parsedData(block, trial).Category ==3
                OtherCatSameSide(trialCount, :) = parsedData(block, trial).leftFace;
                OtherCatOtherSide(trialCount, :) = parsedData(block, trial).rightFace;
                SameCatSameSide(trialCount, :) = parsedData(block, trial).leftScene;
                SameCatOtherSide(trialCount, :) = parsedData(block, trial).rightScene;
            elseif parsedData(block, trial).Category ==4
                OtherCatOtherSide(trialCount, :) = parsedData(block, trial).leftFace;
                OtherCatSameSide(trialCount, :) = parsedData(block, trial).rightFace;
                SameCatOtherSide(trialCount, :) = parsedData(block, trial).leftScene;
                SameCatSameSide(trialCount, :) = parsedData(block, trial).rightScene;
            end
            
            
            averageOtherClassifiers = ...
                [SameCatOtherSide(trialCount, :);...
                OtherCatSameSide(trialCount, :);...
                OtherCatOtherSide(trialCount, :)];
                
            ThresholdMatrix(trialCount, :) =...
                SameCatSameSide(trialCount, :) > mean(averageOtherClassifiers);
        end
    end
    SameCatSameSideAverage(subjectCount, :) = mean(SameCatSameSide);
    SameCatSameSideSTD(subjectCount, :) = std(SameCatSameSide) / sqrt(length(SameCatSameSide));
    
    SameCatOtherSideSTD(subjectCount, :) = std(SameCatOtherSide) / sqrt(length(SameCatOtherSide));
    SameCatOtherSideAverage(subjectCount, :) = mean(SameCatOtherSide);
    
    OtherCatSameSideAverage(subjectCount, :) = mean(OtherCatSameSide);
    OtherCatSameSideSTD(subjectCount, :) = std(OtherCatSameSide) / sqrt(length(OtherCatSameSide));
    
    OtherCatOtherSideAverage(subjectCount, :) = mean(OtherCatOtherSide);
    OtherCatOtherSideSTD(subjectCount, :) = std(OtherCatOtherSide) / sqrt(length(OtherCatOtherSide));
    SubjectThreshold(subjectCount, :) = mean(ThresholdMatrix);
    SubjectThresholdSTD(subjectCount, :) = std(ThresholdMatrix)/sqrt(length(ThresholdMatrix));
end

numTRs = 33;
TRThreshold(1:numTRs) = ttest(SubjectThreshold(:, 1:numTRs), .5);
for i = 1:numTRs
    [h, p] = ttest(SubjectThreshold(:, i), .5);
    TRp(i) = p;
end

find(TRThreshold > 0)

for TR = 1:numTRs
    SEMThreshold(TR) = std(SubjectThreshold(:, TR))/sqrt(5);
end

figure(1)
hold on
errorbar(SubjectThreshold(1, :), SubjectThresholdSTD(1, :));
errorbar(SubjectThreshold(2, :), SubjectThresholdSTD(2, :));
errorbar(SubjectThreshold(3, :), SubjectThresholdSTD(3, :));
errorbar(SubjectThreshold(4, :), SubjectThresholdSTD(4, :));
errorbar(SubjectThreshold(5, :), SubjectThresholdSTD(5, :));
legend({'Subject12', 'Subject15', 'Subject18', 'Subject20', 'Subject25'});
plot(1:33, .5 * ones(1, 33), 'black')
ylim([.2, .8])

ylabel('Probability Same Context Classifier Evidence > Mean of Other Classifiers by TR')
xlabel('TR')
title('For each subject: probability same context classifier evidence > mean other classifier evidence per TR')
hold off

figure(2)
hold on
errorbar(mean(SubjectThreshold), SEMThreshold);
plot(1:33, .5 * ones(1, 33), 'black')
%ylim([.2, .8])
ylabel('Probability Same Context Classifier Evidence > Mean of Other Classifiers by TR')
xlabel('TR')
title('Averaged Across Subjects: probability same context classifier evidence > mean other classifier evidence per TR')
hold off
