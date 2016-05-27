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

TRs = 33;
subjectCount = 0;

%for overallsubject = [12 15 TRs 25];
%for overallsubject = [12 15 TRs 20 25];
for overallsubject =[15 TRs 19 29 28 29 30 33 34 35 37 39 40:44];
    %for overallsubject = [12 25 29 30 34]; %highimagery
    subjectCount = subjectCount + 1;
    subjectnumber = ['Subject' num2str(overallsubject)];
    
    a= load([subjectnumber 'parsedData_leftrightfacescene_wholeTrial']);
    parsedData = a.parsedData;
  
    
    %matrix = tr columns, trial rows
    ThresholdMatrix = zeros(60, TRs);
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
            
            ThresholdMatrix(trialCount, :) =...
                SameCatSameSide(trialCount, :) > SameCatOtherSide(trialCount, :) &...
                SameCatSameSide(trialCount, :) > OtherCatSameSide(trialCount, :) &...
                SameCatSameSide(trialCount, :) > OtherCatOtherSide(trialCount, :);
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

numTRs = TRs;
TRThreshold(1:numTRs) = ttest(SubjectThreshold(:, 1:numTRs), .25);
for i = 1:numTRs
    [h, p] = ttest(SubjectThreshold(:, i), .25);
    TRp(i) = p;
end

find(TRThreshold > 0)

figure(1)
hold on
errorbar(SubjectThreshold(1, :), SubjectThresholdSTD(1, :));
errorbar(SubjectThreshold(2, :), SubjectThresholdSTD(2, :));
errorbar(SubjectThreshold(3, :), SubjectThresholdSTD(3, :));
errorbar(SubjectThreshold(4, :), SubjectThresholdSTD(4, :));
errorbar(SubjectThreshold(5, :), SubjectThresholdSTD(5, :));
legend({'Subject12', 'Subject15', 'SubjectTRs', 'Subject20', 'Subject25'});
plot(1:TRs, .25 * ones(1, TRs), 'black')
ylabel('Probability Same Context Classifier Evidence = Max Classifier for TR')
xlabel('TR')
title('For each subject: probability the same context classifier = max classifier evidence per TR')
hold off

for TR = 1:numTRs
    SEMThreshold(TR) = std(SubjectThreshold(:, TR))/sqrt(5);
end

figure(2)
hold on
errorbar(mean(SubjectThreshold), SEMThreshold);
plot(1:TRs, .25 * ones(1, TRs), 'black')
ylabel('Probability Same Context Classifier Evidence = Max Classifier for TR')
xlabel('TR')
title('Averaged Across Subjects: probability the same context classifier = max classifier evidence per TR')
hold off

    for TR = 1:TRs
        [h, p] = ttest(SubjectThreshold(:, TR), .25);
        teaTime(TR) = h;
    end
    RTsOfInterest = find(teaTime);
    

%% Make trial by trial evidence accumulation

%global learning lists
% 1 = face
% 2 = scene
% 3 = face
% 4 = scene

%we trained the classifier to say:
%1 = left face
%2 = right face
%3 = left scene
%4 = right scew

%So I think the problem is that we know faces are 1 and 3 and
%scenes are 2 and 4, but we don't know which pictures were
%presented on each side of the screen. I think we can figure
%this out from the behavioral data though. So we need to map
%the global learning lists to the correct sides of space.
LearningListStimulusKind = [3 1 4 2];
%category 1 = left face = global learning list 3
%category 2 = right face = global learning list 1
%category 3 = left scence = global learning list 4
%category 4 = right scence = global learning list 2

% For each subject, split the trials up in the usual way: target, same-bucket, other-bucket
% Then, for each trial within these three splits, you have two numbers:
% i. reinstatement evidence (how to define this is an open question, but for now let's just say the sum of sameEvidence over all TRs TRs).
% ii. reaction time.
%
% I would, for each subject, for each split, compute the correlation between these two measures.
% So now you have three numbers per subject: the correlation between reinstatement evidence and RT for target, same-bucket, and other-bucket.
%
% Take the average (and S.E.M.) of these across subjects, and you have a bar graph with three bars. If it looks as we expect, we call Nature and tell them to reserve a special issue. ;-)


