%function CorrelationEvidenceProbeTypeRTByEachTR

% if parsedDataType == 0
%     parsedDataType = 'leftrightfacescene_EvidenceAtProbe.mat';
% end

parsedDataType = 'leftrightfacescene_wholeTrial.mat';
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


% figure(1)
% hold on
subjectCount = 0;
%high imagery subjects = 12 16 17 19 24 25
%low imagery subjects = 11 15 18 20 22 26
%for overallsubject = [12 16 25]; %highimagery
%for overallsubject = [15 18 20]; %low imagery
%for overallsubject = [12 15 18 20 25]; %all subjects
%for overallsubject = [12 15 18 20 25 28 29 33 34 35]
%for overallsubject = [12 15 18 20 25 28 29 30 33 34 35]
%for overallsubject = [12 25 29 30 34]; %highimagery
%for overallsubject = [15 18 20 28 33 35] % low imagery
load('SubjectNotes.mat')

for overallsubject = SubjectNotes.behavioralSubjectsAboveChance
    subjectCount = subjectCount + 1;
    subjectnumber = ['Subject' num2str(overallsubject)];
        load([subjectnumber '.mat']);
    load([subjectnumber 'parsedData_' parsedDataType]);
kindCount = [1 1 1];
    for block = 1:5
        for trial = 1:length(parsedData)
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
    
    for TR = 1:length(parsedData(1,2).sameEvidenceByTR)
        a1 = corrcoef(SameCatSameSide1(:, TR), TrialRT1);
        CorProbeType1(TR) = a1(2);
        a2 = corrcoef(SameCatSameSide2(:, TR), TrialRT2);
        CorProbeType2(TR) = a2(2);
        a3 = corrcoef(SameCatSameSide3(:, TR), TrialRT3);
        CorProbeType3(TR) = a3(2);
    end
    Correlations1(subjectCount, :) = CorProbeType1;
    Correlations2(subjectCount, :) = CorProbeType2;
    Correlations3(subjectCount, :) = CorProbeType3;
end



Correlations1 = atanh(Correlations1);
Correlations2 = atanh(Correlations2);
Correlations3 = atanh(Correlations3);
figure(1)
hold on
title(['Same Category Evidence during DNMS Trial * RT'])
xlabel('TR')
%subplot(3, 1, 1)
errorbar([1:length(parsedData(1,2).sameEvidenceByTR)], mean(Correlations1), std(Correlations1)/sqrt(size(Correlations1, 1)), 'blue');
%subplot(3, 1, 2)
errorbar([1:length(parsedData(1,2).sameEvidenceByTR)], mean(Correlations2), std(Correlations2)/sqrt(size(Correlations2, 1)), 'red');
%subplot(3, 1, 3)
errorbar([1:length(parsedData(1,2).sameEvidenceByTR)], mean(Correlations3), std(Correlations3)/sqrt(size(Correlations3, 1)), 'green');
%ylim([-.3 .25])
legend({'TargetProbe', 'Lure/SameContextProbe', 'DifferentContextProbe'})
ax = gca;
ax.XTick = [0+6 2+6 11+6 20+6 23+6];
ax.XTickLabel = {'targets','delay starts',...
    'middle delay TR', 'probe','response period ends'};

x=[2+6,2+6];
y=[-.3 .25];
plot(x,y, 'yellow')
x=[20+6,20+6];
y=[-.3 .25];
plot(x,y, 'yellow')
x=[23+6,23+6];
y=[-.3 .25];
plot(x,y, 'yellow')
x=[0 30+6];
y=[0 0];
plot(x,y, 'black')

ylabel('Correlation between same context reinstatement and RT')
hold off


for i = 1:1:length(parsedData(1,1).sameEvidenceByTR)
    [h,p] = ttest(Correlations2(:, i), 0);
    ttestresults(i) = p
end

%% for each trial we want: Subject, TR, reinstatement evidence
%% dependent = RT
