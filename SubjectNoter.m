%all subjects with usable data
mriSubjects = [4 7 8 17 18 19 22 23 24 26 28 29 30 31 32 33 35 36 37 38];
behavioralSubjects = [(mriSubjects(2:length(mriSubjects)) + 11)];

mriSubjectsGreaterThanChance = [4 7 8 17 18 19 22 23 24 26 28 29 30 32 33 35 37];
behavioralSubjectsAboveChance = [[mriSubjectsGreaterThanChance(2:length(mriSubjectsGreaterThanChance)) + 11]];

SubjectNotes.mriSubjects = mriSubjects;
SubjectNotes.behavioralSubjects = behavioralSubjects;
SubjectNotes.mriSubjectsGreaterThanChance = mriSubjectsGreaterThanChance;
SubjectNotes.behavioralSubjectsAboveChance = behavioralSubjectsAboveChance;

save('SubjectNotes.mat', 'SubjectNotes')