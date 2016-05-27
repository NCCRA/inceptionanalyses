function RecallAtEndOfExperiment(obj, blockNum)        

wordsHupbach = {' apple', ' box', ' bucket',...
            ' bulb', ' bush', ' camera', ' candy', ' card',...
            ' clip', ' coin', ' comb', ' crayon',...
            ' cup', ' dice', ' disk', ' eraser', ' feather',...
            ' flower', ' glue', ' key', ' leaf',...
            ' light', ' lock', ' marker', ' nail', ' note', ' paint', ' paper'...
             ' pin', ' plate', ' pot' ,...
            ' sock', ' sponge',' stamp', ' stapler', ' stick',...
             ' tape' , ' thread', ' tile', ' tissue', ' towel', ' toy',...
            ' tree', ' tube', ' vase', ' wallet',...
            ' wire', ' wood'};
                words= {' ankle', ' apple', ' ball', ' bean', ' belt',...
            ' bird', ' boat', ' book', ...
            ' chair', ' cherry', ' coat', ' cork',...
            ' cotton', ' door', ' drum', ' elbow', ' flag',...
            ' glass', ' glove', ' hammer', ' helmet', ' house',...
            ' lamp', ' lemon', ' milk', ' mirror',...
            ' pencil', ' penny', ' piano', ' pillow',...
            ' ring', ' rock', ' rope', ' ruler', ' sand', ' shirt',...
            ' shovel', ' soap', ' spoon', ' stick',...
            ' stove', ' straw', ' table', ' tent', ' thread', ...
            ' train', ' water', ' window'};
        
        randHupbach = randperm(length(wordsHupbach));
        randWords = randperm(length(words));
        randHupbachWordsOrder = randperm(length(randHupbach) + length(randWords));
        
        for i = 1:length(randHupbachWordsOrder)
            if mod(randHupachWordsOrder, 2) == 1
                 obj.blockData(blockNum).trialData(i).HupbachWord = 1;
                  obj.blockData(blockNum).trialData(i).InceptionWord = 0;
                trialWord = wordsHupbach{randHupbach(i)};
                obj.blockData(blockNum).trialData(i).trialWord = trialWord;
                  DrawFormattedText(obj.window, ['How confident are you that this word comes from one of the learning lists?/npress left for high confidence its a new word 1\middle finger for low confidence its a new word 2\n ring finger for low confidence its an old word 3\n pinky for confident its an old word \n\n' trialWord], 'center', 'center', obj.textColor, 60);
                Screen('Flip', obj.window);
                response = 0;
                while response == 0
                [keyIsDown, ~, keyCode] = KbCheck(obj.TriggerDevice);          % Checks to see if key has been pressed
                if keyIsDown
                    keyStrokes = KbName(find(keyCode))
                    response = 1;
                    obj.blockData(blockNum).trialData(i).RecognizedWord = keyStrokes;
                end
                end
                DrawFormattedText(obj.window, ['If you had to guess, which list did this word come from? \n press left for list 1\middle finger for list 2\n ring finger for list 3\n pinky for list 4 \n\n' trialWord], 'center', 'center', obj.textColor, 60);
                Screen('Flip', obj.window);
                                response = 0;
                while response == 0
                [keyIsDown, ~, keyCode] = KbCheck(obj.TriggerDevice);          % Checks to see if key has been pressed
                if keyIsDown
                    keyStrokes = KbName(find(keyCode))
                    response = 1;
                    obj.blockData(blockNum).trialData(i).WhichList = keyStrokes;
                end
                end
            else
                 obj.blockData(blockNum).trialData(i).HupbachWord = 0;
                  obj.blockData(blockNum).trialData(i).InceptionWord = 1;
                trialWord = words{randWords(i)};
                  DrawFormattedText(obj.window, ['How confident are you that this word comes from one of the learning lists?/npress left for high confidence its a new word 1\middle finger for low confidence its a new word 2\n ring finger for low confidence its an old word 3\n pinky for confident its an old word \n\n' trialWord], 'center', 'center', obj.textColor, 60);
                Screen('Flip', obj.window);
                response = 0;
                while response == 0
                [keyIsDown, ~, keyCode] = KbCheck(obj.TriggerDevice);          % Checks to see if key has been pressed
                if keyIsDown
                    keyStrokes = KbName(find(keyCode))
                    response = 1;
                    obj.blockData(blockNum).trialData(i).RecognizedWord = keyStrokes;
                end
                end
                DrawFormattedText(obj.window, ['If you had to guess, which list did this word come from? \n press left for list 1\middle finger for list 2\n ring finger for list 3\n pinky for list 4 \n\n' trialWord], 'center', 'center', obj.textColor, 60);
                Screen('Flip', obj.window);
                                response = 0;
                while response == 0
                [keyIsDown, ~, keyCode] = KbCheck(obj.TriggerDevice);          % Checks to see if key has been pressed
                if keyIsDown
                    keyStrokes = KbName(find(keyCode))
                    response = 1;
                    obj.blockData(blockNum).trialData(i).trialWord = trialWord;
                    obj.blockData(blockNum).trialData(i).WhichList = keyStrokes;
                end
                end
            end
        end
end
       