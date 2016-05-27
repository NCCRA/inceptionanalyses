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

DelayLength = 34;
% figure(1)
% hold on
subjectCount = 0;
%high imagery subjects = 12 16 17 19 24 25
%low imagery subjects = 11 15 18 20 22 26
%for overallsubject = [12 15 16 18 20 25];

load('SubjectNotes.mat')

for overallsubject = SubjectNotes.behavioralSubjectsAboveChance;
    subjectCount = subjectCount + 1;
    subjectnumber = ['Subject' num2str(overallsubject)];
    
    a= load([subjectnumber 'parsedData_leftrightfacescene_wholeTrial.mat']);
    parsedData = a.parsedData;
    %let's start by collapsing faces and scenes
    faceCount1 = 1;
    sceneCount1 = 1;
    faceCount2 = 1;
    sceneCount2 = 1;
    for block = 1:5
        for trial = 1:length(parsedData)
            %category 1 = left face = global learning list 3
            %category 2 = right face = global learning list 1
            %category 3 = left scence = global learning list 4
            %category 4 = right scence = global learning list 2
            if parsedData(block, trial).Category == 1
                SameCatSameSide(faceCount1, :) = parsedData(block, trial).leftFace;
                SameCatOtherSide(faceCount1, :) = parsedData(block, trial).rightFace;
                OtherCatSameSide(faceCount1, :) = parsedData(block, trial).leftScene;
                OtherCatOtherSide(faceCount1, :) = parsedData(block, trial).rightScene;
                faceCount1 = faceCount1 + 1;
            elseif parsedData(block, trial).Category == 2
                SameCatOtherSide(faceCount1, :) = parsedData(block, trial).leftFace;
                SameCatSameSide(faceCount1, :) = parsedData(block, trial).rightFace;
                OtherCatOtherSide(faceCount1, :) = parsedData(block, trial).leftScene;
                OtherCatSameSide(faceCount1, :) = parsedData(block, trial).rightScene;
                faceCount1 = faceCount1 + 1;
            elseif parsedData(block, trial).Category ==3
                OtherCatSameSide(faceCount1, :) = parsedData(block, trial).leftFace;
                OtherCatOtherSide(faceCount1, :) = parsedData(block, trial).rightFace;
                SameCatSameSide(faceCount1, :) = parsedData(block, trial).leftScene;
                SameCatOtherSide(faceCount1, :) = parsedData(block, trial).rightScene;
                faceCount1 = faceCount1 + 1;
            elseif parsedData(block, trial).Category ==4
                OtherCatOtherSide(faceCount1, :) = parsedData(block, trial).leftFace;
                OtherCatSameSide(faceCount1, :) = parsedData(block, trial).rightFace;
                SameCatOtherSide(faceCount1, :) = parsedData(block, trial).leftScene;
                SameCatSameSide(faceCount1, :) = parsedData(block, trial).rightScene;
                faceCount1 = faceCount1 + 1;
            end
        end
    end
    SameCatSameSideAverage(subjectCount, :) = nanmean(SameCatSameSide);
    SameCatSameSideSTD(subjectCount, :) = nanstd(SameCatSameSide) / sqrt(length(SameCatSameSide));
    
    SameCatOtherSideSTD(subjectCount, :) = nanstd(SameCatOtherSide) / sqrt(length(SameCatOtherSide));
    SameCatOtherSideAverage(subjectCount, :) = nanmean(SameCatOtherSide);
    
    OtherCatSameSideAverage(subjectCount, :) = nanmean(OtherCatSameSide);
    OtherCatSameSideSTD(subjectCount, :) = nanstd(OtherCatSameSide) / sqrt(length(OtherCatSameSide));
    
    OtherCatOtherSideAverage(subjectCount, :) = nanmean(OtherCatOtherSide);
    OtherCatOtherSideSTD(subjectCount, :) = nanstd(OtherCatOtherSide) / sqrt(length(OtherCatOtherSide));
end

