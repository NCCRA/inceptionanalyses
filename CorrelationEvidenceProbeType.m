function Correlations = CorrelationEvidenceProbeType(parsedDataType)

if parsedDataType == 0
    parsedDataType = 'leftrightfacescene_EvidenceAtProbe.mat';
end

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
%     for overallsubject = [15 18 20]; %low imagery
%for overallsubject = [12 25 29 30 34]; %highimagery
%for overallsubject = [15 18 20 28 33 35] % low imagery
%good behavioral subjects =  [12 15 16 18 20 25 28 29 33 34 35];

temporarySolution = [15 18 19 29 28 29 30 33 34 35 37 39 40:44];
%load('goodfMRISubjects');
for overallsubject = temporarySolution
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
            kindMatch = blockData(block+16).trialData(trial).kindMatch
                %we only want to do this when there's a real RT
                if blockData(block+16).trialData(trial).RT > 0
            if parsedData(block, trial).Category == 1
                SameCatSameSide{kindMatch}(kindCount(kindMatch))  = sum(parsedData(block, trial).leftFace);
            elseif parsedData(block, trial).Category == 2
                SameCatSameSide{kindMatch}(kindCount(kindMatch))  = sum(parsedData(block, trial).rightFace);
            elseif parsedData(block, trial).Category ==3
                SameCatSameSide{kindMatch}(kindCount(kindMatch))  = sum(parsedData(block, trial).leftScene);
            elseif parsedData(block, trial).Category ==4
                SameCatSameSide{kindMatch}(kindCount(kindMatch))  = sum(parsedData(block, trial).rightScene);
            end
             TrialRT{kindMatch}(kindCount(kindMatch)) = blockData(block+16).trialData(trial).RT;
             kindCount(kindMatch) = kindCount(kindMatch) + 1; 
               
        end
        end         
    end
   %% 
   
   a = corrcoef(SameCatSameSide{1}, TrialRT{1});
    CorProbeType1(subjectCount) = a(2);
    a = corrcoef(SameCatSameSide{2}, TrialRT{2});
    CorProbeType2(subjectCount) = a(2) ;
    a = corrcoef(SameCatSameSide{3}, TrialRT{3});
    CorProbeType3(subjectCount) = a(2);
    
end

CorProbeType1 = atanh(CorProbeType1);
CorProbeType2 = atanh(CorProbeType2);
CorProbeType3 = atanh(CorProbeType3);
Correlations = [CorProbeType1; CorProbeType2; CorProbeType3];

end

