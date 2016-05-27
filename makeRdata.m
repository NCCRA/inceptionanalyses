clear;

LearningListStimulusKind = [3 1 4 2];
%category 1 = left face = global learning list 3
%category 2 = right face = global learning list 1
%category 3 = left scence = global learning list 4
%category 4 = right scence = global learning list 2


subjectCount = 0;

%for overallsubject = [12 15 18 20 25];
 for   overallsubject = [12 15 18 20 25 28 29 33 34 35];
    subjectCount = subjectCount + 1;
    subjectnumber = ['Subject' num2str(overallsubject)];
    
    a= load([subjectnumber 'parsedData_leftrightfacescene']);
    parsedData = a.parsedData;
  
    
    %matrix = tr columns, trial rows
    ThresholdMatrix = zeros(60, 18);
    trialCount = 0;

    for block = 1:5
        for trial = 1:12
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
    subject{subjectCount}.SameCatSameSide = SameCatSameSide;
    subject{subjectCount}.SameCatOtherSide = SameCatOtherSide;
    subject{subjectCount}.OtherCatSameSide = OtherCatSameSide;
    subject{subjectCount}.OtherCatOtherSide = OtherCatOtherSide;
end

%one way anova for one subject
%[p,tbl,stats] = anova1(subject{1}.SameCatSameSide);
RData = [];

% I think this is how we do it correctly for n subjects?
subjects = [ones(1, 60*18) 2*ones(1, 60*18) 3*ones(1,60*18)...
    4*ones(1,60*18) 5*ones(1, 60*18)...
    6*ones(1, 60*18) 7*ones(1, 60*18) 8*ones(1,60*18)...
    9*ones(1,60*18) 10*ones(1, 60*18)]';
RData(:, 1) = subjects;

trials = [];
for i = 1:60
    newtrials = ones(18, 1);
    trials = [trials i*newtrials];
end
trials = trials(:);
trials = repmat(trials, [1, subjectCount]);
trials = trials(:);
RData(:, 2) = trials;
TRs = repmat([1:18], [1, 60]);
allTRs= repmat(TRs, [1, subjectCount])';
RData(:, 3) = allTRs;
reinstatementsVector = vertcat(subject{1}.SameCatSameSide(:),...
    subject{2}.SameCatSameSide(:), subject{3}.SameCatSameSide(:),...
    subject{4}.SameCatSameSide(:), subject{5}.SameCatSameSide(:),...
    subject{6}.SameCatSameSide(:),...
    subject{7}.SameCatSameSide(:), subject{8}.SameCatSameSide(:),...
    subject{9}.SameCatSameSide(:), subject{10}.SameCatSameSide(:));
RData(:, 4) = reinstatementsVector;


varnames = { 'subjects'; 'TRs'};
[p,tbl,stats] =anovan(reinstatementsVector', {subjects', allTRs'})
 multcompare(stats, 'Dimension', [2])

%let's bin this, so 2 trs per bin
for i = 1:subjectCount
subjectBins{i} = horzcat((subject{i}.SameCatSameSide(:, 1) + subject{i}.SameCatSameSide(:, 2)),...
    (subject{i}.SameCatSameSide(:, 3) + subject{i}.SameCatSameSide(:, 4)),... 
(subject{i}.SameCatSameSide(:, 5) + subject{i}.SameCatSameSide(:, 6)),... 
(subject{i}.SameCatSameSide(:, 7) + subject{i}.SameCatSameSide(:, 8)),... 
(subject{i}.SameCatSameSide(:, 9) + subject{i}.SameCatSameSide(:, 10)),... 
(subject{i}.SameCatSameSide(:, 11) + subject{i}.SameCatSameSide(:, 12)),... 
(subject{i}.SameCatSameSide(:, 13) + subject{i}.SameCatSameSide(:, 14)),... 
(subject{i}.SameCatSameSide(:, 15) + subject{i}.SameCatSameSide(:, 16)),... 
(subject{i}.SameCatSameSide(:, 17) + subject{i}.SameCatSameSide(:, 18)));
end

reinstatementBins = vertcat(subjectBins{1}(:),...
    subjectBins{2}(:), subjectBins{3}(:),...
    subjectBins{4}(:), subjectBins{5}(:),...
    subjectBins{6}(:),...
    subjectBins{7}(:), subjectBins{8}(:),...
    subjectBins{9}(:), subjectBins{10}(:));
subjectsBins = [ones(1, 60*9) 2*ones(1, 60*9) 3*ones(1,60*9)...
    4*ones(1,60*9) 5*ones(1, 60*9)...
    6*ones(1, 60*9) 7*ones(1, 60*9) 8*ones(1,60*9)...
    9*ones(1,60*9) 10*ones(1, 60*9)]';
trialsBins = repmat([1:9], [1, 60]);
 trials = [];
for i = 1:60
    newtrials = ones(9, 1);
    trials = [trials i*newtrials];
end
trials = trials(:);
trials = repmat(trials, [1, subjectCount]);
trials = trials(:);

allTRsBins= repmat(trialsBins, [1, subjectCount])';
[p,tbl,statsBins] =anovan(reinstatementBins', {subjectsBins', allTRsBins'})
 multcompare(statsBins, 'Dimension', [2])
    
 