figure(1)
hold on
title(['Average evidence for 4 way classifier by TR'])
if subjectCount >1
errorbar([1:length(parsedData(1,2).sameEvidenceByTR)], nanmean(SameCatSameSideAverage), std(SameCatSameSideAverage)/sqrt(length(SameCatSameSideAverage)))
 errorbar([1:length(parsedData(1,2).sameEvidenceByTR)], nanmean(SameCatOtherSideAverage), std(SameCatOtherSideAverage)/sqrt(length(SameCatOtherSideAverage)), '--')
 errorbar([1:length(parsedData(1,2).sameEvidenceByTR)], nanmean(OtherCatSameSideAverage), std(OtherCatSameSideAverage)/sqrt(length(OtherCatSameSideAverage)), '--')
 errorbar([1:length(parsedData(1,2).sameEvidenceByTR)], nanmean(OtherCatOtherSideAverage), std(OtherCatOtherSideAverage)/sqrt(length(OtherCatOtherSideAverage)), '--')
else
   errorbar([1:length(parsedData(1,2).sameEvidenceByTR)], (SameCatSameSideAverage), (SameCatSameSideSTD))
errorbar([1:length(parsedData(1,2).sameEvidenceByTR)], (SameCatOtherSideAverage), (SameCatOtherSideSTD), '--')
errorbar([1:length(parsedData(1,2).sameEvidenceByTR)], (OtherCatSameSideAverage), (OtherCatSameSideSTD), '--')
errorbar([1:length(parsedData(1,2).sameEvidenceByTR)], (OtherCatOtherSideAverage), (OtherCatOtherSideSTD), '--')
end
legend({'SameCategory/SameSide', 'SameCategory/OtherSide', 'OtherCategory/SameSide', 'OtherCategory/OtherSide'})
ax = gca;
ax.XTick = [0+6 2+6 11+6 20+6 23+6];
ax.XTickLabel = {'targets','delay starts',...
    'middle delay TR', 'probe','response period ends'};

x=[0 30];
y=[0 0];
plot(x,y, 'black')

xlabel('TR')
ylabel('Classifier Evidence')
ylim([.47 .53])
hold off

