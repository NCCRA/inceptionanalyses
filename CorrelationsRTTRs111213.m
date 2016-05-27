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


% figure(1)
% hold on
subjectCount = 0;
%high imagery subjects = 12 16 17 19 24 25
%low imagery subjects = 11 15 18 20 22 26
%for overallsubject = [12 16 25]; %highimagery
%for overallsubject = [15 18 20]; %low imagery
%for overallsubject = [12 15 18 20 25];
for overallsubject = [12 15 18 20 25 28 29 30 33 34 35]   %all subjects
%for overallsubject = [12 20 25 29 30 34]; %highimagery
%for overallsubject = [15 18 20 28 33 35] % low imagery
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
    %RTsOfInterest = [6 10 11 12];
    %RTsOfInterest = [11:13];
    RTsOfInterest = [1:18];
    
    %for TR = 1:18
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
    RTs1(subjectCount, :) = mean(TrialRT1);
      RTs2(subjectCount, :) = mean(TrialRT2);
        RTs3(subjectCount, :) = mean(TrialRT3);
        ContextEvidence1(subjectCount, :) = sum(sum(SameCatSameSide1(:, RTsOfInterest)'));
    ContextEvidence2(subjectCount, :) = sum(sum(SameCatSameSide2(:, RTsOfInterest)'));
    ContextEvidence3(subjectCount, :) = sum(sum(SameCatSameSide3(:, RTsOfInterest)'));
    
end

Correlations = [Correlations1 Correlations2 Correlations3];

figure(1)
hold on
title(['fMRI Subjects: Sum of Same Context during Delay TRs' num2str(RTsOfInterest) ' vs. RT'])
xlabel('TrialType')
%subplot(3, 1, 1)

% plot([1:3], Correlations(1, :));
% plot([1:3], Correlations(2, :));
% plot([1:3], Correlations(3, :));
% plot([1:3], Correlations(4, :));
% plot([1:3], Correlations(5, :));

legend({'Subject12', 'Subject15', 'Subject18', 'Subject20', 'Subject25'})
ax = gca;
ax.XTick = [1:3];
ax.XTickLabel= {'TargetProbe', 'Lure/SameContextProbe', 'DifferentContextProbe'};

ylabel('Correlation between same context reinstatement and RT')
hold off

figure(2)
hold on
title(['fMRI Subjects: Sum of Same Context during Delay TRs' num2str(RTsOfInterest) ' vs. RT'])
xlabel('TrialType')
%subplot(3, 1, 1)
meanCorrelations = mean([Correlations1 Correlations2 Correlations3]);
SEMCorrelations = std(Correlations)/sqrt(subjectCount);
errorbar(1:3, meanCorrelations, SEMCorrelations);
%ylim([-.2 .15])
ax = gca;
ax.XTick = [1:3];
ax.XTickLabel= {'TargetProbe', 'Lure/SameContextProbe', 'DifferentContextProbe'};

ylabel('Correlation between same context reinstatement and RT')
hold off


[h, p] = ttest(Correlations2, Correlations3, 'tail', 'right')
[h, p] = ttest(Correlations2, 0)


figure (5)
figure
ax1 = subplot(3,1,1);
ax2 = subplot(3,1,2);
ax3 = subplot(3, 1, 3);

scatter(ax1,ContextEvidence1, RTs1, 'r')
scatter(ax2,ContextEvidence2, RTs2, 'g')
scatter(ax3,ContextEvidence3, RTs3, 'b')
lsline(ax1)
lsline(ax2)
lsline(ax3)
