rt1 = [NaN];
accuracy1 = [NaN];
rt2 = [NaN];
accuracy2 = [NaN];
rt3 = [NaN];
accuracy3 = [NaN];

for block = 17:21
    for trial = 1:12
        if  blockData(block).trialData(trial).RT > 0
            if blockData(block).trialData(trial).kindMatch == 1
            
        rt1(length(rt1) +1)...
            = blockData(block).trialData(trial).RT;
    accuracy1(length(accuracy1) +1)...
            = blockData(block).trialData(trial).accuracy;
            elseif blockData(block).trialData(trial).kindMatch ==2
                        rt2(length(rt2) +1)...
            = blockData(block).trialData(trial).RT;
    accuracy2(length(accuracy2) +1)...
            = blockData(block).trialData(trial).accuracy;
                 elseif blockData(block).trialData(trial).kindMatch ==3
                rt3(length(rt3) +1)...
            = blockData(block).trialData(trial).RT;
    accuracy3(length(accuracy3) +1)...
            = blockData(block).trialData(trial).accuracy;
        end
    end
    end
end

figure(1)
plot([nanmean(rt1), nanmean(rt2), nanmean(rt3)]);
    figure(2)
plot([nanmean(accuracy1), nanmean(accuracy2), nanmean(accuracy3)]);