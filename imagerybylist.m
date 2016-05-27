clear
load('Imagery.mat');
%spreadsheet has a lot of data.  Below is the key for the columns
% 1Subject	2block	3trial	4correct words	5actual response	6#substitutions
%7substituted words	8substitute list	9mistake in previous list?	10learning list #
% 11interference type	12RT	13mismatch Word	14mismatch kind	15mismatch new word
% 16mismatch seenit	17mismatch testlist	18 mismatch accuracy
% 19 task switch  20 same finger  21 index finger  22 left/right
% 23 target/probe on same side? 24 targets from left or right 25 probe from
% left or right 26 target was face or scene 27 probe was face or scene


% file = 'subject122.xlsx';
% data = xlsread(file);
% rt = data(:, 13);
% lrt = log(rt);
% zlrt= (lrt - nanmean(lrt))/nanstd(lrt);


file1 = 'subject101.xlsx';
data1 = xlsread(file1);
data1 = data1(1:60, :);
rt1 = data1(:, 13);
lrt1 = log(rt1);
zlrt1= (lrt1 - nanmean(lrt1))/nanstd(lrt1);

file2 = 'subject102.xlsx';
data2 = xlsread(file2);
data2 = data2(1:60, :);
rt2 = data2(:, 13);
lrt2 = log(rt2);
zlrt2= (lrt2 - nanmean(lrt2))/nanstd(lrt2);

file3 = 'subject103.xlsx';
data3 = xlsread(file3);
data3 = data3(1:60, :);
rt3 = data3(:, 13);
lrt3 = log(rt3);
zlrt3= (lrt3 - nanmean(lrt3))/nanstd(lrt3);

file4 = 'subject104.xlsx';
data4 = xlsread(file4);
data4 = data4(1:60, :);
rt4 = data4(:, 13);
lrt4 = log(rt4);
zlrt4= (lrt4 - nanmean(lrt4))/nanstd(lrt4);

file5 = 'subject105.xlsx';
data5 = xlsread(file5);
data5 = data5(1:60, :);
rt5 = data5(:, 13);
lrt5 = log(rt5);
zlrt5= (lrt5 - nanmean(lrt5))/nanstd(lrt5);

file6 = 'subject106.xlsx';
data6 = xlsread(file6);
data6 = data6(1:60, :);
rt6 = data6(:, 13);
lrt6 = log(rt6);
zlrt6= (lrt6 - nanmean(lrt6))/nanstd(lrt6);

file7 = 'subject107.xlsx';
data7 = xlsread(file7);
data7 = data7(1:60, :);
rt7 = data7(:, 13);
lrt7 = log(rt7);
zlrt7= (lrt7 - nanmean(lrt7))/nanstd(lrt7);

file8 = 'subject108.xlsx';
data8 = xlsread(file8);
data8 = data8(1:60, :);
rt8 = data8(:, 13);
lrt8 = log(rt8);
zlrt8= (lrt8 - nanmean(lrt8))/nanstd(lrt8);

file9 = 'subject109.xlsx';
data9 = xlsread(file9);
data9 = data9(1:60, :);
rt9 = data9(:, 13);
lrt9 = log(rt9);
zlrt9= (lrt9 - nanmean(lrt9))/nanstd(lrt9);

file10 = 'subject110.xlsx';
data10 = xlsread(file10);
data10 = data10(1:60, :);
rt10 = data10(:, 13);
lrt10 = log(rt10);
zlrt10= (lrt10 - nanmean(lrt10))/nanstd(lrt10);

file11= 'subject111.xlsx';
data11= xlsread(file11);
data11 = data11(1:60, :);
rt11 = data11(:, 13);
lrt11 = log(rt11);
zlrt11= (lrt11 - nanmean(lrt11))/nanstd(lrt11);

file12 = 'subject112.xlsx';
data12 = xlsread(file12);
data12 = data12(1:60, :);
rt12 = data12(:, 13);
lrt12 = log(rt12);
zlrt12= (lrt12 - nanmean(lrt12))/nanstd(lrt12);

file13 = 'subject113.xlsx';
data13 = xlsread(file13);
data13 = data13(1:60, :);
rt13 = data13(:, 13);
lrt13 = log(rt13);
zlrt13= (lrt13 - nanmean(lrt13))/nanstd(lrt13);

