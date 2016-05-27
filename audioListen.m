%%listen to audio recordings
% go to Dropbox/AbigailNovick/InceptionfMRIScenesFaces/fMRISubjects
% load each of the following subjects:

% 1100
% 1200_NeedToScore
% 1300_NeedToScore
% 1400_NeedToScore
% 1501
% 1600
% 1700
% 1800
% 1900
% 2000
% 2100_NeedToScore
% 2200
% 2201
% 2300

fs = 23050;
grandaudio ={};
    for blockNum =1:16
    for trialNum = 1:3
        grandaudio{(blockNum-1) *3 + trialNum, 1} = blockNum;
        grandaudio{(blockNum-1) *3 + trialNum, 2} = trialNum;
        grandaudio{(blockNum-1) * 3 + trialNum, 3} =  blockData(blockNum).trialData(trialNum).globalLearningList;
        grandaudio{(blockNum-1) * 3 + trialNum, 4} =  blockData(blockNum).trialData(trialNum).targetWords;
    end
    end
    
%     copy the results from grandaudio into a spreadsheet to help you keep
%     your place during transcription.
%     press the left arrow when you're ready to move on to transcription.
    
                
    

for blockNum =1:16
    for trialNum = 1 %UNCOMMENT should be 1:3
        trialNum
trial = (blockNum-1)*3 + trialNum
        blockData(blockNum).trialData(trialNum).targetWords
        
        KbWait;
        audio = blockData(blockNum).trialData(trialNum).response;
       sound(audio, fs);
       WaitSecs(2);
       KbName('UnifyKeyNames');
                moveleft = KbName('LeftArrow');
                [keyIsDown, KbTime, keyCode] = KbCheck;
                left = 0;
                while keyIsDown *left == 0;
                    [keyIsDown, KbTime, keyCode] = KbCheck;
                    if keyIsDown
                        if keyCode(moveleft)
                            left =1;
                            break;
                        end;    end;      end;
           
        
    end
end   