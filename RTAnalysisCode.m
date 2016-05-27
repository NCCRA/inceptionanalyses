clear
%spreadsheet has a lot of data.  Below is the key for the columns
% 1Subject	2block	3trial	4correct words	5actual response	6#substitutions
%7substituted words	8substitute list	9mistake in previous list?	10learning list #
% 11interference type	12RT	13mismatch Word	14mismatch kind	15mismatch new word
% 16mismatch seenit	17mismatch testlist	18 mismatch accuracy
% 19 task switch  20 same finger  21 index finger  22 left/right
% 23 target/probe on same side? 24 targets from left or right 25 probe from
% left or right 26 target was face or scene 27 probe was face or scene


% file = 'subject118.xlsx';
% data = xlsread(file);
% rt = data(:, 13);
% lrt = log(rt);
% zlrt= (lrt - nanmean(lrt))/nanstd(lrt);

% 
file1 = 'Subject2fMRI.xlsx';
data1 = xlsread(file1);
data1 = data1(1:60, :);
rt1 = data1(:, 13);
lrt1 = log(rt1);
zlrt1= (lrt1 - nanmean(lrt1))/nanstd(lrt1);

file2 = 'Subject3fMRI.xlsx';
data2 = xlsread(file2);
data2 = data2(1:60, :);
rt2 = data2(:, 13);
lrt2 = log(rt2);
zlrt2= (lrt2 - nanmean(lrt2))/nanstd(lrt2);

file3 = 'Subject5fMRI.xlsx';
data3 = xlsread(file3);
data3 = data3(1:60, :);
rt3 = data3(:, 13);
lrt3 = log(rt3);
zlrt3= (lrt3 - nanmean(lrt3))/nanstd(lrt3);

file4 = 'Subject6fMRI.xlsx';
data4 = xlsread(file4);
data4 = data4(1:60, :);
rt4 = data4(:, 13);
lrt4 = log(rt4);
zlrt4= (lrt4 - nanmean(lrt4))/nanstd(lrt4);

file5 = 'Subject7fMRI.xlsx';
data5 = xlsread(file5);
data5 = data5(1:60, :);
rt5 = data5(:, 13);
lrt5 = log(rt5);
zlrt5= (lrt5 - nanmean(lrt5))/nanstd(lrt5);

file6 = 'Subject9fMRI.xlsx';
data6 = xlsread(file6);
data6 = data6(1:60, :);
rt6 = data6(:, 13);
lrt6 = log(rt6);
zlrt6= (lrt6 - nanmean(lrt6))/nanstd(lrt6);

file7 = 'Subject10fMRI.xlsx';
data7 = xlsread(file7);
data7 = data7(1:60, :);
rt7 = data7(:, 13);
lrt7 = log(rt7);
zlrt7= (lrt7 - nanmean(lrt7))/nanstd(lrt7);



%full set
 data = vertcat(data1, data2, data3, data4, data5, data6, data7);
   rt = vertcat(rt1, rt2, rt3, rt4, rt5, rt6, rt7);
   lrt =vertcat(lrt1, lrt2, lrt3, lrt4, lrt5, lrt6, lrt7);
  zlrt = vertcat(zlrt1, zlrt2, zlrt3, zlrt4, zlrt5, zlrt6, zlrt7);

%high imagery
%  data = vertcat(data1,data3, data4, data6, data7, ...
%      data11,   data14, ...
%     data19, data22,  data24, data25, data26,...
%    data29, data30, data31, data33);
%    rt = vertcat(rt1, rt3, rt4, rt6, rt7,  rt11, ...
%        rt14,rt19,  rt22,  rt24, rt25,...
%     rt26,  rt29, rt30, rt31,  rt33);
%    lrt =vertcat(lrt1,lrt3, lrt4, lrt6, lrt7, lrt11,...
%      lrt14, lrt19,...
%      lrt22, lrt24, lrt25, lrt26, lrt29, lrt30, lrt31, lrt33);
%   zlrt = vertcat(zlrt1, zlrt3, zlrt4,zlrt6, zlrt7, ...
%    zlrt11,zlrt14, zlrt19,...
%    zlrt22, zlrt24, zlrt25, zlrt26,zlrt29, zlrt30, zlrt31, zlrt33);

% % %low imagery
%  lowdata = vertcat(data2, data5, data8, data9,...
%      data10, data12, data13, data15, data16, data18,...
%      data20, data21, data23, data27,...
%     data28,  data32);
%    rt = vertcat(rt2,rt5,  rt8, rt9, rt10,rt12, rt13,...
%        rt15, rt16,  rt18,  rt20, rt21, rt23,...
%     rt27, rt28, rt32);
%    lrt =vertcat( lrt2,  lrt5, lrt8, lrt9, lrt10, ...
%      lrt12, lrt13,  lrt15, lrt16,  lrt18, lrt20, lrt21,...
%      lrt23,  lrt27, lrt28,  lrt32);
%   zlrt = vertcat(zlrt2,  zlrt5,  zlrt8, zlrt9,...
%    zlrt10,  zlrt12, zlrt13,zlrt15, zlrt16, zlrt18, zlrt20, zlrt21,...
%   zlrt23,zlrt27, zlrt28,  zlrt32);



% 1Subject	2block	3trial	4correct words	5actual response	6#substitutions
%7substituted words	8substitute list	9mistake in previous list?	10learning list #
% 11interference type	12RT	13mismatch Word	14mismatch kind	15mismatch new word
% 16mismatch seenit	17mismatch testlist	18 mismatch accuracy
% 19 task switch  20 same finger  21 index finger  22 left/right
% 23 target/probe on same side? 24 targets from left or right 25 probe from
% left or right 26 target was face or scene 27 probe was face or scene

%need to bin first by mismatch kind
% GLM_mismatchkind{1=1, 2=switch, 3=block, 4=error, 5=trial}
% mismatchkind = {1=rt, 2=zrt}
tw_count =1; sl_count =1; rw_count =1;
tw_countSameSide =1; sl_countSameSide =1; rw_countSameSide =1;
tw_countOppSide =1; sl_countOppSide =1; rw_countOppSide =1;
tw_countSameStim =1; sl_countSameStim =1; rw_countSameStim =1;
tw_countDiffStim =1; sl_countDiffStim =1; rw_countDiffStim =1;
accuracy_target = []; atcount = 1;
accuracy_same = []; ascount = 1;
accuracy_different = []; adcount = 1;


