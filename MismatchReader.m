%%mismatch style
grandarray1 = { 1, 1, 'hi'};
grandarray2 = { 1, 1, 'hi'};

% 1Subject	2block	3trial	4correct words	5actual response	6#substitutions
%7substituted words	8substitute list	9mistake in previous list?	10learning list #
% 11interference type	12RT	13mismatch Word	14mismatch kind	15mismatch new word
% 16mismatch seenit	17mismatch testlist	18 mismatch accuracy
% 19 task switch  20 same finger  21 index finger

learningleftright = {ones(4,1) *3};
for block = 1:16
    learningleftright{blockData(1, block).trialData(1, 1).globalLearningList} = blockData(1, block).trialData(1, 1).leftright;
end


responseArrayIndex = 1;
for block = 17:21
    for trial = 1:12
        mismatchblock{responseArrayIndex} = block;
        grandarray1{responseArrayIndex, 1} = block;
        mismatchtrial{responseArrayIndex} = trial;
        grandarray1{responseArrayIndex, 2} = trial;
        mismatchtargetWords{responseArrayIndex} = {blockData(1, block).trialData(1, trial).targetWords};
        grandarray1{responseArrayIndex, 3} = {blockData(1, block).trialData(1, trial).targetWords};
        
        %responseArray(responseArrayIndex) = {[block], [trial], [blockData(1, block).trialData(1, trial).targetWords], [blockData(1, block).trialData(1, trial).interference], [blockData(1, block).trialData(1, trial).globalLearningList]};
        
        if  and(blockData(1, block).trialData(1, trial).RT > 100, blockData(1, block).trialData(1, trial).RT < 5000)
            mismatchRT{responseArrayIndex} = blockData(1, block).trialData(1, trial).RT;
            grandarray2{responseArrayIndex, 1} = blockData(1, block).trialData(1, trial).RT;
        else
            mismatchRT{responseArrayIndex} = NaN;
            grandarray2{responseArrayIndex, 1} = NaN;
        end
        mismatchWord{responseArrayIndex} = {blockData(1, block).trialData(1, trial).mismatchWord};
        grandarray2{responseArrayIndex, 2} = {blockData(1, block).trialData(1, trial).mismatchWord};
        mismatchkindMatch{responseArrayIndex} = blockData(1, block).trialData(1, trial).kindMatch;
        grandarray2{responseArrayIndex, 3} = blockData(1, block).trialData(1, trial).kindMatch;
        mismatchnewWord{responseArrayIndex} = blockData(1, block).trialData(1, trial).newWord;
        grandarray2{responseArrayIndex, 4} = blockData(1, block).trialData(1, trial).newWord;
        mismatchseenWord{responseArrayIndex} = blockData(1, block).trialData(1, trial).seenWord;
        grandarray2{responseArrayIndex, 5} = blockData(1, block).trialData(1, trial).seenWord;
        mismatchtestList{responseArrayIndex} = blockData(1, block).trialData(1, trial).testList;
        grandarray2{responseArrayIndex, 6} = blockData(1, block).trialData(1, trial).testList;
        mismatchLearningList{responseArrayIndex} = blockData(1, block).trialData(1, trial).learningList;
        grandarray2{responseArrayIndex, 7} = blockData(1, block).trialData(1, trial).learningList;
        
        if blockData(1, block).trialData(1, trial).useIndexFingerOld == 1
            mismatchseenWord{responseArrayIndex}...
                = blockData(1, block).trialData(1, trial).left;
            mismatchnewWord{responseArrayIndex}...
                = blockData(1, block).trialData(1, trial).right;
        else
            mismatchseenWord{responseArrayIndex}...
                = blockData(1, block).trialData(1, trial).right;
            mismatchnewWord{responseArrayIndex}...
                = blockData(1, block).trialData(1, trial).left;
        end
        
        if and(mismatchkindMatch{responseArrayIndex} == 1, mismatchseenWord{responseArrayIndex} ==1)
            mismatchAccuracy{responseArrayIndex} = 1;
            grandarray2{responseArrayIndex, 7} = 1;
        elseif and(mismatchkindMatch{responseArrayIndex} > 1, mismatchnewWord{responseArrayIndex} ==1)
            mismatchAccuracy{responseArrayIndex} = 1;
            grandarray2{responseArrayIndex, 7} = 1;
        else mismatchAccuracy{responseArrayIndex} = 0;
            grandarray2{responseArrayIndex, 7} = 0;
        end
        
        
        
        
        %         if and(block > 17, trial ==1)
        %             mismatchTaskSwitch{responseArrayIndex} = 1;
        %             grandarray2{responseArrayIndex, 8} = 1;
        %         else
        %             mismatchTaskSwitch{responseArrayIndex} = 0;
        %             grandarray2{responseArrayIndex, 8} = 0;
        %         end
        %
        if responseArrayIndex > 1
            if mismatchnewWord{responseArrayIndex} == mismatchnewWord{responseArrayIndex-1}
                mismatchPreparedResponse{responseArrayIndex} = 1;
                grandarray2{responseArrayIndex, 9} = 1;
            else
                mismatchPreparedResponse{responseArrayIndex} = 0;
                grandarray2{responseArrayIndex, 9} = 0;
            end
        end
        grandarray2{responseArrayIndex, 10} = blockData(1, block).trialData(1, trial).fingers;
        
        responseArrayIndex = responseArrayIndex + 1;
         
        if blockData(1, block).trialData(1, trial).testList == 0
 mismatchRT{responseArrayIndex} = NaN;
        else
        if learningleftright{blockData(1, block).trialData(1, trial).learningList} ==...
                learningleftright{blockData(1, block).trialData(1, trial).testList}
            grandarray2{responseArrayIndex, 11} = 0; %code for same side
        else grandarray2{responseArrayIndex, 11} = 1; %code for different side
        end
        
        if learningleftright{blockData(1, block).trialData(1, trial).learningList} == 0
            grandarray2{responseArrayIndex, 12} = 0; %code for right stimulus presentation
        else grandarray2{responseArrayIndex, 12} = 1; %code for left stimulus presentation
        end
        
        if learningleftright{blockData(1, block).trialData(1, trial).testList} == 0
            grandarray2{responseArrayIndex, 13} = 0; %code for right stimulus presentation
        else grandarray2{responseArrayIndex, 13} = 1; %code for left stimulus presentation
        end
        
        if learningleftright{blockData(1, block).trialData(1, trial).learningList} == 1
            grandarray2{responseArrayIndex, 14} = 1; %code for face
        elseif  learningleftright{blockData(1, block).trialData(1, trial).learningList} == 3
                        grandarray2{responseArrayIndex, 14} = 1; %code for face
        else grandarray2{responseArrayIndex, 14} = 0; %code for scene
        end
        
        if or(learningleftright{blockData(1, block).trialData(1, trial).testList} == 1,...
                learningleftright{blockData(1, block).trialData(1, trial).testList} == 3)
            grandarray2{responseArrayIndex, 15} = 1; %code for face
        else grandarray2{responseArrayIndex, 15} = 0; %code for scene
        end
        end
        
    end
