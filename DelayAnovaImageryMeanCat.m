%% For each lure trial TR get:
% same context RT during lure trials
% same context reinstatement evidence
% Imagery for list

clear;

LearningListStimulusKind = [3 1 4 2];
%category 1 = left face = global learning list 3
%category 2 = right face = global learning list 1
%category 3 = left scence = global learning list 4
%category 4 = right scence = global learning list 2

load('ImageryList.mat')
subjectCount = 0;
trialCount = 0;
TRCount = [];

for overallsubject = [12 15 18 20 25 28 29 30 33 34 35];
    subjectCount = subjectCount + 1;
    subjectnumber = ['Subject' num2str(overallsubject)];
    load(['Subject' num2str(overallsubject) '.mat'])
    
    a= load([subjectnumber 'parsedData_leftrightfacescene']);
    parsedData = a.parsedData;
    
    
    %matrix = tr columns, trial rows
    ThresholdMatrix = zeros(20, 18);
    
    for block = 1:5
        for trial = 1:12
            %category 1 = left face = global learning list 3
            %category 2 = right face = global learning list 1
            %category 3 = left scence = global learning list 4
            %category 4 = right scence = global learning list 2
            blockiest = block + 16;
            trialKind = blockData(blockiest).trialData(trial).kindMatch;
            if trialKind == 2
                globalList = blockData(blockiest).trialData(trial).learningList;
                trialCount = trialCount + 1;
                if  blockData(blockiest).trialData(trial).RT > 50
                    RT(trialCount) = blockData(blockiest).trialData(trial).RT;
                    trtr = ((trialCount -1) * 18)+1;
                    RTTR(trtr : trtr+17) = repmat(blockData(blockiest).trialData(trial).RT,...
                        [1, 18]);
                    SubjTR(trtr : trtr+17) = repmat(subjectCount, [1, 18]);
                    Subject{trialCount} = num2str(subjectCount);
                else RT(trialCount) = NaN;
                end
                Imagery(trialCount) = ImageryList(overallsubject, globalList);
                ImageryTR(trtr : trtr+17) = repmat(ImageryList(overallsubject, globalList), [1, 18]);
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
                
                SumSameCat(trialCount) = sum(SameCatSameSide(trialCount, :));
                sameCat(trtr : trtr+17) = SameCatSameSide(trialCount, :) > ...
                    mean([SameCatOtherSide(trialCount,:), OtherCatOtherSide(trialCount,:),...
                    OtherCatSameSide(trialCount,:)]);
                    
                ThresholdMatrix(trialCount, :) =...
                    SameCatSameSide(trialCount, :) > SameCatOtherSide(trialCount, :) &...
                    SameCatSameSide(trialCount, :) > OtherCatSameSide(trialCount, :) &...
                    SameCatSameSide(trialCount, :) > OtherCatOtherSide(trialCount, :);
            end
        end
    end
    subject{subjectCount}.SameCatSameSide = SameCatSameSide;
    subject{subjectCount}.SameCatOtherSide = SameCatOtherSide;
    subject{subjectCount}.OtherCatSameSide = OtherCatSameSide;
    subject{subjectCount}.OtherCatOtherSide = OtherCatOtherSide;
end

TRCount = repmat([1:18], [1, length(sameCat)/18]);
%one way anova for one subject
%[p,tbl,stats] = anova1(subject{1}.SameCatSameSide);

%%
% Rdata = horzcat(RT', Imagery', SumSameCat');
%
% [p,tbl,stats] =anovan(RT', {Subject', Imagery', SumSameCat'}, 'model','interaction', 'varnames',{'Subject', 'Imagery', 'SumSameCat'});
%  %multcompare(stats, 'Dimension', [2])
%
%[p,tbl,stats] =anovan(RTTR', {SubjTR', TRCount', ImageryTR', sameCat'},'varnames',{'Subject', 'TR', 'Imagery', 'SumSameCat'});
%

[p,tbl,stats] =anovan(sameCat', {SubjTR',  TRCount'},'varnames',{'Subject', 'Imagery', 'TR'});

[p,tbl,stats] =anovan(RTTR', {SubjTR', ImageryTR',  TRCount', sameCat'},'model','interaction','varnames',{'Subject', 'Imagery', 'TR', 'sameCat'});

[p,tbl,stats] =anovan(RTTR', {SubjTR', ImageryTR'},'model','interaction','varnames',{'Subject', 'Imagery'});

[p,tbl,stats] =anovan(RTTR', {SubjTR', sameCat'},'model','interaction','varnames',{'Subject', 'SameCat'});

sameCat = sameCat';
SubjTR = SubjTR';
TRCount = TRCount';