% 
% %  [p, anovatab, stats] = anova1(SameCatOtherSideAverage)
% %  [c,~,~,gnames] = multcompare(stats)
% % x3 = [mean(SameCatSameSideAverage(:, 1:2)')', mean(SameCatSameSideAverage(:, 3:4)')', mean(SameCatSameSideAverage(:, 5:6)')', mean(SameCatSameSideAverage(:, 7:8)')', mean(SameCatSameSideAverage(:, 9:10)')',mean(SameCatSameSideAverage(:, 11:12)')', mean(SameCatSameSideAverage(:, 13:14)')',mean(SameCatSameSideAverage(:, 15:16)')',mean(SameCatSameSideAverage(:, 17:18)')']
% %  [p2, anovatab2, stats2] = anova1(x3)
% %  [c2,~,~,gnames2] = multcompare(stats2)
% %  x4 = [mean(SameCatSameSideAverage(:, 1:3)')', mean(SameCatSameSideAverage(:, 4:6)')', mean(SameCatSameSideAverage(:, 7:9)')', mean(SameCatSameSideAverage(:, 10:12)')', mean(SameCatSameSideAverage(:, 13:15)')',mean(SameCatSameSideAverage(:, 16:18)')'] %, mean(SameCatSameSideAverage(:, 13:14)')',mean(SameCatSameSideAverage(:, 15:16)')',mean(SameCatSameSideAverage(:, 17:18)')']
% %   [p3, anovatab3, stats3] = anova1(x4)
% %  [c3,~,~,gnames3] = multcompare(stats3)
% %  
% %  
% %  x5 = [sum(SameCatSameSideAverage(:, 1:2)')', sum(SameCatSameSideAverage(:, 3:4)')', sum(SameCatSameSideAverage(:, 5:6)')', sum(SameCatSameSideAverage(:, 7:8)')', sum(SameCatSameSideAverage(:, 9:10)')',sum(SameCatSameSideAverage(:, 11:12)')', sum(SameCatSameSideAverage(:, 13:14)')',sum(SameCatSameSideAverage(:, 15:16)')',sum(SameCatSameSideAverage(:, 17:18)')']
% %  [p5, anovatab5, stats5] = anova1(x5)
% %  [c5,~,~,gnames5] = multcompare(stats5)
% %  
% %  
% %   x6 = [mean(SameCatSameSideAverage(:, 1:6)')', mean(SameCatSameSideAverage(:, 7:12)')', mean(SameCatSameSideAverage(:, 13:18)')']; %, mean(SameCatSameSideAverage(:, 10:12)')', mean(SameCatSameSideAverage(:, 13:15)')',mean(SameCatSameSideAverage(:, 16:18)')'] %, mean(SameCatSameSideAverage(:, 13:14)')',mean(SameCatSameSideAverage(:, 15:16)')',mean(SameCatSameSideAverage(:, 17:18)')']
% %   [p6, anovatab6, stats6] = anova1(x6)
% %  [c6,~,~,gnames6] = multcompare(stats6)
%  
%  subject1 = {'subject1', 'subject1', 'subject1', 'subject1', 'subject1', 'subject1',  'subject1', 'subject1', 'subject1', 'subject1', 'subject1', 'subject1',  'subject1', 'subject1', 'subject1', 'subject1', 'subject1', 'subject1'};
%  subject2 = {'subject2', 'subject2', 'subject2','subject2', 'subject2', 'subject2','subject2', 'subject2', 'subject2','subject2', 'subject2', 'subject2','subject2', 'subject2', 'subject2','subject2', 'subject2', 'subject2'};
%  subject3 = {'subject3', 'subject3', 'subject3', 'subject3', 'subject3', 'subject3','subject3', 'subject3', 'subject3','subject3', 'subject3', 'subject3','subject3', 'subject3', 'subject3','subject3', 'subject3', 'subject3'};
%  subject4 = {'subject4', 'subject4', 'subject4', 'subject4', 'subject4', 'subject4', 'subject4', 'subject4', 'subject4','subject4', 'subject4', 'subject4','subject4', 'subject4', 'subject4','subject4', 'subject4', 'subject4',};
% subject5 = {'subject5', 'subject5', 'subject5',  'subject5', 'subject5', 'subject5',  'subject5', 'subject5', 'subject5',  'subject5', 'subject5', 'subject5',  'subject5', 'subject5', 'subject5',  'subject5', 'subject5', 'subject5'};
% subject6 = {'subject6', 'subject6', 'subject6', 'subject6', 'subject6', 'subject6', 'subject6', 'subject6', 'subject6', 'subject6', 'subject6', 'subject6', 'subject6', 'subject6', 'subject6', 'subject6', 'subject6', 'subject6'};
% 
% SCatSSide ={'SameCatSameSide', 'SameCatSameSide', 'SameCatSameSide', 'SameCatSameSide', 'SameCatSameSide', 'SameCatSameSide', 'SameCatSameSide', 'SameCatSameSide', 'SameCatSameSide', 'SameCatSameSide', 'SameCatSameSide', 'SameCatSameSide', 'SameCatSameSide', 'SameCatSameSide', 'SameCatSameSide', 'SameCatSameSide', 'SameCatSameSide', 'SameCatSameSide'};
% SCatDSide = {'SameCatDiffSide', 'SameCatDiffSide','SameCatDiffSide','SameCatDiffSide','SameCatDiffSide','SameCatDiffSide','SameCatDiffSide','SameCatDiffSide','SameCatDiffSide','SameCatDiffSide','SameCatDiffSide','SameCatDiffSide','SameCatDiffSide','SameCatDiffSide','SameCatDiffSide','SameCatDiffSide','SameCatDiffSide','SameCatDiffSide'}; 
% DCatSSide = {'DiffCatSameSide', 'DiffCatSameSide', 'DiffCatSameSide', 'DiffCatSameSide', 'DiffCatSameSide', 'DiffCatSameSide','DiffCatSameSide', 'DiffCatSameSide', 'DiffCatSameSide', 'DiffCatSameSide', 'DiffCatSameSide', 'DiffCatSameSide','DiffCatSameSide', 'DiffCatSameSide', 'DiffCatSameSide', 'DiffCatSameSide', 'DiffCatSameSide', 'DiffCatSameSide'}; 
% DCatDSide = {'DiffCatDiffSide', 'DiffCatDiffSide', 'DiffCatDiffSide', 'DiffCatDiffSide', 'DiffCatDiffSide', 'DiffCatDiffSide', 'DiffCatDiffSide', 'DiffCatDiffSide', 'DiffCatDiffSide', 'DiffCatDiffSide', 'DiffCatDiffSide', 'DiffCatDiffSide', 'DiffCatDiffSide', 'DiffCatDiffSide', 'DiffCatDiffSide', 'DiffCatDiffSide', 'DiffCatDiffSide', 'DiffCatDiffSide'};
% 
% evidenceValues = [SameCatSameSide(1, :) SameCatSameSide(2, :) SameCatSameSide(3, :) SameCatSameSide(4, :) SameCatSameSide(5, :) SameCatSameSide(6, :)...
% SameCatOtherSide(1, :) SameCatOtherSide(2, :) SameCatOtherSide(3, :) SameCatOtherSide(4, :) SameCatOtherSide(5, :) SameCatOtherSide(6, :)...
% OtherCatSameSide(1, :) OtherCatSameSide(2, :) SameCatSameSide(3, :) SameCatSameSide(4, :) SameCatSameSide(5, :) SameCatSameSide(6, :)...
% OtherCatOtherSide(1, :) OtherCatOtherSide(2, :) OtherCatOtherSide(3, :) OtherCatOtherSide(4, :) OtherCatOtherSide(5, :) OtherCatOtherSide(6, :)];
% 
% 
% % 
% % contextLabels = [SCatSSide, SCatSSide, SCatSSide, SCatSSide, SCatSSide, SCatSSide,...
% % SCatDSide, SCatDSide, SCatDSide, SCatDSide, SCatDSide, SCatDSide,...
% % DCatSSide, DCatSSide, DCatSSide, DCatSSide, DCatSSide, DCatSSide,...
% % DCatDSide, DCatDSide, DCatDSide, DCatDSide, DCatDSide, DCatDSide];
% % 
% % TRLabels = [1:18, 1:18, 1:18, 1:18, 1:18, 1:18,...
% % 1:18, 1:18, 1:18, 1:18, 1:18, 1:18,...
% % 1:18, 1:18, 1:18, 1:18, 1:18, 1:18,...
% % 1:18, 1:18, 1:18, 1:18, 1:18, 1:18];
% % 
% % subjectLabels = [subject1, subject2, subject3, subject4, subject5, subject6,...
% % subject1, subject2, subject3, subject4, subject5, subject6,...
% % subject1, subject2, subject3, subject4, subject5, subject6,...
% % subject1, subject2, subject3, subject4, subject5, subject6];
% % 
% % 
% % [pO, anovatabO, statsO] = anovan(evidenceValues, { TRLabels, contextLabels, subjectLabels})
% % [cO,~,~,gnamesO] = multcompare(statsO)
% % 
% % [pO2, anovatabO2, statsO2] = anova2([SameCatSameSide; SameCatOtherSide; OtherCatSameSide; OtherCatOtherSide])
% % [cO2,~,~,gnamesO2] = multcompare(statsO2)
% % 
% % x1 = [1:18, 1:18, 1:18, 1:18, 1:18, 1:18];
% % [y1,S,mu] = polyfit(x1, [SameCatSameSide(1, :) SameCatSameSide(2, :) SameCatSameSide(3, :) SameCatSameSide(4, :) SameCatSameSide(5, :) SameCatSameSide(6, :)],3)
% % plot(x1,y1)
