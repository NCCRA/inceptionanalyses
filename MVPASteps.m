mriSubjects = [2 4 7 8 14 16 17 18 19 20 22 23 24 26 28 29 30 31 32 33 35 36 37 38];
behavioralSubjects = [12 (mriSubjects(2:length(mriSubjects)) + 11)];

mriSubjectsAboveChance = [2 4 7 8 14 17 18 19 22 23 24 26 28 29 30 32 33 35 37];
behavioralSubjectsAboveChance = [ 12 [mriSubjectsAboveChance(2:length(mriSubjectsAboveChance)) + 11]];

A0_MakeRegressors(behavioralSubjects)
A1_StimulusMatrixMaker(behavioralSubjects)
A2_InceptionMVPAMasked(behavioralSubjects)
A4_ParsedDataMaker(behavioralSubjects)
