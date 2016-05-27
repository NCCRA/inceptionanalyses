
Correlations = CorrelationEvidenceProbeType(0)

stds = [std(Correlations(:, 1))/sqrt(length(Correlations(:,1)))...
    std(Correlations(:, 2))/sqrt(length(Correlations(:, 2)))...
    std(Correlations(:, 3))/sqrt(length(Correlations(:, 3)))];

    
    figure(1)
hold on
title(['All Subjects Sum of Same Category Evidence during DNMS Delay * RT'])

errorbar([1 2 3], [mean(Correlations(:, 1)), mean(Correlations(:,2)), mean(Correlations(:, 3))], stds);
ax = gca;
ylim([-.3 .6])
ax.XTick = [1 2 3];
ax.XTickLabel = {'TargetProbe', 'LureProbeFromSameContext', 'OtherContextProbe'};
xlabel('Trial Type')
ylabel('Correlation between same context reinstatement and RT')
hold off