end

mismatchblock = mismatchblock';
mismatchtrial = mismatchtrial';
mismatchtargetWords = mismatchtargetWords';
mismatchLearningList = mismatchLearningList'; %
mismatchRT = mismatchRT'; % check
mismatchWord = mismatchWord'; %
mismatchkindMatch = mismatchkindMatch'; %
mismatchnewWord = mismatchnewWord'; %check
mismatchseenWord = mismatchseenWord'; %check
mismatchtestList = mismatchtestList'; %
mismatchAccuracy = mismatchAccuracy';
%mismatchTaskSwitch = mismatchTaskSwitch';
mismatchPreparedResponse = mismatchPreparedResponse';

% 1Subject	2block	3trial	4correct words	5actual response	6#substitutions
%7substituted words	8substitute list	9mistake in previous list?	10learning list #
% 11interference type	12RT	13mismatch Word	14mismatch kind	15mismatch new word
% 16mismatch seenit	17mismatch testlist	18 mismatch accuracy
% 19 task switch  20 same finger  21 index finger  22 left/right
% 23 target/probe on same side? 24 targets from left or right 25 probe from
% left or right 26 target was face or scene 27 probe was face or scene

grandarrayfinal(:, 1) = grandarray1(:, 1);
grandarrayfinal(:, 2) = mismatchblock;
grandarrayfinal(:, 3) = mismatchtrial;
% grandarrayfinal(:, 4) = leftright;
% grandarrayfinal(:, 5) = ITIS;
grandarrayfinal(:, 10) = mismatchLearningList;
grandarrayfinal(:, 11) = mismatchkindMatch;
grandarrayfinal(:, 12) = mismatchRT;
grandarrayfinal(:, 13) = mismatchnewWord;
grandarrayfinal(:, 14) = mismatchkindMatch;
grandarrayfinal(:, 15) = grandarray2(1:60, 5);
grandarrayfinal(:, 16) = grandarray2(1:60, 6);
grandarrayfinal(:, 17) = mismatchtestList;
grandarrayfinal(:, 18) = mismatchAccuracy;
%grandarrayfinal(:, 19) = mismatchTaskSwitch;
grandarrayfinal(:, 22) = grandarray2(1:60, 10); %left = old word vs. right = old word
grandarrayfinal(:, 23) = grandarray2(1:60, 11); %same target probe side
grandarrayfinal(:, 24) = grandarray2(1:60, 12); %targets came from left or right
grandarrayfinal(:, 25) = grandarray2(1:60, 13); %probe came from left or right
grandarrayfinal(:, 26) = grandarray2(1:60, 14); %target was face or scene
grandarrayfinal(:, 27) = grandarray2(1:60, 15); %probe was face or scene