file14 = 'subject114.xlsx';
data14 = xlsread(file14);
data14 = data14(1:60, :);
rt14 = data14(:, 13);
lrt14 = log(rt14);
zlrt14= (lrt14 - nanmean(lrt14))/nanstd(lrt14);

file15 = 'subject115.xlsx';
data15 = xlsread(file15);
data15 = data15(1:60, :);
rt15 = data15(:, 13);
lrt15 = log(rt15);
zlrt15= (lrt15 - nanmean(lrt15))/nanstd(lrt15);

file16 = 'subject116.xlsx';
data16 = xlsread(file16);
data16 = data16(1:60, :);
rt16 = data16(:, 13);
lrt16 = log(rt16);
zlrt16= (lrt16 - nanmean(lrt16))/nanstd(lrt16);

file17 = 'subject117.xlsx';
data17 = xlsread(file17);
data17 = data17(1:60, :);
rt17 = data17(:, 13);
lrt17 = log(rt17);
zlrt17= (lrt17 - nanmean(lrt17))/nanstd(lrt17);

file18 = 'subject118.xlsx';
data18 = xlsread(file18);
data18 = data18(1:60, :);
rt18 = data18(:, 13);
lrt18 = log(rt18);
zlrt18= (lrt18 - nanmean(lrt18))/nanstd(lrt18);

file19 = 'subject119.xlsx';
data19 = xlsread(file19);
data19 = data19(1:60, :);
rt19 = data19(:, 13);
lrt19 = log(rt19);
zlrt19= (lrt19 - nanmean(lrt19))/nanstd(lrt19);

file20 = 'subject120.xlsx';
data20 = xlsread(file20);
data20 = data20(1:60, :);
rt20 = data20(:, 13);
lrt20 = log(rt20);
zlrt20= (lrt20 - nanmean(lrt20))/nanstd(lrt20);

file21 = 'subject121.xlsx';
data21 = xlsread(file21);
data21 = data21(1:60, :);
rt21 = data21(:, 13);
lrt21 = log(rt21);
zlrt21= (lrt21 - nanmean(lrt21))/nanstd(lrt21);

file22 = 'subject122.xlsx';
data22 = xlsread(file22);
data22 = data22(1:60, :);
rt22 = data22(:, 13);
lrt22 = log(rt22);
zlrt22= (lrt22 - nanmean(lrt22))/nanstd(lrt22);

file23 = 'subject123.xlsx';
data23 = xlsread(file23);
data23 = data23(1:60, :);
rt23 = data23(:, 13);
lrt23 = log(rt23);
zlrt23= (lrt23 - nanmean(lrt23))/nanstd(lrt23);

file24 = 'subject124.xlsx';
data24 = xlsread(file24);
data24 = data24(1:60, :);
rt24 = data24(:, 13);
lrt24 = log(rt24);
zlrt24= (lrt24 - nanmean(lrt24))/nanstd(lrt24);

file25 = 'subject125.xlsx';
data25 = xlsread(file25);
data25 = data25(1:60, :);
rt25 = data25(:, 13);
lrt25 = log(rt25);
zlrt25= (lrt25 - nanmean(lrt25))/nanstd(lrt25);

file26 = 'subject126.xlsx';
data26 = xlsread(file26);
data26 = data26(1:60, :);
rt26 = data26(:, 13);
lrt26 = log(rt26);
zlrt26= (lrt26 - nanmean(lrt26))/nanstd(lrt26);

file27 = 'subject127.xlsx';
data27 = xlsread(file27);
data27 = data27(1:60, :);
rt27 = data27(:, 13);
lrt27 = log(rt27);
zlrt27= (lrt27 - nanmean(lrt27))/nanstd(lrt27);

file28 = 'subject128.xlsx';
data28 = xlsread(file28);
data28 = data28(1:60, :);
rt28 = data28(:, 13);
lrt28 = log(rt28);
zlrt28= (lrt28 - nanmean(lrt28))/nanstd(lrt28);

file29 = 'subject129.xlsx';
data29 = xlsread(file29);
data29 = data29(1:60, :);
rt29 = data29(:, 13);
lrt29 = log(rt29);
zlrt29= (lrt29 - nanmean(lrt29))/nanstd(lrt29);

file30 = 'subject130.xlsx';
data30 = xlsread(file30);
data30 = data30(1:60, :);
rt30 = data30(:, 13);
lrt30 = log(rt30);
zlrt30= (lrt30 - nanmean(lrt30))/nanstd(lrt30);