for i = 1: length(data)
    if data(i, 14+1) == 1
        target_word(tw_count, 1) = data(i, 12+1);
        target_word(tw_count, 2) = zlrt(i);
        target_word(tw_count, 3) =lrt(i);
        target_word(tw_count, 4) = data(i, 19);
        GLM_target_word(tw_count, 1) = 1;
        GLM_target_word(tw_count, 3) = data(i, 2+1);
        GLM_target_word(tw_count, 4) = data(i, 18+1);
        GLM_target_word(tw_count, 2) = data(i, 3+1);
        tw_count = tw_count + 1;
        if data(i, 24+1) == data(i, 25+1) %target probe on same side
            target_wordSameSide(tw_countSameSide, 1) = data(i, 12+1);
            target_wordSameSide(tw_countSameSide, 2) = zlrt(i);
            target_wordSameSide(tw_countSameSide, 3) =lrt(i);
            target_wordSameSide(tw_countSameSide, 4) = data(i, 19);
            GLM_target_wordSameSide(tw_countSameSide, 1) = 1;
            GLM_target_wordSameSide(tw_countSameSide, 3) = data(i, 2+1);
            GLM_target_wordSameSide(tw_countSameSide, 4) = data(i, 18+1);
            GLM_target_wordSameSide(tw_countSameSide, 2) = data(i, 3+1);
            tw_countSameSide = tw_countSameSide + 1;
        else
            target_wordOppSide(tw_countOppSide, 1) = data(i, 12+1);
            target_wordOppSide(tw_countOppSide, 2) = zlrt(i);
            target_wordOppSide(tw_countOppSide, 3) =lrt(i);
            target_wordOppSide(tw_countOppSide, 4) = data(i, 19);
            GLM_target_wordOppSide(tw_countOppSide, 1) = 1;
            GLM_target_wordOppSide(tw_countOppSide, 3) = data(i, 2+1);
            GLM_target_wordOppSide(tw_countOppSide, 4) = data(i, 18+1);
            GLM_target_wordOppSide(tw_countOppSide, 2) = data(i, 3+1);
            tw_countOppSide = tw_countOppSide + 1;
        end
        if data(i, 26+1) == data(i, 27+1) %targets and probes were both faces or both scenes
            target_wordSameStim(tw_countSameStim, 1) = data(i, 12+1);
            target_wordSameStim(tw_countSameStim, 2) = zlrt(i);
            target_wordSameStim(tw_countSameStim, 3) =lrt(i);
            target_wordSameStim(tw_countSameStim, 4) = data(i, 19);
            GLM_target_wordSameStim(tw_countSameStim, 1) = 1;
            GLM_target_wordSameStim(tw_countSameStim, 3) = data(i, 2+1);
            GLM_target_wordSameStim(tw_countSameStim, 4) = data(i, 18+1);
            GLM_target_wordSameStim(tw_countSameStim, 2) = data(i, 3+1);
            tw_countSameStim = tw_countSameStim + 1;
        else
            target_wordDiffStim(tw_countDiffStim, 1) = data(i, 12+1);
            target_wordDiffStim(tw_countDiffStim, 2) = zlrt(i);
            target_wordDiffStim(tw_countDiffStim, 3) =lrt(i);
            target_wordDiffStim(tw_countDiffStim, 4) = data(i, 19);
            GLM_target_wordDiffStim(tw_countDiffStim, 1) = 1;
            GLM_target_wordDiffStim(tw_countDiffStim, 3) = data(i, 2+1);
            GLM_target_wordDiffStim(tw_countDiffStim, 4) = data(i, 18+1);
            GLM_target_wordDiffStim(tw_countDiffStim, 2) = data(i, 3+1);
            tw_countDiffStim = tw_countDiffStim + 1;
        end
    elseif data(i, 14+1) == 2
        same_list(sl_count, 1) = data(i, 12+1);
        same_list(sl_count, 2) = zlrt(i);
        same_list(sl_count, 3) =lrt(i);
        same_list(sl_count, 4) = data(i, 19);
        GLM_same_list(sl_count, 1) = 1;
        GLM_same_list(sl_count, 3) = data(i, 2+1);
        GLM_same_list(sl_count, 4) = data(i, 18+1);
        GLM_same_list(sl_count, 2) = data(i, 3+1);
        sl_count = sl_count + 1;
        if data(i, 24+1) == data(i, 25+1) %target probe on same side
            same_listSameSide(sl_countSameSide, 1) = data(i, 12+1);
            same_listSameSide(sl_countSameSide, 2) = zlrt(i);
            same_listSameSide(sl_countSameSide, 3) =lrt(i);
            same_listSameSide(sl_countSameSide, 4) = data(i, 19);
            GLM_same_listSameSide(sl_countSameSide, 1) = 1;
            GLM_same_listSameSide(sl_countSameSide, 3) = data(i, 2+1);
            GLM_same_listSameSide(sl_countSameSide, 4) = data(i, 18+1);
            GLM_same_listSameSide(sl_countSameSide, 2) = data(i, 3+1);
            sl_countSameSide = sl_countSameSide + 1;
        else
            same_listOppSide(sl_countOppSide, 1) = data(i, 12+1);
            same_listOppSide(sl_countOppSide, 2) = zlrt(i);
            same_listOppSide(sl_countOppSide, 3) =lrt(i);
            same_listOppSide(sl_countOppSide, 4) = data(i, 19);
            GLM_same_listOppSide(sl_countOppSide, 1) = 1;
            GLM_same_listOppSide(sl_countOppSide, 3) = data(i, 2+1);
            GLM_same_listOppSide(sl_countOppSide, 4) = data(i, 18+1);
            GLM_same_listOppSide(sl_countOppSide, 2) = data(i, 3+1);
            sl_countOppSide = sl_countOppSide + 1;
        end
        if data(i, 26+1) == data(i, 27+1) %targets and probes were both faces or both scenes
            same_listSameStim(sl_countSameStim, 1) = data(i, 12+1);
            same_listSameStim(sl_countSameStim, 2) = zlrt(i);
            same_listSameStim(sl_countSameStim, 3) =lrt(i);
            same_listSameStim(sl_countSameStim, 4) = data(i, 19);
            GLM_same_listSameStim(sl_countSameStim, 1) = 1;
            GLM_same_listSameStim(sl_countSameStim, 3) = data(i, 2+1);
            GLM_same_listSameStim(sl_countSameStim, 4) = data(i, 18+1);
            GLM_same_listSameStim(sl_countSameStim, 2) = data(i, 3+1);
            sl_countSameStim = sl_countSameStim + 1;
        else
            same_listDiffStim(sl_countDiffStim, 1) = data(i, 12+1);
            same_listDiffStim(sl_countDiffStim, 2) = zlrt(i);
            same_listDiffStim(sl_countDiffStim, 3) =lrt(i);
            same_listDiffStim(sl_countDiffStim, 4) = data(i, 19);
            GLM_same_listDiffStim(sl_countDiffStim, 1) = 1;
            GLM_same_listDiffStim(sl_countDiffStim, 3) = data(i, 2+1);
            GLM_same_listDiffStim(sl_countDiffStim, 4) = data(i, 18+1);
            GLM_same_listDiffStim(sl_countDiffStim, 2) = data(i, 3+1);
            sl_countDiffStim = sl_countDiffStim + 1;
        end
    elseif data(i, 14+1) == 3
        random_word(rw_count, 1) = data(i, 12+1);
        random_word(rw_count, 2) = zlrt(i);
        random_word(rw_count, 3) =lrt(i);
        random_word(rw_count, 4) = data(i, 19);
        GLM_random_word(rw_count, 1) = 1;
        GLM_random_word(rw_count, 2) = data(i, 3+1);
        GLM_random_word(rw_count, 3) = data(i, 2+1);
        GLM_random_word(rw_count, 4) = data(i, 18+1);
        rw_count = rw_count + 1;
        if data(i, 24+1) == data(i, 25+1) %target probe on same side
            random_wordSameSide(rw_countSameSide, 1) = data(i, 12+1);
            random_wordSameSide(rw_countSameSide, 2) = zlrt(i);
            random_wordSameSide(rw_countSameSide, 3) =lrt(i);
            random_wordSameSide(rw_countSameSide, 4) = data(i, 19);
            GLM_random_wordSameSide(rw_countSameSide, 1) = 1;
            GLM_random_wordSameSide(rw_countSameSide, 2) = data(i, 3+1);
            GLM_random_wordSameSide(rw_countSameSide, 3) = data(i, 2+1);
            GLM_random_wordSameSide(rw_countSameSide, 4) = data(i, 18+1);
            rw_countSameSide = rw_countSameSide + 1;
        else
            random_wordOppSide(rw_countOppSide, 1) = data(i, 12+1);
            random_wordOppSide(rw_countOppSide, 2) = zlrt(i);
            random_wordOppSide(rw_countOppSide, 3) =lrt(i);
            random_wordOppSide(rw_countOppSide, 4) = data(i, 19);
            GLM_random_wordOppSide(rw_countOppSide, 1) = 1;
            GLM_random_wordOppSide(rw_countOppSide, 2) = data(i, 3+1);
            GLM_random_wordOppSide(rw_countOppSide, 3) = data(i, 2+1);
            GLM_random_wordOppSide(rw_countOppSide, 4) = data(i, 18+1);
            rw_countOppSide = rw_countOppSide + 1;
        end
        if data(i, 26+1) == data(i, 27+1) %targets and probes were both faces or both scenes
            random_wordSameStim(rw_countSameStim, 1) = data(i, 12+1);
            random_wordSameStim(rw_countSameStim, 2) = zlrt(i);
            random_wordSameStim(rw_countSameStim, 3) =lrt(i);
            random_wordSameStim(rw_countSameStim, 4) = data(i, 19);
            GLM_random_wordSameStim(rw_countSameStim, 1) = 1;
            GLM_random_wordSameStim(rw_countSameStim, 2) = data(i, 3+1);
            GLM_random_wordSameStim(rw_countSameStim, 3) = data(i, 2+1);
            GLM_random_wordSameStim(rw_countSameStim, 4) = data(i, 18+1);
            rw_countSameStim = rw_countSameStim + 1;
        else
            random_wordDiffStim(rw_countDiffStim, 1) = data(i, 12+1);
            random_wordDiffStim(rw_countDiffStim, 2) = zlrt(i);
            random_wordDiffStim(rw_countDiffStim, 3) =lrt(i);
            random_wordDiffStim(rw_countDiffStim, 4) = data(i, 19);
            GLM_random_wordDiffStim(rw_countDiffStim, 1) = 1;
            GLM_random_wordDiffStim(rw_countDiffStim, 2) = data(i, 3+1);
            GLM_random_wordDiffStim(rw_countDiffStim, 3) = data(i, 2+1);
            GLM_random_wordDiffStim(rw_countDiffStim, 4) = data(i, 18+1);
            rw_countDiffStim = rw_countDiffStim + 1;
        end
    end