% figure(1)
% hold on
subjectCount = 0;
%high imagery subjects = 12 16 17 19 24 25
%low imagery subjects = 11 15 TRs 20 22 26
%for overallsubject = [12 16 25]; %highimagery
%for overallsubject = [15 TRs 20]; %low imagery
%for overallsubject = [12 15 TRs 20 25]; %all subjects
for overallsubject = [12 15 TRs 20 25 28 29 33 34 35]  
subjectCount = subjectCount + 1;
    subjectnumber = ['Subject' num2str(overallsubject)];
    load([subjectnumber '.mat']);
    load([subjectnumber 'parsedData_leftrightfacescene']);
    kindCount = [1 1 1];
    for block = 1:5
        for trial = 1:12
            %category 1 = left face = global learning list 3
            %category 2 = right face = global learning list 1
            %category 3 = left scence = global learning list 4
            %category 4 = right scence = global learning list 2
            %we only want to do this on the same context/lure trials
            kindMatch = blockData(block+16).trialData(trial).kindMatch;
            %we only want to do this when there's a real RT
            if blockData(block+16).trialData(trial).RT > 0
                if parsedData(block, trial).Category == 1
                    if kindMatch == 1
                        SameCatSameSide1(kindCount(kindMatch),:)  = (parsedData(block, trial).leftFace);
                    elseif kindMatch == 2
                        SameCatSameSide2(kindCount(kindMatch),:)  = (parsedData(block, trial).leftFace);
                    elseif kindMatch == 3
                        SameCatSameSide3(kindCount(kindMatch),:)  = (parsedData(block, trial).leftFace);
                    end
                elseif parsedData(block, trial).Category == 2
                    if kindMatch == 1
                        SameCatSameSide1(kindCount(kindMatch),:)  = (parsedData(block, trial).rightFace);
                    elseif kindMatch == 2
                        SameCatSameSide2(kindCount(kindMatch),:)  = (parsedData(block, trial).rightFace);
                    elseif kindMatch == 3
                        SameCatSameSide3(kindCount(kindMatch),:)  = (parsedData(block, trial).rightFace);
                    end
                elseif parsedData(block, trial).Category ==3
                    if kindMatch == 1
                        SameCatSameSide1(kindCount(kindMatch),:)  = (parsedData(block, trial).leftScene);
                    elseif kindMatch == 2
                        SameCatSameSide2(kindCount(kindMatch),:)  = (parsedData(block, trial).leftScene);
                    elseif kindMatch == 3
                        SameCatSameSide3(kindCount(kindMatch),:)  = (parsedData(block, trial).leftScene);
                    end
                elseif parsedData(block, trial).Category ==4
                    if kindMatch == 1
                        SameCatSameSide1(kindCount(kindMatch),:)  = (parsedData(block, trial).rightScene);
                    elseif kindMatch == 2
                        SameCatSameSide2(kindCount(kindMatch),:)  = (parsedData(block, trial).rightScene);
                    elseif kindMatch == 3
                        SameCatSameSide3(kindCount(kindMatch),:)  = (parsedData(block, trial).rightScene);
                    end
                end
                if kindMatch == 1
                    TrialRT1(kindCount(kindMatch)) = blockData(block+16).trialData(trial).RT;
                elseif kindMatch == 2
                    TrialRT2(kindCount(kindMatch)) = blockData(block+16).trialData(trial).RT;
                elseif kindMatch == 3
                    TrialRT3(kindCount(kindMatch)) = blockData(block+16).trialData(trial).RT;
                end
                kindCount(kindMatch) = kindCount(kindMatch) + 1;
            end
        end
    end
    %%
    % 

    
    %for TR = 1:TRs
        a1 = corrcoef(sum(SameCatSameSide1(:, RTsOfInterest)'), TrialRT1);
        CorProbeType1 = a1(2);
        a2 = corrcoef(sum(SameCatSameSide2(:,RTsOfInterest)'), TrialRT2);
        CorProbeType2 = a2(2);
        a3 = corrcoef(sum(SameCatSameSide3(:, RTsOfInterest)'), TrialRT3);
        CorProbeType3 = a3(2);
    %end
    Correlations1(subjectCount, :) = CorProbeType1;
    Correlations2(subjectCount, :) = CorProbeType2;
    Correlations3(subjectCount, :) = CorProbeType3;
end
% 
% figure(1)
% hold on
% title(['fMRI Subjects: Sum of Same Context during Delay TRs' num2str(RTsOfInterest) ' vs. RT'])
% xlabel('TrialType')
% %subplot(3, 1, 1)
 Correlations = [Correlations1 Correlations2 Correlations3];
% plot([1:3], Correlations(1, :));
% plot([1:3], Correlations(2, :));
% plot([1:3], Correlations(3, :));
% plot([1:3], Correlations(4, :));
% plot([1:3], Correlations(5, :));
% 
% legend({'Subject12', 'Subject15', 'SubjectTRs', 'Subject20', 'Subject25'})
% ax = gca;
% ax.XTick = [1:3];
% ax.XTickLabel= {'TargetProbe', 'Lure/SameContextProbe', 'DifferentContextProbe'};
% 
% ylabel('Correlation between same context reinstatement and RT')
% hold off

figure(3)
hold on
title(['fMRI Subjects: Sum of Same Context during Delay TRs' num2str(RTsOfInterest) ' vs. RT'])
xlabel('TrialType')
%subplot(3, 1, 1)
meanCorrelations = mean([Correlations1 Correlations2 Correlations3]);
SEMCorrelations = std(Correlations)/sqrt(5);
errorbar(1:3, meanCorrelations, SEMCorrelations);
ax = gca;
ax.XTick = [1:3];
ax.XTickLabel= {'TargetProbe', 'Lure/SameContextProbe', 'DifferentContextProbe'};

ylabel('Correlation between same context reinstatement and RT')
hold off


[h, p] = ttest(Correlations2, Correlations3, 'tail', 'right')
    