file31 = 'subject131.xlsx';
data31 = xlsread(file31);
data31 = data31(1:60, :);
rt31 = data31(:, 13);
lrt31 = log(rt31);
zlrt31= (lrt31 - nanmean(lrt31))/nanstd(lrt31);

file32 = 'subject132.xlsx';
data32 = xlsread(file32);
data32 = data32(1:60, :);
rt32 = data32(:, 13);
lrt32 = log(rt32);
zlrt32= (lrt32 - nanmean(lrt32))/nanstd(lrt32);

file33 = 'subject133.xlsx';
data33 = xlsread(file33);
data33 = data33(1:60, :);
rt33 = data33(:, 13);
lrt33 = log(rt33);
zlrt33= (lrt33 - nanmean(lrt33))/nanstd(lrt33);

% full set
 data = vertcat(data1, data2, data3, data4, data5, data6, data7, data8, data9,...
     data10, data11,  data12, data13, data14, data15, data16, data18,...
    data19, data20, data21, data22, data23, data24, data25, data26, data27,...
    data28, data29, data30, data31, data32, data33);
   rt = vertcat(rt1, rt2, rt3, rt4, rt5, rt6, rt7, rt8, rt9, rt10, rt11, rt12, rt13,...
       rt14, rt15, rt16,  rt18, rt19, rt20, rt21, rt22, rt23, rt24, rt25,...
    rt26, rt27, rt28, rt29, rt30, rt31, rt32, rt33);
   lrt =vertcat(lrt1, lrt2, lrt3, lrt4, lrt5, lrt6, lrt7, lrt8, lrt9, lrt10, lrt11,...
     lrt12, lrt13, lrt14, lrt15, lrt16,  lrt18, lrt19, lrt20, lrt21,...
     lrt22, lrt23, lrt24, lrt25, lrt26, lrt27, lrt28, lrt29, lrt30, lrt31, lrt32, lrt33);
  zlrt = vertcat(zlrt1, zlrt2, zlrt3, zlrt4, zlrt5, zlrt6, zlrt7, zlrt8, zlrt9,...
   zlrt10, zlrt11, zlrt12, zlrt13, zlrt14, zlrt15, zlrt16, zlrt18, zlrt19, zlrt20, zlrt21,...
   zlrt22, zlrt23, zlrt24, zlrt25, zlrt26, zlrt27, zlrt28, zlrt29, zlrt30, zlrt31, zlrt32, zlrt33);



% high imagery
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


