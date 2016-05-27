clear;

LearningListStimulusKind = [3 1 4 2];
%category 1 = left face = global learning list 3
%category 2 = right face = global learning list 1
%category 3 = left scence = global learning list 4
%category 4 = right scence = global learning list 2


subjectCount = 0;

%for overallsubject = [12 15 18 20 25];
for overallsubject = [12 15 18 20 25 28 29 33 34 35]
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
    subject{subjectCount}.BinaryMatrix = ThresholdMatrix;
end


% I think this is how we do it correctly?
subjects = [ones(1, 60*18) 2*ones(1, 60*18) 3*ones(1,60*18)...
    4*ones(1,60*18) 5*ones(1, 60*18)]';
trials = repmat([1:18], [1, 60]);
allTRs= repmat(trials, [1, 5])';
reinstatementsVector = vertcat(subject{1}.BinaryMatrix(:), subject{2}.BinaryMatrix(:), subject{3}.BinaryMatrix(:), subject{4}.BinaryMatrix(:), subject{5}.BinaryMatrix(:));
varnames = { 'subjects'; 'TRs'};
[p,tbl,stats] = anovan(reinstatementsVector', {subjects', allTRs'})

 multcompare(stats, 'Dimension', [2])
 
 
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
    subjectBins{4}(:), subjectBins{5}(:));
subjectsBins = [ones(1, 60*9) 2*ones(1, 60*9) 3*ones(1,60*9)...
    4*ones(1,60*9) 5*ones(1, 60*9)]';
trialsBins = repmat([1:9], [1, 60]);
allTRsBins= repmat(trialsBins, [1, subjectCount])';
[p,tbl,statsBins] =anovan(reinstatementBins', {subjectsBins', allTRsBins'})
 multcompare(statsBins, 'Dimension', [2])
    





