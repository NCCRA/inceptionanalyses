%%% Need to get delay TRs + conditions for each run & subject
%%% Need to figure out which lists were in which conditions for each
%%% subject

listConditions = [0 0 0 0];
for learningListRun = 1:16
    listConditions(blockData(learningListRun).trialData(1).globalLearningList) = blockData(learningListRun).trialData(1).leftright;
end

if listConditions(1) == 0
    listConditions(1) =2;
elseif listConditions(1) == 1
    listConditions(1) = 2;
end
if listConditions(2) == 0
    listConditions(2) = 6;
elseif listConditions(2) == 1
    listConditions(2) = 5;
end
if listConditions(3) == 0
    listConditions(3) = 2;
elseif listConditions(3) == 1
    listConditions(3) = 1;
end
if listConditions(4) == 0
    listConditions(4) = 6;
elseif listConditions(4) == 1
    listConditions(4) = 5;
end


lag = 5;
subject = 2;
%%for each DNMS run do:

for run = 1:5
%     Subject5_DNMS_Data.DNMSruns{run}= ones(1, 370);
%     Subject5_DNMS_Data.DNMSselector{run} = zeros(1, 370);
%     Subject5_DNMS_Data.TRConditions{run} = zeros(1, 12);
%     Subject5_DNMS_Data.TRKindMatch{run} = zeros(1, 12);
%     Subject5_DNMS_Data.TRRTs{run} = zeros(1, 12)
%     Subject5_DNMS_Data.DelayStart{run} = zeros(1,12);
    firstDNMSTR = blockData(run+16).trialData(1).scannerSeqeunceStart;
    for i = 1:12
        TRTIME = blockData(run+16).trialData(i).targetWordPresentation-firstDNMSTR;
        Subject5_DNMS_Data.delayTR{run}(i) = TRTIME;
        Subject5_DNMS_Data.sameEvidence{run}(i) = 0;
        Subject5_DNMS_Data.ptherEvidence{run}(i) = 0;
        Subject5_DNMS_Data.cat{run}(i) = listConditions(blockData(run+16).trialData(i).learningList);
        Subject5_DNMS_Data.probeType{run}(i) = blockData(run+16).trialData(i).kindMatch;
        
        if (blockData(run+16).trialData(i).RT > 0)
        Subject5_DNMS_Data.RT{run}(i) = blockData(run+16).trialData(i).RT;
        else
            Subject5_DNMS_Data.RT{run}(i) = NaN;
        end
    end
end

save('Subject5_DNMS_Data', 'Subject5_DNMS_Data');

