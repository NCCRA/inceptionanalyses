%fmri data
%run1 = localizer
%run2 = grefieldmapping
%run3 = grefieldmapping
%run4 = mprage
%run5 = listlearn
%run6 = DNMS1
%run7 = DNMS2
%run8 = DNMS3
%run9 = DNMS4
%run10 = DNMS5
%run11 = object face scene localizer
%run12 = speaking recall portion, ignore for now?

%behavioral data
%blockdata(1:16) = cells with 3 trials each.
%       Each blockdata cell = 1 run through 1 learning list
%blockdata(17:21) = DNMS.  we did 5 DNMS runs
%blockdata(22) = megablock of face scene object localizer
%   megablock(1:3) = 3 runs of the localizer mini blocks
%blockdata(24) = free recall data

%How to get TR and condition data from blockdata?
%   Reminder, we had 1 second TRs, so timing is easily divisible by 1s
% %blockdata(1:16) 
% %   globalLearningList gives condition 
% %   beginResponse tells you how long from beginning of scanner run
% %   wordsAndPicture
% %   justPicture
% %blockdata(17:21)
% %   learningList
% %   targetWordPresentation
% %blockdata(24)
% %   pictureIndex
% %   picturePresentation

%We need to decide which TRs are actually important since we have a bunch
%of options.

%what does each learning list and picture index mean?
%learning lists:
% % learning list 1 = face
% % learning list 2 = scene
% % learning list 3 = face
% % learning list 4 = scene
%picture index for localizer
% %1 = face on left, 2 = face on right
% %3 = objects on left, 4 = objects on right
% %5 = scene on left, 6 scene on right
% %7 = scrambled scenes on left, 8 = scrambled scene on right

