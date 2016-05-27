clear;
%% Make trial by trial evidence by RT

%     for each subject, for each collapse condition, for each same vs. other condition:
%                 plot RT vs. same evidence - other evidence per trial
%                 might want to restrict to different parts of the delay

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



subjectCount = 0;
%high imagery subjects = 12 16 17 19 24 25
%low imagery subjects = 11 15 18 20 22 26
%for overallsubject = [12 15 16 18 20 25];

for overallsubject = [12 15 16 18 20 25]
    subjectCount = subjectCount + 1;
    subjectnumber = ['Subject' num2str(overallsubject)];
    load([subjectnumber '.mat']);
    a= load([subjectnumber 'parsedData_leftrightfacescene.mat']);
    parsedData = a.parsedData;
%for this one, we'll be looking at face vs. scene
    faceCount1 = 1;
    for block = 1:5
        for trial = 1:12
            %we only want to do this on the same context/lure trials
            if blockData(block+16).trialData(trial).kindMatch == 2
                %we only want to do this when there's a real RT
                if blockData(block+16).trialData(trial).RT > 0
            %category 1 = left face = global learning list 3
            %category 2 = right face = global learning list 1
            %category 3 = left scence = global learning list 4
            %category 4 = right scence = global learning list 2
            if parsedData(block, trial).Category <3 
                SameCat = parsedData(block, trial).leftFace + parsedData(block, trial).rightFace;
                OtherCat = parsedData(block, trial).leftScene + parsedData(block, trial).rightScene;
                faceCount1 = faceCount1 + 1;
            elseif parsedData(block, trial).Category >2
                SameCat = parsedData(block, trial).leftScene + parsedData(block, trial).rightScene;
                OtherCat = parsedData(block, trial).leftFace + parsedData(block, trial).rightFace;
                faceCount1 = faceCount1 + 1;
            end
            trialEvidence(faceCount1) = sum(SameCat) - sum(OtherCat);
            RT(faceCount1) = blockData(block+16).trialData(trial).RT;
            end
        end
        end
    end

figure(subjectCount)
hold on
title(['Subject ' num2str(overallsubject) ': Same - Other Category Evidence during DNMS Delay * RT'])

scatter(trialEvidence, RT)
mdl = fitlm(trialEvidence, RT);
legend({['r squared = ' num2str(mdl.Rsquared.Ordinary)]})
    
lsline

xlabel('Same-Other Category Evidence')
ylabel('RT')
hold off
allevidence(subjectCount, :) = trialEvidence(2:length(trialEvidence));
allRTs(subjectCount, :) = RT(2:length(RT));
end
scatter(allevidence(:), allRTs(:))
lsline
mdl = fitlm(allevidence(:), allRTs(:));
