%%need to run find same context reinstatement threshold first

close all;
RTEffect = [-0.0589879110782301,0.00949946262450890,-0.361370830597142,-0.354335613918879,0.267803684767403,-0.241767650253364,-0.168115764422254,0.366498528404680,0.225965644613762,0.203297047893908,0.104681657210577];
figure(1)
for sub = 1:11
    subject(sub) = sum(SubjectThreshold(sub, :));
end
[B,BINT,R,RINT,STATS] = regress(subject', RTEffect') 
scatter(subject, RTEffect);
title(['sum of proportion of TRs over entire delay with same context = max context '...
    'vs. RT effect  r squared = ' num2str(B)]) 
ylabel('RT effect')
lsline

figure(2)
for sub = 1:11
    subject(sub) = sum(SubjectThreshold(sub, [6 7 10 11 12 13 15 16]));
end

[B,BINT,R,RINT,STATS] = regress(subject', RTEffect') 
scatter(subject, RTEffect);
title(['sum of proportion of TRs over 5:13 delay TRs with same context = max context '...
    'vs. RT effect  r squared = ' num2str(B)]) 
ylabel('RT effect')
lsline

figure(3)
for sub = 1:11
    subject(sub) = mean(SubjectThreshold(sub, :));
end

[B,BINT,R,RINT,STATS] = regress(subject', RTEffect') 
scatter(subject, RTEffect);
title(['mean proportion of TRs over entire delay with same context = max context '...
    'vs. RT effect  r squared = ' num2str(B)]) 
ylabel('RT effect')
lsline

for sub = 1:11
    subject(sub) = mean(SubjectThreshold(sub, 5:13));
end

figure(4)
mdl = fitlm(subject, RTEffect) 
scatter(subject, RTEffect);
title(['mean proportion of TRs over 5:13 delay TRs with same context = max context '...
    'vs. RT effect  r squared = ' num2str(mdl.Rsquared.Ordinary)]) 
ylabel('RT effect')
lsline