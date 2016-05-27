clear;
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
% i. reinstatement evidence (how to define this is an open question, but for now let's just say the sum of sameEvidence over all 18 TRs).
% ii. reaction time.
% 
% I would, for each subject, for each split, compute the correlation between these two measures.
% So now you have three numbers per subject: the correlation between reinstatement evidence and RT for target, same-bucket, and other-bucket.
% 
% Take the average (and S.E.M.) of these across subjects, and you have a bar graph with three bars. If it looks as we expect, we call Nature and tell them to reserve a special issue. ;-)


load('HiLoImageryLists.mat')
subjectCount = 0;
%high imagery subjects = 12 16 17 19 24 25
%low imagery subjects = 11 15 18 20 22 26
%for overallSubject = [12 16 25]; %highimagery
     %for overallSubject = [15 18 20]; %low imagery
for overallSubject = [12 15 16 18 20 25]; %all subjects
    subjectCount = subjectCount + 1;
    subjectnumber = ['Subject' num2str(overallSubject)];
        load([subjectnumber '.mat']);
    load([subjectnumber 'parsedData_leftrightfacescene']);
kindCount = [1 1 1];
LokindCount = [1 1 1];
    for block = 1:5
        for trial = 1:12
            %category 1 = left face = global learning list 3
            %category 2 = right face = global learning list 1
            %category 3 = left scence = global learning list 4
            %category 4 = right scence = global learning list 2
                        %we only want to do this on the same context/lure trials
            kindMatch = blockData(block+16).trialData(trial).kindMatch
            globalLearningList = parsedData(block, trial).globalLearningList;
            hi = or(HiLoImageryLists(overallSubject, 1) == globalLearningList, ...
                HiLoImageryLists(overallSubject, 2) == globalLearningList);
            
            if hi
                %we only want to do this when there's a real RT
                if and(blockData(block+16).trialData(trial).RT > 0, blockData(block+16).trialData(trial).accuracy > 0)
            if parsedData(block, trial).Category == 1
                SameCatSameSide(kindMatch,kindCount(kindMatch))  = sum(parsedData(block, trial).leftFace);
            elseif parsedData(block, trial).Category == 2
                SameCatSameSide(kindMatch,kindCount(kindMatch))  = sum(parsedData(block, trial).rightFace);
            elseif parsedData(block, trial).Category ==3
                SameCatSameSide(kindMatch,kindCount(kindMatch))  = sum(parsedData(block, trial).leftScene);
            elseif parsedData(block, trial).Category ==4
                SameCatSameSide(kindMatch,kindCount(kindMatch))  = sum(parsedData(block, trial).rightScene);
            end
             TrialRT(kindMatch,kindCount(kindMatch)) = blockData(block+16).trialData(trial).RT;
             kindCount(kindMatch) = kindCount(kindMatch) + 1;
                end   
            else
                                if blockData(block+16).trialData(trial).RT > 0
            if parsedData(block, trial).Category == 1
                LoSameCatSameSide(kindMatch,LokindCount(kindMatch))  = sum(parsedData(block, trial).leftFace);
            elseif parsedData(block, trial).Category == 2
                LoSameCatSameSide(kindMatch,LokindCount(kindMatch))  = sum(parsedData(block, trial).rightFace);
            elseif parsedData(block, trial).Category ==3
                LoSameCatSameSide(kindMatch,LokindCount(kindMatch))  = sum(parsedData(block, trial).leftScene);
            elseif parsedData(block, trial).Category ==4
                LoSameCatSameSide(kindMatch,LokindCount(kindMatch))  = sum(parsedData(block, trial).rightScene);
            end
             LoTrialRT(kindMatch,LokindCount(kindMatch)) = blockData(block+16).trialData(trial).RT;
             LokindCount(kindMatch) = LokindCount(kindMatch) + 1;
                end  
        end         
        end
    end
   %% 
   a = corrcoef(SameCatSameSide(1, :), TrialRT(1, :));
    CorProbeType1(subjectCount) = a(2);
    a = corrcoef(SameCatSameSide(2, :), TrialRT(2, :))
    CorProbeType2(subjectCount) = a(2) ;
    a = corrcoef(SameCatSameSide(3, :), TrialRT(3, :));
    CorProbeType3(subjectCount) = a(2);
    
       b = corrcoef(LoSameCatSameSide(1, :), LoTrialRT(1, :));
    LoCorProbeType1(subjectCount) = b(2);
    b = corrcoef(LoSameCatSameSide(2, :), LoTrialRT(2, :))
    LoCorProbeType2(subjectCount) = b(2) ;
    b = corrcoef(LoSameCatSameSide(3, :), LoTrialRT(3, :));
    LoCorProbeType3(subjectCount) = b(2);
    
end

Correlations = [mean(CorProbeType1) mean(CorProbeType2) mean(CorProbeType3)];
stds = [std(CorProbeType1)/sqrt(length(CorProbeType1))...
    std(CorProbeType2)/sqrt(length(CorProbeType2))...
    std(CorProbeType3)/sqrt(length(CorProbeType3))];

    
    figure(1)
hold on
title(['HighImagery Lists: Sum of Same Category Evidence during DNMS Delay * RT'])

errorbar([1 2 3], Correlations, stds);
ax = gca;
ax.XTick = [1 2 3];
ax.XTickLabel = {'TargetProbe', 'LureProbeFromSameContext', 'OtherContextProbe'};
xlabel('Trial Type')
ylabel('Correlation between same context reinstatement and RT')
hold off


LoCorrelations = [mean(LoCorProbeType1) mean(LoCorProbeType2) mean(LoCorProbeType3)];
Lostds = [std(LoCorProbeType1)/sqrt(length(LoCorProbeType1))...
    std(LoCorProbeType2)/sqrt(length(LoCorProbeType2))...
    std(LoCorProbeType3)/sqrt(length(LoCorProbeType3))];

    
    figure(2)
hold on
title(['LowImagery Lists: Sum of Same Category Evidence during DNMS Delay * RT'])

errorbar([1 2 3], LoCorrelations, Lostds);
bx = gca;
bx.XTick = [1 2 3];
bx.XTickLabel = {'TargetProbe', 'LureProbeFromSameContext', 'OtherContextProbe'};
xlabel('Trial Type')
ylabel('Correlation between same context reinstatement and RT')
hold off