end


    
figure(3)
hold on;
errors = [(nanstd(target_word(:, 4))/sqrt(length(target_word(:, 4)))),...        
(nanstd(same_list(:, 4))/sqrt(length(same_list(:, 4)))),...
        (nanstd(random_word(:, 4))/sqrt(length(random_word(:, 4))))]

errorbar([mean(target_word(:,4)), mean(same_list(:, 4)), mean(random_word(:, 4))], errors, 'blue');
  title('Accuracy by Trial Type')
    xlabel('1 = target word, 2 = same list word, 3 = different list word')
    ylabel('Accuracy in DNMS')

    ylim([.8 1]);

    hold off;
figure(1)
    errorbar([nanmean(target_word(:, 1)), nanmean(same_list(:, 1)), nanmean(random_word(:, 1))],...
        [nanstd(target_word(:, 1))/sqrt(length(target_word(:, 1))),...
        nanstd(same_list(:, 1))/sqrt(length(same_list(:, 1))),...
        nanstd(random_word(:, 1))/sqrt(length(random_word(:, 1)))], 'red');
    %plot([1, 2, 3], [mean(target_word(:, 1)), mean(same_list(:, 1)), mean(random_word(:, 1))], 'red');
    title('raw reaction times')
    xlabel('1 = target word, 2 = same list word, 3 = different list word')
    ylabel('ms')
    
    figure(2)
    errorbar([nanmean(target_word(:, 2)), nanmean(same_list(:, 2)), nanmean(random_word(:, 2))],...
        [nanstd(target_word(:, 2))/sqrt(length(target_word(:, 2))),...
        nanstd(same_list(:, 2))/sqrt(length(same_list(:, 2))),...
        nanstd(random_word(:, 2))/sqrt(length(random_word(:, 2)))], 'blue');
    %plot([1, 2, 3], [mean(target_word(:, 2)), mean(same_list(:, 2)), mean(random_word(:, 2))], 'blue');
    title('zscored reaction times')
    xlabel('1 = target word, 2 = same list word, 3 = different list word')
    
    
    grand_GLM = [horzcat(ones(length(data), 1), data(:, 4), data(:, 3), data(:, 19))];
    [BigB, BigBI, BigR] = regress(zlrt, grand_GLM);
    tw_count =1; sl_count =1; rw_count =1;
    for i = 1: length(data)
        if data(i, 14+1) == 1
            grandTarget(tw_count) = BigR(i);
            tw_count = tw_count +1;
        elseif data(i, 14+1) == 2
            grandSame(sl_count) = BigR(i);
            sl_count = sl_count + 1;
        elseif data(i, 14+1) ==3
            grandRandom(rw_count) = BigR(i);
            rw_count = rw_count +1;
        end
    end
    
    figure(3)
    hold on
    %plot([1 2 3], [nanmean(grandTarget), nanmean(grandSame), nanmean(grandRandom)], 'm')
    errorbar([nanmean(grandTarget), nanmean(grandSame), nanmean(grandRandom)],...
        [nanstd(grandTarget)/sqrt(length(grandTarget)),...
        nanstd(grandSame)/sqrt(length(grandSame)),...
        nanstd(grandRandom)/sqrt(length(grandRandom))], 'black');
    title('reaction time residuals')
    ylim([-.25, .3])
    xlabel('1 = target word, 2 = same context word, 3 = different context word')
      ylabel('zscored RTs')
    
    [h, psametarget] = ttest2(grandSame, grandTarget, .05, 'right')
    [h, psamerandom] = ttest2(grandSame, grandRandom, .05, 'right')