% %low imagery
%  data = vertcat(data2, data5, data8, data9,...
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
hiimagerytarget = 1; loimagerytarget = 1; medimagerytarget = 1; noimagerytarget = 1;
hiimagerysame = 1; loimagerysame = 1; medimagerysame = 1; noimagerysame = 1;
hiimagerydifferent = 1; loimagerydifferent = 1; medimagerydifferent = 1; noimagerydifferent = 1;

%all the data is smooshed together, but should be divisible by 60
%should be able to check for each trial if:
%list word came from is high imagery list, low imagery list, medium imagery
%list, or whether they're just a 0 imagery subject.
%first determine what # subject we're on
%then for each trial ask which learning list we're looking at
%then throw the rt into the appropriate imagery list
%learning list is data(i, 10+1)

for i = 1: length(data)
    if data(i, 14+1) == 1 %targetword
        subject = floor(i/60) +1;
        if subject < 32
        if Imagery(subject, 7) == Imagery(subject, 8)
            noImagerytarget(noimagerytarget, 1) = data(i, 12+1)
            noImagerytarget(noimagerytarget, 2)= zlrt(i);
            noImagerytarget(noimagerytarget, 3) = lrt(i);
            noImagerytarget(noimagerytarget, 4) = data(i, 3+1);
        noImageryGLM_target_word(noimagerytarget, 1) = 1;
        noImageryGLM_target_word(noimagerytarget, 3) = data(i, 2+1);
        noImageryGLM_target_word(noimagerytarget, 4) = data(i, 18+1);
        noImageryGLM_target_word(noimagerytarget, 2) = data(i, 3+1);
        noimagerytarget = noimagerytarget +1;
        elseif data(i, 10+1) == Imagery(subject, 7)
                        loImagerytarget(loimagerytarget, 1) = data(i, 12+1)
            loImagerytarget(loimagerytarget, 2)= zlrt(i);
            loImagerytarget(loimagerytarget, 3) = lrt(i);
            loImagerytarget(loimagerytarget, 4) = data(i, 3+1);
        loImageryGLM_target_word(loimagerytarget, 1) = 1;
        loImageryGLM_target_word(loimagerytarget, 3) = data(i, 2+1);
        loImageryGLM_target_word(loimagerytarget, 4) = data(i, 18+1);
        loImageryGLM_target_word(loimagerytarget, 2) = data(i, 3+1);
        loimagerytarget = loimagerytarget +1;
                elseif data(i, 10+1) == Imagery(subject, 8)
                        hiImagerytarget(hiimagerytarget, 1) = data(i, 12+1)
            hiImagerytarget(hiimagerytarget, 2)= zlrt(i);
            hiImagerytarget(hiimagerytarget, 3) = lrt(i);
            hiImagerytarget(hiimagerytarget, 4) = data(i, 3+1);
        hiImageryGLM_target_word(hiimagerytarget, 1) = 1;
        hiImageryGLM_target_word(hiimagerytarget, 3) = data(i, 2+1);
        hiImageryGLM_target_word(hiimagerytarget, 4) = data(i, 18+1);
        hiImageryGLM_target_word(hiimagerytarget, 2) = data(i, 3+1);
        hiimagerytarget = hiimagerytarget +1;
        else                         medImagerytarget(medimagerytarget, 1) = data(i, 12+1)
            medImagerytarget(medimagerytarget, 2)= zlrt(i);
            medImagerytarget(medimagerytarget, 3) = lrt(i);
            medImagerytarget(medimagerytarget, 4) = data(i, 3+1);
        medImageryGLM_target_word(medimagerytarget, 1) = 1;
        medImageryGLM_target_word(medimagerytarget, 3) = data(i, 2+1);
        medImageryGLM_target_word(medimagerytarget, 4) = data(i, 18+1);
        medImageryGLM_target_word(medimagerytarget, 2) = data(i, 3+1);
        medimagerytarget = hiimagerytarget +1;
        end
        end
       
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
    elseif data(i, 14+1) == 2 %samelistword
                subject = floor(i/60) +1;
                if subject < 32
        if Imagery(subject, 7) == Imagery(subject, 8)
            noImagerysame(noimagerysame, 1) = data(i, 12+1)
            noImagerysame(noimagerysame, 2)= zlrt(i);
            noImagerysame(noimagerysame, 3) = lrt(i);
            noImagerysame(noimagerysame, 4) = data(i, 3+1);
        noImageryGLM_same_word(noimagerysame, 1) = 1;
        noImageryGLM_same_word(noimagerysame, 3) = data(i, 2+1);
        noImageryGLM_same_word(noimagerysame, 4) = data(i, 18+1);
        noImageryGLM_same_word(noimagerysame, 2) = data(i, 3+1);
        noimagerysame = noimagerysame +1;
        elseif data(i, 10+1) == Imagery(subject, 7)
                        loImagerysame(loimagerysame, 1) = data(i, 12+1)
            loImagerysame(loimagerysame, 2)= zlrt(i);
            loImagerysame(loimagerysame, 3) = lrt(i);
            loImagerysame(loimagerysame, 4) = data(i, 3+1);
        loImageryGLM_same_word(loimagerysame, 1) = 1;
        loImageryGLM_same_word(loimagerysame, 3) = data(i, 2+1);
        loImageryGLM_same_word(loimagerysame, 4) = data(i, 18+1);
        loImageryGLM_same_word(loimagerysame, 2) = data(i, 3+1);
        loimagerysame = loimagerysame +1;
                elseif data(i, 10+1) == Imagery(subject, 8)
                        hiImagerysame(hiimagerysame, 1) = data(i, 12+1)
            hiImagerysame(hiimagerysame, 2)= zlrt(i);
            hiImagerysame(hiimagerysame, 3) = lrt(i);
            hiImagerysame(hiimagerysame, 4) = data(i, 3+1);
        hiImageryGLM_same_word(hiimagerysame, 1) = 1;
        hiImageryGLM_same_word(hiimagerysame, 3) = data(i, 2+1);
        hiImageryGLM_same_word(hiimagerysame, 4) = data(i, 18+1);
        hiImageryGLM_same_word(hiimagerysame, 2) = data(i, 3+1);
        hiimagerysame = hiimagerysame +1;
        else                         medImagerysame(medimagerysame, 1) = data(i, 12+1)
            medImagerysame(medimagerysame, 2)= zlrt(i);
            medImagerysame(medimagerysame, 3) = lrt(i);
            medImagerysame(medimagerysame, 4) = data(i, 3+1);
        medImageryGLM_same_word(medimagerysame, 1) = 1;
        medImageryGLM_same_word(medimagerysame, 3) = data(i, 2+1);
        medImageryGLM_same_word(medimagerysame, 4) = data(i, 18+1);
        medImageryGLM_same_word(medimagerysame, 2) = data(i, 3+1);
        medimagerysame = hiimagerysame +1;
        end
                end
        
        
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
    elseif data(i, 14+1) == 3 %differentword
                subject = floor(i/60) +1;
                if subject < 32
        if Imagery(subject, 7) == Imagery(subject, 8)
            noImagerydifferent(noimagerydifferent, 1) = data(i, 12+1)
            noImagerydifferent(noimagerydifferent, 2)= zlrt(i);
            noImagerydifferent(noimagerydifferent, 3) = lrt(i);
            noImagerydifferent(noimagerydifferent, 4) = data(i, 3+1);
        noImageryGLM_different_word(noimagerydifferent, 1) = 1;
        noImageryGLM_different_word(noimagerydifferent, 3) = data(i, 2+1);
        noImageryGLM_different_word(noimagerydifferent, 4) = data(i, 18+1);
        noImageryGLM_different_word(noimagerydifferent, 2) = data(i, 3+1);
        noimagerydifferent = noimagerydifferent +1;
        elseif data(i, 10+1) == Imagery(subject, 7)
                        loImagerydifferent(loimagerydifferent, 1) = data(i, 12+1)
            loImagerydifferent(loimagerydifferent, 2)= zlrt(i);
            loImagerydifferent(loimagerydifferent, 3) = lrt(i);
            loImagerydifferent(loimagerydifferent, 4) = data(i, 3+1);
        loImageryGLM_different_word(loimagerydifferent, 1) = 1;
        loImageryGLM_different_word(loimagerydifferent, 3) = data(i, 2+1);
        loImageryGLM_different_word(loimagerydifferent, 4) = data(i, 18+1);
        loImageryGLM_different_word(loimagerydifferent, 2) = data(i, 3+1);
        loimagerydifferent = loimagerydifferent +1;
                elseif data(i, 10+1) == Imagery(subject, 8)
                        hiImagerydifferent(hiimagerydifferent, 1) = data(i, 12+1)
            hiImagerydifferent(hiimagerydifferent, 2)= zlrt(i);
            hiImagerydifferent(hiimagerydifferent, 3) = lrt(i);
            hiImagerydifferent(hiimagerydifferent, 4) = data(i, 3+1);
        hiImageryGLM_different_word(hiimagerydifferent, 1) = 1;
        hiImageryGLM_different_word(hiimagerydifferent, 3) = data(i, 2+1);
        hiImageryGLM_different_word(hiimagerydifferent, 4) = data(i, 18+1);
        hiImageryGLM_different_word(hiimagerydifferent, 2) = data(i, 3+1);
        hiimagerydifferent = hiimagerydifferent +1;
        else                         medImagerydifferent(medimagerydifferent, 1) = data(i, 12+1)
            medImagerydifferent(medimagerydifferent, 2)= zlrt(i);
            medImagerydifferent(medimagerydifferent, 3) = lrt(i);
            medImagerydifferent(medimagerydifferent, 4) = data(i, 3+1);
        medImageryGLM_different_word(medimagerydifferent, 1) = 1;
        medImageryGLM_different_word(medimagerydifferent, 3) = data(i, 2+1);
        medImageryGLM_different_word(medimagerydifferent, 4) = data(i, 18+1);
        medImageryGLM_different_word(medimagerydifferent, 2) = data(i, 3+1);
        medimagerydifferent = hiimagerydifferent +1;
        end
                end
        
        
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


% 
% meanSameRAW = nanmean(same_list(:,1))
% meanSameZ = nanmean(same_list(:,2))
% meanDifferentRAW = nanmean(random_word(:,1))
% meanDifferentZ = nanmean(random_word(:,2))
% rawDifferent = meanSameRAW-meanDifferentRAW
% zDifferent = meanSameZ - meanDifferentZ

    
%     % [B_tw, BI_tw, R_target_word] = regress(target_word(:, 2), GLM_target_word);
%     % [B_sl, BI_sl, R_same_list] = regress(same_list(:, 2), GLM_same_list);
%     % [B_rw, BI_rw, R_random_word] = regress(random_word(:, 2), GLM_random_word);
%     %
%     % targetResiduals = R_target_word;
%     % samelistResiduals = R_same_list;
%     % randomResiduals = R_random_word;
    
% figure(3)
% hold on;
% errors = [(nanstd(target_word(:, 4))/sqrt(length(target_word(:, 4)))),...        
% (nanstd(same_list(:, 4))/sqrt(length(same_list(:, 4)))),...
%         (nanstd(random_word(:, 4))/sqrt(length(random_word(:, 4))))]
% 
% errorbar([mean(target_word(:,4)), mean(same_list(:, 4)), mean(random_word(:, 4))], errors, 'blue');
%   title('Accuracy by Trial Type')
%     xlabel('1 = target word, 2 = same list word, 3 = different list word')
%     ylabel('Accuracy in DNMS')
% 
%     ylim([.8 1]);

%     hold off;
% figure(1)
%     errorbar([nanmean(target_word(:, 1)), nanmean(same_list(:, 1)), nanmean(random_word(:, 1))],...
%         [nanstd(target_word(:, 1))/sqrt(length(target_word(:, 1))),...
%         nanstd(same_list(:, 1))/sqrt(length(same_list(:, 1))),...
%         nanstd(random_word(:, 1))/sqrt(length(random_word(:, 1)))], 'red');
%     %plot([1, 2, 3], [mean(target_word(:, 1)), mean(same_list(:, 1)), mean(random_word(:, 1))], 'red');
%     title('raw reaction times')
%     xlabel('1 = target word, 2 = same list word, 3 = different list word')
%     ylabel('ms')
%     
%     figure(2)
%     errorbar([nanmean(target_word(:, 2)), nanmean(same_list(:, 2)), nanmean(random_word(:, 2))],...
%         [nanstd(target_word(:, 2))/sqrt(length(target_word(:, 2))),...
%         nanstd(same_list(:, 2))/sqrt(length(same_list(:, 2))),...
%         nanstd(random_word(:, 2))/sqrt(length(random_word(:, 2)))], 'blue');
%     %plot([1, 2, 3], [mean(target_word(:, 2)), mean(same_list(:, 2)), mean(random_word(:, 2))], 'blue');
%     title('zscored reaction times')
%     xlabel('1 = target word, 2 = same list word, 3 = different list word')
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
%     figure(3)
%     %plot([1 2 3], [nanmean(grandTarget), nanmean(grandSame), nanmean(grandRandom)], 'm')
%     errorbar([nanmean(grandTarget), nanmean(grandSame), nanmean(grandRandom)],...
%         [nanstd(grandTarget)/sqrt(length(grandTarget)),...
%         nanstd(grandSame)/sqrt(length(grandSame)),...
%         nanstd(grandRandom)/sqrt(length(grandRandom))], 'm');
%     title('reaction time residuals')
%     xlabel('1 = target word, 2 = same list word, 3 = different list word')
%     
%     [h, psametarget] = ttest2(grandSame, grandTarget, .05, 'right')
%     [h, psamerandom] = ttest2(grandSame, grandRandom, .05, 'right')
%     [h, prandomtarget] = ttest2(grandRandom, grandTarget, .05, 'left')
%     
%     %%
%     figure(4)
%     hold on;
%     errorbar([nanmean(hiImagerytarget(:, 2)), nanmean(hiImagerysame(:, 2)), nanmean(hiImagerydifferent(:, 2))],...
%         [nanstd(hiImagerytarget(:, 2))/sqrt(length(hiImagerytarget(:, 2))),...
%         nanstd(hiImagerysame(:, 2))/sqrt(length(hiImagerysame(:, 2))),...
%         nanstd(hiImagerydifferent(:, 2))/sqrt(length(hiImagerydifferent(:, 2)))], 'red');
%         errorbar([nanmean(medImagerytarget(:, 2)), nanmean(medImagerysame(:, 2)), nanmean(medImagerydifferent(:, 2))],...
%         [nanstd(medImagerytarget(:, 2))/sqrt(length(medImagerytarget(:, 2))),...
%         nanstd(medImagerysame(:, 2))/sqrt(length(medImagerysame(:, 2))),...
%         nanstd(medImagerydifferent(:, 2))/sqrt(length(medImagerydifferent(:, 2)))], 'magenta');
%         errorbar([nanmean(loImagerytarget(:, 2)), nanmean(loImagerysame(:, 2)), nanmean(loImagerydifferent(:, 2))],...
%         [nanstd(loImagerytarget(:, 2))/sqrt(length(loImagerytarget(:, 2))),...
%         nanstd(loImagerysame(:, 2))/sqrt(length(loImagerysame(:, 2))),...
%         nanstd(loImagerydifferent(:, 2))/sqrt(length(loImagerydifferent(:, 2)))], 'green');
%            errorbar([nanmean(noImagerytarget(:, 2)), nanmean(noImagerysame(:, 2)), nanmean(noImagerydifferent(:, 2))],...
%         [nanstd(noImagerytarget(:, 2))/sqrt(length(noImagerytarget(:, 2))),...
%         nanstd(noImagerysame(:, 2))/sqrt(length(noImagerysame(:, 2))),...
%         nanstd(noImagerydifferent(:, 2))/sqrt(length(noImagerydifferent(:, 2)))], 'blue');
%         title('zscored reaction times')
%     xlabel('1 = target, 2 = same bucket, 3 = different bucket')
%     legend('lo imagery list', 'med imagery list', 'hi imagery list', 'zero imagery list');
%     hold off;
%     
%         [h, hipsametarget] = ttest2(hiImagerysame(:, 2), hiImagerytarget(:, 2))
%     [h, lopsamerandom] = ttest2(loImagerysame(:, 2), loImagerytarget(:, 2))
%     
     figure(5)
    hold on;
    errorbar([nanmean(hiImagerytarget(:, 2)), nanmean(hiImagerysame(:, 2)), nanmean(hiImagerydifferent(:, 2))],...
        [nanstd(hiImagerytarget(:, 2))/sqrt(length(hiImagerytarget(:, 2))),...
        nanstd(hiImagerysame(:, 2))/sqrt(length(hiImagerysame(:, 2))),...
        nanstd(hiImagerydifferent(:, 2))/sqrt(length(hiImagerydifferent(:, 2)))], 'black');
%         errorbar([nanmean(medImagerytarget(:, 2)), nanmean(medImagerysame(:, 2)), nanmean(medImagerydifferent(:, 2))],...
%         [nanstd(medImagerytarget(:, 2))/sqrt(length(medImagerytarget(:, 2))),...
%         nanstd(medImagerysame(:, 2))/sqrt(length(medImagerysame(:, 2))),...
%         nanstd(medImagerydifferent(:, 2))/sqrt(length(medImagerydifferent(:, 2)))], 'magenta');
        errorbar([nanmean(loImagerytarget(:, 2)), nanmean(loImagerysame(:, 2)), nanmean(loImagerydifferent(:, 2))],...
        [nanstd(loImagerytarget(:, 2))/sqrt(length(loImagerytarget(:, 2))),...
        nanstd(loImagerysame(:, 2))/sqrt(length(loImagerysame(:, 2))),...
        nanstd(loImagerydifferent(:, 2))/sqrt(length(loImagerydifferent(:, 2)))], 'm');
%            errorbar([nanmean(noImagerytarget(:, 2)), nanmean(noImagerysame(:, 2)), nanmean(noImagerydifferent(:, 2))],...
%         [nanstd(noImagerytarget(:, 2))/sqrt(length(noImagerytarget(:, 2))),...
%         nanstd(noImagerysame(:, 2))/sqrt(length(noImagerysame(:, 2))),...
%         nanstd(noImagerydifferent(:, 2))/sqrt(length(noImagerydifferent(:, 2)))], 'blue');
        title('zscored rts')
        ylim([-.25, .3])
    xlabel('1 = target, 2 = same context, 3 = different context')
    legend('lo imagery list', 'hi imagery list');
    hold off;
    
        [h, hipsametarget] = ttest2(hiImagerysame(:, 2), hiImagerytarget(:, 2))
    [h, lopsamerandom] = ttest2(loImagerysame(:, 2), loImagerytarget(:, 2))
    %[h, prandomtarget] = ttest2(grandRandom, grandTarget, .05, 'left')
    %%
    
    %plot([1, 2, 3], [mean(target_word(:, 2)), mean(same_list(:, 2)), mean(random_word(:, 2))], 'blue');
%%
%%