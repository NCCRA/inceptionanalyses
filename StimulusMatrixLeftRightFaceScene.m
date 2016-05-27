%% StimulusMatrixMaker for left right scene face
%go thru mega blocks of localizer to determine what stimuli went with which
%TRs
subject = 2;
load('TRnums.mat')
TRnumbers = TRnums(subject) - 8;
firstTR = blockData(22).megaBlock(1).localizer(1).trialData(1).scannerSequence;
lastTR = blockData(22).megaBlock(3).localizer(8).trialData(10).picturePresentation + 8;
numberTRs = ceil(lastTR-firstTR);
runs = zeros(1, TRnumbers);
Stimuli = zeros(1, numberTRs);
StimuliMatrix = zeros(4, TRnumbers);
counter = 1;
lag = 0;
facescene = zeros(4, TRnumbers);

secondBlockTR = ceil(blockData(22).megaBlock(2).localizer(1).trialData(1).picturePresentation - firstTR);
thirdBlockTR = ceil(blockData(22).megaBlock(3).localizer(1).trialData(1).picturePresentation - firstTR);
endBlockTR = ceil(blockData(22).megaBlock(3).localizer(8).trialData(10).picturePresentation - firstTR);
runs(1:secondBlockTR+lag) = 1;
runs(secondBlockTR:thirdBlockTR+lag) = 2;
runs(thirdBlockTR:endBlockTR+1+lag) = 3;
runs(endBlockTR+1+lag:TRnumbers) = 4;
%1 = face on left, 2 = face on right
%3 = objects on left, 4 = objects on right
%5 = scene on left, 6 scene on right
%7 = scrambled scenes on left, 8 = scrambled scene on right

for mega = 1:3
    for mini = 1:8
        for trial = 1:10
            Stimuli(counter) = blockData(22).megaBlock(mega).localizer(mini).trialData(trial).pictureIndex;
            if Stimuli(counter) == 1
                if blockData(22).megaBlock(mega).localizer(mini).trialData(trial).showOnLeft
                    %StimuliMatrix(1, counter) = 1;
                    Stimulus = 1;
                else Stimulus = 0;
                end
            elseif Stimuli(counter) == 1
                if ~ blockData(22).megaBlock(mega).localizer(mini).trialData(trial).showOnLeft
                    %StimuliMatrix(3, counter) = 1;
                    Stimulus = 2;
                    else Stimulus = 0;
                end
            elseif Stimuli(counter) == 3
                if blockData(22).megaBlock(mega).localizer(mini).trialData(trial).showOnLeft
                    %StimuliMatrix(5, counter) = 1;
                    Stimulus = 3;
                    else Stimulus = 0;
                end
            elseif Stimuli(counter) == 3
                if ~blockData(22).megaBlock(mega).localizer(mini).trialData(trial).showOnLeft
                    %StimuliMatrix(7, counter) = 1;
                    Stimulus = 4;
                    else Stimulus = 0;
                end
            end
            
            TRTIME = ceil(blockData(22).megaBlock(mega).localizer(mini).trialData(trial).picturePresentation + lag-firstTR)
           if Stimulus >0
            StimuliMatrix(Stimulus, TRTIME:TRTIME+1) =1;
            facescene(Stimuli(counter), TRTIME:TRTIME+1) = 1;
           end
            TRs(counter) = blockData(22).megaBlock(mega).localizer(mini).trialData(trial).picturePresentation-...
                blockData(22).megaBlock(mega).localizer(mini).trialData(trial).scannerSequence;
            counter = counter +1;
        end
    end
end

leftrightfacesceneMatrixSubject2= StimuliMatrix;
save('leftrightfacesceneMatrixSubject2.mat', 'leftrightfacesceneMatrixSubject2');