%     [h, prandomtarget] = ttest2(grandRandom, grandTarget, .05, 'left')
% %     
% %     figure(4)
% %     errorbar([nanmean(target_word(:, 4)), nanmean(same_list(:, 4)), nanmean(random_word(:, 4))],...
% %         [nanstd(target_word(:, 4))/sqrt(length(target_word(:, 4))),...
% %         nanstd(same_list(:, 4))/sqrt(length(same_list(:, 4))),...
% %         nanstd(random_word(:, 4))/sqrt(length(random_word(:, 4)))], 'blue');
% %     title('Accuracy')
% %     xlabel('1 = target word, 2 = same list word, 3 = different list word')
% %     
% % %      
% % %     figure(5)
% % %     subplot(2, 1, 1)
% % %     (errorbar([nanmean(target_wordSameSide(:, 1)), nanmean(same_listSameSide(:, 1)), nanmean(random_wordSameSide(:, 1))],...
% % %         [nanstd(target_wordSameSide(:, 1))/sqrt(length(target_wordSameSide(:, 1))),...
% % %         nanstd(same_listSameSide(:, 1))/sqrt(length(same_listSameSide(:, 1))),...
% % %         nanstd(random_wordSameSide(:, 1))/sqrt(length(random_wordSameSide(:, 1)))], 'red'));
% % %     %plot([1, 2, 3], [mean(target_word(:, 1)), mean(same_list(:, 1)), mean(random_word(:, 1))], 'red');
% % %     title('raw reaction times target and probe same side')
% % %     xlabel('1 = target word, 2 = same list word, 3 = random word')
% % %     ylabel('ms')
% % %     subplot(2, 1, 2)
% % %     (errorbar([nanmean(target_wordOppSide(:, 1)), nanmean(same_listOppSide(:, 1)), nanmean(random_wordOppSide(:, 1))],...
% % %         [nanstd(target_wordOppSide(:, 1))/sqrt(length(target_wordOppSide(:, 1))),...
% % %         nanstd(same_listOppSide(:, 1))/sqrt(length(same_listOppSide(:, 1))),...
% % %         nanstd(random_wordOppSide(:, 1))/sqrt(length(random_wordOppSide(:, 1)))], 'blue'));
% % %     %plot([1, 2, 3], [mean(target_word(:, 1)), mean(same_list(:, 1)), mean(random_word(:, 1))], 'red');
% % %     title('raw reaction times target and probe opposite sides')
% % %     xlabel('1 = target word, 2 = same list word, 3 = random word')
% % %     ylabel('ms')
% % %     
% % %     
% %   
% %     grand_GLM = [horzcat(ones(length(data), 1), data(:, 4), data(:, 3), data(:, 19))];
% %     [BigB, BigBI, BigR] = regress(zlrt, grand_GLM);
% %     tw_count =1; sl_count =1; rw_count =1;
% %     for i = 1: length(data)
% %         if data(i, 14+1) == 1
% %             grandTargetSameSide(tw_count) = BigR(i);
% %             tw_count = tw_count +1;
% %         elseif data(i, 14+1) == 2
% %             grandSameSameSide(sl_count) = BigR(i);
% %             sl_count = sl_count + 1;
% %         elseif data(i, 14+1) ==3
% %             grandRandomSameSide(rw_count) = BigR(i);
% %             rw_count = rw_count +1;
% %         end
% %     end
% %     
% %         grand_GLM = [horzcat(ones(length(data), 1), data(:, 4), data(:, 3), data(:, 19))];
% %     [BigB, BigBI, BigR] = regress(zlrt, grand_GLM);
% %     tw_count =1; sl_count =1; rw_count =1;
% %     for i = 1: length(data)
% %         if data(i, 14+1) == 1
% %             grandTargetOppSide(tw_count) = BigR(i);
% %             tw_count = tw_count +1;
% %         elseif data(i, 14+1) == 2
% %             grandSameOppSide(sl_count) = BigR(i);
% %             sl_count = sl_count + 1;
% %         elseif data(i, 14+1) ==3
% %             grandRandomOppSide(rw_count) = BigR(i);
% %             rw_count = rw_count +1;
% %         end
% %     end
% %     
% %     figure(6)
% %     subplot(2, 1, 1)
% %     %plot([1 2 3], [nanmean(grandTarget), nanmean(grandSame), nanmean(grandRandom)], 'm')
% %     errorbar([nanmean(grandTargetSameSide), nanmean(grandSameSameSide), nanmean(grandRandomSameSide)],...
% %         [nanstd(grandTargetSameSide)/sqrt(length(grandTargetSameSide)),...
% %         nanstd(grandSameSameSide)/sqrt(length(grandSameSameSide)),...
% %         nanstd(grandRandomSameSide)/sqrt(length(grandRandomSameSide))], 'red');
% %     title('reaction time residuals target and probe on same side')
% %     xlabel('1 = target word, 2 = same list word, 3 = different list word')
% %     %plot([1 2 3], [nanmean(grandTarget), nanmean(grandSame), nanmean(grandRandom)], 'm')
% %     subplot(2, 1, 2)
% %     errorbar([nanmean(grandTargetOppSide), nanmean(grandSameOppSide), nanmean(grandRandomOppSide)],...
% %         [nanstd(grandTargetOppSide)/sqrt(length(grandTargetOppSide)),...
% %         nanstd(grandSameOppSide)/sqrt(length(grandSameOppSide)),...
% %         nanstd(grandRandomOppSide)/sqrt(length(grandRandomOppSide))], 'blue');
% %     title('reaction time residuals target and probe on opposite sides')
% %     xlabel('1 = target word, 2 = same list word, 3 = random word')
% % % %     [h, psametarget] = ttest(grandSame, grandTarget)
% % %     [h, psamerandom] = ttest(grandSame, grandRandom)
% % %     [h, prandomtarget] = ttest(grandRandom, grandTarget)
% %     
% %     figure(7)
% %     subplot(2, 1, 1)
% %     errorbar([nanmean(target_wordSameSide(:, 4)), nanmean(same_listSameSide(:, 4)), nanmean(random_wordSameSide(:, 4))],...
% %         [nanstd(target_wordSameSide(:, 4))/sqrt(length(target_wordSameSide(:, 4))),...
% %         nanstd(same_listSameSide(:, 4))/sqrt(length(same_listSameSide(:, 4))),...
% %         nanstd(random_wordSameSide(:, 4))/sqrt(length(random_wordSameSide(:, 4)))], 'red');
% %     title('Accuracy target and probe on same sides')
% %     xlabel('1 = target word, 2 = same list word, 3 = random word')
% %     subplot(2, 1, 2)    
% %     errorbar([nanmean(target_wordOppSide(:, 4)), nanmean(same_listOppSide(:, 4)), nanmean(random_wordOppSide(:, 4))],...
% %         [nanstd(target_wordOppSide(:, 4))/sqrt(length(target_wordOppSide(:, 4))),...
% %         nanstd(same_listOppSide(:, 4))/sqrt(length(same_listOppSide(:, 4))),...
% %         nanstd(random_wordOppSide(:, 4))/sqrt(length(random_wordOppSide(:, 4)))], 'blue');
% %     title('Accuracy target and probe on opposite sides')
% %     xlabel('1 = target word, 2 = same list word, 3 = random word')
% %     
% %     
% %     figure(8)
% %     subplot(2, 1, 1)
% %     (errorbar([nanmean(target_wordSameStim(:, 1)), nanmean(same_listSameStim(:, 1)), nanmean(random_wordSameStim(:, 1))],...
% %         [nanstd(target_wordSameStim(:, 1))/sqrt(length(target_wordSameStim(:, 1))),...
% %         nanstd(same_listSameStim(:, 1))/sqrt(length(same_listSameStim(:, 1))),...
% %         nanstd(random_wordSameStim(:, 1))/sqrt(length(random_wordSameStim(:, 1)))], 'red'));
% %     %plot([1, 2, 3], [mean(target_word(:, 1)), mean(same_list(:, 1)), mean(random_word(:, 1))], 'red');
% %     title('raw reaction times target and probe both face or both scene')
% %     xlabel('1 = target word, 2 = same list word, 3 = random word')
% %     ylabel('ms')
% %     subplot(2, 1, 2)
% %     (errorbar([nanmean(target_wordDiffStim(:, 1)), nanmean(same_listDiffStim(:, 1)), nanmean(random_wordDiffStim(:, 1))],...
% %         [nanstd(target_wordDiffStim(:, 1))/sqrt(length(target_wordDiffStim(:, 1))),...
% %         nanstd(same_listDiffStim(:, 1))/sqrt(length(same_listDiffStim(:, 1))),...
% %         nanstd(random_wordDiffStim(:, 1))/sqrt(length(random_wordDiffStim(:, 1)))], 'blue'));
% %     %plot([1, 2, 3], [mean(target_word(:, 1)), mean(same_list(:, 1)), mean(random_word(:, 1))], 'red');
% %     title('raw reaction times target and probe differ in terms of face or scene')
% %     xlabel('1 = target word, 2 = same list word, 3 = random word')
% %     ylabel('ms')
% %     
% %     
% %   
% %     grand_GLM = [horzcat(ones(length(data), 1), data(:, 4), data(:, 3), data(:, 19))];
% %     [BigB, BigBI, BigR] = regress(zlrt, grand_GLM);
% %     tw_count =1; sl_count =1; rw_count =1;
% %     for i = 1: length(data)
% %         if data(i, 14+1) == 1
% %             grandTargetSameStim(tw_count) = BigR(i);
% %             tw_count = tw_count +1;
% %         elseif data(i, 14+1) == 2
% %             grandSameSameStim(sl_count) = BigR(i);
% %             sl_count = sl_count + 1;
% %         elseif data(i, 14+1) ==3
% %             grandRandomSameStim(rw_count) = BigR(i);
% %             rw_count = rw_count +1;
% %         end
% %     end
% %     
% %         grand_GLM = [horzcat(ones(length(data), 1), data(:, 4), data(:, 3), data(:, 19))];
% %     [BigB, BigBI, BigR] = regress(zlrt, grand_GLM);
% %     tw_count =1; sl_count =1; rw_count =1;
% %     for i = 1: length(data)
% %         if data(i, 14+1) == 1
% %             grandTargetDiffStim(tw_count) = BigR(i);
% %             tw_count = tw_count +1;
% %         elseif data(i, 14+1) == 2
% %             grandSameDiffStim(sl_count) = BigR(i);
% %             sl_count = sl_count + 1;
% %         elseif data(i, 14+1) ==3
% %             grandRandomDiffStim(rw_count) = BigR(i);
% %             rw_count = rw_count +1;
% %         end
% %     end
% %     
% %     figure(9)
% %     subplot(2, 1, 1)
% %     %plot([1 2 3], [nanmean(grandTarget), nanmean(grandSame), nanmean(grandRandom)], 'm')
% %     errorbar([nanmean(grandTargetSameStim), nanmean(grandSameSameStim), nanmean(grandRandomSameStim)],...
% %         [nanstd(grandTargetSameStim)/sqrt(length(grandTargetSameStim)),...
% %         nanstd(grandSameSameStim)/sqrt(length(grandSameSameStim)),...
% %         nanstd(grandRandomSameStim)/sqrt(length(grandRandomSameStim))], 'red');
% %     title('reaction time residuals target and probe both faces or scenes')
% %     xlabel('1 = target word, 2 = same list word, 3 = random word')
% %     %plot([1 2 3], [nanmean(grandTarget), nanmean(grandSame), nanmean(grandRandom)], 'm')
% %     subplot(2, 1, 2)
% %     errorbar([nanmean(grandTargetDiffStim), nanmean(grandSameDiffStim), nanmean(grandRandomDiffStim)],...
% %         [nanstd(grandTargetDiffStim)/sqrt(length(grandTargetDiffStim)),...
% %         nanstd(grandSameDiffStim)/sqrt(length(grandSameDiffStim)),...
% %         nanstd(grandRandomDiffStim)/sqrt(length(grandRandomDiffStim))], 'blue');
% %     title('reaction time residuals, target and probe differ in terms of face or scene')
% %     xlabel('1 = target word, 2 = same list word, 3 = random word')
% % %     [h, psametarget] = ttest(grandSame, grandTarget)
% % %     [h, psamerandom] = ttest(grandSame, grandRandom)
% % %     [h, prandomtarget] = ttest(grandRandom, grandTarget)
% %     
% %     figure(10)
% %     subplot(2, 1, 1)
% %     
% %     errorbar([nanmean(target_wordSameSide(:, 4)), nanmean(same_listSameSide(:, 4)), nanmean(random_wordSameSide(:, 4))],...
% %         [nanstd(target_wordSameSide(:, 4))/sqrt(length(target_wordSameSide(:, 4))),...
% %         nanstd(same_listSameSide(:, 4))/sqrt(length(same_listSameSide(:, 4))),...
% %         nanstd(random_wordSameSide(:, 4))/sqrt(length(random_wordSameSide(:, 4)))], 'red');
% %     title('Accuracy target and probe on same sides ')
% %    subplot(2, 1, 2)
% %     xlabel('1 = target word, 2 = same list word, 3 = random word')
% %         errorbar([nanmean(target_wordOppSide(:, 4)), nanmean(same_listOppSide(:, 4)), nanmean(random_wordOppSide(:, 4))],...
% %         [nanstd(target_wordOppSide(:, 4))/sqrt(length(target_wordOppSide(:, 4))),...
% %         nanstd(same_listOppSide(:, 4))/sqrt(length(same_listOppSide(:, 4))),...
% %         nanstd(random_wordOppSide(:, 4))/sqrt(length(random_wordOppSide(:, 4)))], 'blue');
% %     title('Accuracy target and probe on opposite sides')
% %     xlabel('1 = target word, 2 = same list word, 3 = random word')
% 
% % % %low imagery
%  lowdata = vertcat(data2, data5, data8, data9,...
%      data10, data12, data13, data15, data16, data18,...
%      data20, data21, data23, data27,...
%     data28,  data32);
%    rt = vertcat(rt2,rt5,  rt8, rt9, rt10,rt12, rt13,...
%        rt15, rt16,  rt18,  rt20, rt21, rt23,...
%     rt27, rt28, rt32);
%    lrt =vertcat( lrt2,  lrt5, lrt8, lrt9, lrt10, ...
%      lrt12, lrt13,  lrt15, lrt16,  lrt18, lrt20, lrt21,...
%      lrt23,  lrt27, lrt28,  lrt32);
%   zlrt = vertcat(zlrt2,  zlrt5,  zlrt8, zlrt9,...
%    zlrt10,  zlrt12, zlrt13,zlrt15, zlrt16, zlrt18, zlrt20, zlrt21,...
%   zlrt23,zlrt27, zlrt28,  zlrt32);
% 
% 
% 
% % 1Subject	2block	3trial	4correct words	5actual response	6#substitutions
% %7substituted words	8substitute list	9mistake in previous list?	10learning list #
% % 11interference type	12RT	13mismatch Word	14mismatch kind	15mismatch new word
% % 16mismatch seenit	17mismatch testlist	18 mismatch accuracy
% % 19 task switch  20 same finger  21 index finger  22 left/right
% % 23 target/probe on same side? 24 targets from left or right 25 probe from
% % left or right 26 target was face or scene 27 probe was face or scene
% 
% %need to bin first by mismatch kind
% % GLM_mismatchkind{1=1, 2=switch, 3=block, 4=error, 5=trial}
% % mismatchkind = {1=rt, 2=zrt}
% tw_count =1; sl_count =1; rw_count =1;
% tw_countSameSide =1; sl_countSameSide =1; rw_countSameSide =1;
% tw_countOppSide =1; sl_countOppSide =1; rw_countOppSide =1;
% tw_countSameStim =1; sl_countSameStim =1; rw_countSameStim =1;
% tw_countDiffStim =1; sl_countDiffStim =1; rw_countDiffStim =1;
% accuracy_target = []; atcount = 1;
% accuracy_same = []; ascount = 1;
% accuracy_different = []; adcount = 1;
% 
% 
% for i = 1: length(data)
%     if data(i, 14+1) == 1
%         target_word(tw_count, 1) = data(i, 12+1);
%         target_word(tw_count, 2) = zlrt(i);
%         target_word(tw_count, 3) =lrt(i);
%         target_word(tw_count, 4) = data(i, 19);
%         GLM_target_word(tw_count, 1) = 1;
%         GLM_target_word(tw_count, 3) = data(i, 2+1);
%         GLM_target_word(tw_count, 4) = data(i, 18+1);
%         GLM_target_word(tw_count, 2) = data(i, 3+1);
%         tw_count = tw_count + 1;
%         if data(i, 24+1) == data(i, 25+1) %target probe on same side
%             target_wordSameSide(tw_countSameSide, 1) = data(i, 12+1);
%             target_wordSameSide(tw_countSameSide, 2) = zlrt(i);
%             target_wordSameSide(tw_countSameSide, 3) =lrt(i);
%             target_wordSameSide(tw_countSameSide, 4) = data(i, 19);
%             GLM_target_wordSameSide(tw_countSameSide, 1) = 1;
%             GLM_target_wordSameSide(tw_countSameSide, 3) = data(i, 2+1);
%             GLM_target_wordSameSide(tw_countSameSide, 4) = data(i, 18+1);
%             GLM_target_wordSameSide(tw_countSameSide, 2) = data(i, 3+1);
%             tw_countSameSide = tw_countSameSide + 1;
%         else
%             target_wordOppSide(tw_countOppSide, 1) = data(i, 12+1);
%             target_wordOppSide(tw_countOppSide, 2) = zlrt(i);
%             target_wordOppSide(tw_countOppSide, 3) =lrt(i);
%             target_wordOppSide(tw_countOppSide, 4) = data(i, 19);
%             GLM_target_wordOppSide(tw_countOppSide, 1) = 1;
%             GLM_target_wordOppSide(tw_countOppSide, 3) = data(i, 2+1);
%             GLM_target_wordOppSide(tw_countOppSide, 4) = data(i, 18+1);
%             GLM_target_wordOppSide(tw_countOppSide, 2) = data(i, 3+1);
%             tw_countOppSide = tw_countOppSide + 1;
%         end
%         if data(i, 26+1) == data(i, 27+1) %targets and probes were both faces or both scenes
%             target_wordSameStim(tw_countSameStim, 1) = data(i, 12+1);
%             target_wordSameStim(tw_countSameStim, 2) = zlrt(i);
%             target_wordSameStim(tw_countSameStim, 3) =lrt(i);
%             target_wordSameStim(tw_countSameStim, 4) = data(i, 19);
%             GLM_target_wordSameStim(tw_countSameStim, 1) = 1;
%             GLM_target_wordSameStim(tw_countSameStim, 3) = data(i, 2+1);
%             GLM_target_wordSameStim(tw_countSameStim, 4) = data(i, 18+1);
%             GLM_target_wordSameStim(tw_countSameStim, 2) = data(i, 3+1);
%             tw_countSameStim = tw_countSameStim + 1;
%         else
%             target_wordDiffStim(tw_countDiffStim, 1) = data(i, 12+1);
%             target_wordDiffStim(tw_countDiffStim, 2) = zlrt(i);
%             target_wordDiffStim(tw_countDiffStim, 3) =lrt(i);
%             target_wordDiffStim(tw_countDiffStim, 4) = data(i, 19);
%             GLM_target_wordDiffStim(tw_countDiffStim, 1) = 1;
%             GLM_target_wordDiffStim(tw_countDiffStim, 3) = data(i, 2+1);
%             GLM_target_wordDiffStim(tw_countDiffStim, 4) = data(i, 18+1);
%             GLM_target_wordDiffStim(tw_countDiffStim, 2) = data(i, 3+1);
%             tw_countDiffStim = tw_countDiffStim + 1;
%         end
%     elseif data(i, 14+1) == 2
%         same_list(sl_count, 1) = data(i, 12+1);
%         same_list(sl_count, 2) = zlrt(i);
%         same_list(sl_count, 3) =lrt(i);
%         same_list(sl_count, 4) = data(i, 19);
%         GLM_same_list(sl_count, 1) = 1;
%         GLM_same_list(sl_count, 3) = data(i, 2+1);
%         GLM_same_list(sl_count, 4) = data(i, 18+1);
%         GLM_same_list(sl_count, 2) = data(i, 3+1);
%         sl_count = sl_count + 1;
%         if data(i, 24+1) == data(i, 25+1) %target probe on same side
%             same_listSameSide(sl_countSameSide, 1) = data(i, 12+1);
%             same_listSameSide(sl_countSameSide, 2) = zlrt(i);
%             same_listSameSide(sl_countSameSide, 3) =lrt(i);
%             same_listSameSide(sl_countSameSide, 4) = data(i, 19);
%             GLM_same_listSameSide(sl_countSameSide, 1) = 1;
%             GLM_same_listSameSide(sl_countSameSide, 3) = data(i, 2+1);
%             GLM_same_listSameSide(sl_countSameSide, 4) = data(i, 18+1);
%             GLM_same_listSameSide(sl_countSameSide, 2) = data(i, 3+1);
%             sl_countSameSide = sl_countSameSide + 1;
%         else
%             same_listOppSide(sl_countOppSide, 1) = data(i, 12+1);
%             same_listOppSide(sl_countOppSide, 2) = zlrt(i);
%             same_listOppSide(sl_countOppSide, 3) =lrt(i);
%             same_listOppSide(sl_countOppSide, 4) = data(i, 19);
%             GLM_same_listOppSide(sl_countOppSide, 1) = 1;
%             GLM_same_listOppSide(sl_countOppSide, 3) = data(i, 2+1);
%             GLM_same_listOppSide(sl_countOppSide, 4) = data(i, 18+1);
%             GLM_same_listOppSide(sl_countOppSide, 2) = data(i, 3+1);
%             sl_countOppSide = sl_countOppSide + 1;
%         end
%         if data(i, 26+1) == data(i, 27+1) %targets and probes were both faces or both scenes
%             same_listSameStim(sl_countSameStim, 1) = data(i, 12+1);
%             same_listSameStim(sl_countSameStim, 2) = zlrt(i);
%             same_listSameStim(sl_countSameStim, 3) =lrt(i);
%             same_listSameStim(sl_countSameStim, 4) = data(i, 19);
%             GLM_same_listSameStim(sl_countSameStim, 1) = 1;
%             GLM_same_listSameStim(sl_countSameStim, 3) = data(i, 2+1);
%             GLM_same_listSameStim(sl_countSameStim, 4) = data(i, 18+1);
%             GLM_same_listSameStim(sl_countSameStim, 2) = data(i, 3+1);
%             sl_countSameStim = sl_countSameStim + 1;
%         else
%             same_listDiffStim(sl_countDiffStim, 1) = data(i, 12+1);
%             same_listDiffStim(sl_countDiffStim, 2) = zlrt(i);
%             same_listDiffStim(sl_countDiffStim, 3) =lrt(i);
%             same_listDiffStim(sl_countDiffStim, 4) = data(i, 19);
%             GLM_same_listDiffStim(sl_countDiffStim, 1) = 1;
%             GLM_same_listDiffStim(sl_countDiffStim, 3) = data(i, 2+1);
%             GLM_same_listDiffStim(sl_countDiffStim, 4) = data(i, 18+1);
%             GLM_same_listDiffStim(sl_countDiffStim, 2) = data(i, 3+1);
%             sl_countDiffStim = sl_countDiffStim + 1;
%         end
%     elseif data(i, 14+1) == 3
%         random_word(rw_count, 1) = data(i, 12+1);
%         random_word(rw_count, 2) = zlrt(i);
%         random_word(rw_count, 3) =lrt(i);
%         random_word(rw_count, 4) = data(i, 19);
%         GLM_random_word(rw_count, 1) = 1;
%         GLM_random_word(rw_count, 2) = data(i, 3+1);
%         GLM_random_word(rw_count, 3) = data(i, 2+1);
%         GLM_random_word(rw_count, 4) = data(i, 18+1);
%         rw_count = rw_count + 1;
%         if data(i, 24+1) == data(i, 25+1) %target probe on same side
%             random_wordSameSide(rw_countSameSide, 1) = data(i, 12+1);
%             random_wordSameSide(rw_countSameSide, 2) = zlrt(i);
%             random_wordSameSide(rw_countSameSide, 3) =lrt(i);
%             random_wordSameSide(rw_countSameSide, 4) = data(i, 19);
%             GLM_random_wordSameSide(rw_countSameSide, 1) = 1;
%             GLM_random_wordSameSide(rw_countSameSide, 2) = data(i, 3+1);
%             GLM_random_wordSameSide(rw_countSameSide, 3) = data(i, 2+1);
%             GLM_random_wordSameSide(rw_countSameSide, 4) = data(i, 18+1);
%             rw_countSameSide = rw_countSameSide + 1;
%         else
%             random_wordOppSide(rw_countOppSide, 1) = data(i, 12+1);
%             random_wordOppSide(rw_countOppSide, 2) = zlrt(i);
%             random_wordOppSide(rw_countOppSide, 3) =lrt(i);
%             random_wordOppSide(rw_countOppSide, 4) = data(i, 19);
%             GLM_random_wordOppSide(rw_countOppSide, 1) = 1;
%             GLM_random_wordOppSide(rw_countOppSide, 2) = data(i, 3+1);
%             GLM_random_wordOppSide(rw_countOppSide, 3) = data(i, 2+1);
%             GLM_random_wordOppSide(rw_countOppSide, 4) = data(i, 18+1);
%             rw_countOppSide = rw_countOppSide + 1;
%         end
%         if data(i, 26+1) == data(i, 27+1) %targets and probes were both faces or both scenes
%             random_wordSameStim(rw_countSameStim, 1) = data(i, 12+1);
%             random_wordSameStim(rw_countSameStim, 2) = zlrt(i);
%             random_wordSameStim(rw_countSameStim, 3) =lrt(i);
%             random_wordSameStim(rw_countSameStim, 4) = data(i, 19);
%             GLM_random_wordSameStim(rw_countSameStim, 1) = 1;
%             GLM_random_wordSameStim(rw_countSameStim, 2) = data(i, 3+1);
%             GLM_random_wordSameStim(rw_countSameStim, 3) = data(i, 2+1);
%             GLM_random_wordSameStim(rw_countSameStim, 4) = data(i, 18+1);
%             rw_countSameStim = rw_countSameStim + 1;
%         else
%             random_wordDiffStim(rw_countDiffStim, 1) = data(i, 12+1);
%             random_wordDiffStim(rw_countDiffStim, 2) = zlrt(i);
%             random_wordDiffStim(rw_countDiffStim, 3) =lrt(i);
%             random_wordDiffStim(rw_countDiffStim, 4) = data(i, 19);
%             GLM_random_wordDiffStim(rw_countDiffStim, 1) = 1;
%             GLM_random_wordDiffStim(rw_countDiffStim, 2) = data(i, 3+1);
%             GLM_random_wordDiffStim(rw_countDiffStim, 3) = data(i, 2+1);
%             GLM_random_wordDiffStim(rw_countDiffStim, 4) = data(i, 18+1);
%             rw_countDiffStim = rw_countDiffStim + 1;
%         end
%     end
% end
% 
% 
%     
% % figure(3)
% % hold on;
% % errors = [(nanstd(target_word(:, 4))/sqrt(length(target_word(:, 4)))),...        
% % (nanstd(same_list(:, 4))/sqrt(length(same_list(:, 4)))),...
% %         (nanstd(random_word(:, 4))/sqrt(length(random_word(:, 4))))]
% % 
% % errorbar([mean(target_word(:,4)), mean(same_list(:, 4)), mean(random_word(:, 4))], errors, 'blue');
% %   title('Accuracy by Trial Type')
% %     xlabel('1 = target word, 2 = same list word, 3 = different list word')
% %     ylabel('Accuracy in DNMS')
% % 
% %     ylim([.8 1]);
% % 
% %     hold off;
% % figure(1)
% %     errorbar([nanmean(target_word(:, 1)), nanmean(same_list(:, 1)), nanmean(random_word(:, 1))],...
% %         [nanstd(target_word(:, 1))/sqrt(length(target_word(:, 1))),...
% %         nanstd(same_list(:, 1))/sqrt(length(same_list(:, 1))),...
% %         nanstd(random_word(:, 1))/sqrt(length(random_word(:, 1)))], 'red');
% %     %plot([1, 2, 3], [mean(target_word(:, 1)), mean(same_list(:, 1)), mean(random_word(:, 1))], 'red');
% %     title('raw reaction times')
% %     xlabel('1 = target word, 2 = same list word, 3 = different list word')
% %     ylabel('ms')
% %     
% %     figure(2)
% %     errorbar([nanmean(target_word(:, 2)), nanmean(same_list(:, 2)), nanmean(random_word(:, 2))],...
% %         [nanstd(target_word(:, 2))/sqrt(length(target_word(:, 2))),...
% %         nanstd(same_list(:, 2))/sqrt(length(same_list(:, 2))),...
% %         nanstd(random_word(:, 2))/sqrt(length(random_word(:, 2)))], 'blue');
% %     %plot([1, 2, 3], [mean(target_word(:, 2)), mean(same_list(:, 2)), mean(random_word(:, 2))], 'blue');
% %     title('zscored reaction times')
% %     xlabel('1 = target word, 2 = same list word, 3 = different list word')
%     
%     
%     grand_GLM = [horzcat(ones(length(data), 1), data(:, 4), data(:, 3), data(:, 19))];
%     [BigB, BigBI, BigR] = regress(zlrt, grand_GLM);
%     tw_count =1; sl_count =1; rw_count =1;
%     for i = 1: length(data)
%         if data(i, 14+1) == 1
%             grandTarget(tw_count) = BigR(i);
%             tw_count = tw_count +1;
%         elseif data(i, 14+1) == 2
%             grandSame(sl_count) = BigR(i);
%             sl_count = sl_count + 1;
%         elseif data(i, 14+1) ==3
%             grandRandom(rw_count) = BigR(i);
%             rw_count = rw_count +1;
%         end
%     end
%     
% hold on
%     %plot([1 2 3], [nanmean(grandTarget), nanmean(grandSame), nanmean(grandRandom)], 'm')
%     errorbar([nanmean(grandTarget), nanmean(grandSame), nanmean(grandRandom)],...
%         [nanstd(grandTarget)/sqrt(length(grandTarget)),...
%         nanstd(grandSame)/sqrt(length(grandSame)),...
%         nanstd(grandRandom)/sqrt(length(grandRandom))], 'green');
%     title('reaction time residuals')
%     ylim([-.25, .25])
%     xlabel('1 = target word, 2 = same context word, 3 = different context word')
%     
%     legend('high imagery subjects', 'low imgaery subjects');
%     
%     [h, psametarget] = ttest2(grandSame, grandTarget, .05, 'right')
%     [h, psamerandom] = ttest2(grandSame, grandRandom, .05, 'right')
%     [h, prandomtarget] = ttest2(grandRandom, grandTarget, .05, 'left')
