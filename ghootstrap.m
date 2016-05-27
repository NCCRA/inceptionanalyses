function [p rawEffects subjSamples opts] = ghootstrap(data, varargin)
% function [p rawEffects subjSamples opts] = ghootstrap(data, varagin)
%
% Generic 'ghootstrap'
%
% INPUTS:
%   data - N subjects by K observations by 2 timeseries array.
%          NaNs will be stripped before passing to testFunc.
%
%
% OPTIONS:
%   verbose     (false)     Print summary diagnostic information.
%   veryverbose (false)     Print data on each iteration.
%   testFunc                The function to produce the effects, defaults to '@(x)(corr(x(:, 1), x(:, 2)))'.
%   numIter     (1000)      Number of iterations to run.
%   randSeed    ([])        Seed to use for the RNG. If empty, use system default.
%   baseEffect  ([])        Base effect against which to test effect distribution. If empty, run testFunc on full dataset provided.
%   testRun     ([])        If not empty, generate some normally-distributed random data and insert some NaNs.
%                           (first three elements are size of data array, last is fraction of NaNs; or set to true for [10 20 2 0.05])
%                           Note this overwrites any supplied data in 'data'.
%
%
% RETURNS
%   p               Proportion of rawEffects of the same direction as the full run of testfunc.
%   rawEffects      Raw array of effect sizes.
%   subjSamples     Array of sampled subject #s.
%   opts            Options that produced this run.
%
%
% ~ Aaron M. Bornstein <aaronmb@princeton.edu> Oct 2015 (after Ghootae Kim, described in Kim et al 2014 PNAS)
%
%

[opts] = parse_args(varargin, 'verbose', false, ...
                              'veryverbose', false, ...
                              'testFunc', [], ...
                              'numIter', 1000, ...
                              'randSeed', [], ...
                              'baseEffect', [], ...
                              'testRun', []);

if (~isempty(opts.randSeed))
    rng(opts.randSeed);
else
    opts.randSeed = rng;
    opts.randSeed = opts.randSeed.Seed;
end
if (opts.verbose)
    disp(['ghootstrap: Random seed: ' num2str(opts.randSeed)]);
end

if (isempty(opts.testFunc))
    opts.testFunc = @(x)(corr(x(:, 1), x(:, 2)));
end
if (opts.verbose)
    disp(['ghootstrap: Using testFunc ' func2str(opts.testFunc)]);
end

if (~isempty(opts.testRun))
    if (opts.verbose)
        disp(['ghootstrap: Running tests...']);
    end
    if (length(opts.testRun) < 4)
        nanFrac = 0.05;
        data    = randn(10, 20, 2);
    else
        nanFrac = opts.testRun(4);
        data    = randn(opts.testRun(1:3));
    end

    % Add NaNs to randomly-generated data.
    % NB: Adds NaNs evenly to each subject & slice
    for sliceIdx = 1:size(data, 3);
        for subjIdx = 1:size(data, 1);
            nanEls  = randperm(size(data,2));
            nanEls  = nanEls(1:ceil(nanFrac*size(data,2)));

            data(subjIdx, nanEls, sliceIdx) = NaN;
        end
    end

    if (opts.verbose)
        disp(['ghootstrap: Randomly generated data of size ' num2str(size(data))]);
        for sliceIdx = 1:size(data, 3);
            sliceData = reshape(data, [size(data, 1)*size(data,2) size(data, 3)]);
            disp(['ghootstrap: Data series ' num2str(sliceIdx) ...
                  ': Number of non-NaN elements=' num2str(sum(~isnan(sliceData(:, sliceIdx)))) ...
                  ', mean=' num2str(nanmean(sliceData(:, sliceIdx))) ...
                  ', std=' num2str(nanstd(sliceData(:, sliceIdx)))]);
        end % for sliceIdx
    end % if verbose
end % if testRun

% For each of numIter iters, draw N subjects with replacement (allowing duplicates).
% NB: Uniform across subjects. Future: User-specified prior over subjects? Nonparametric identification of likelihood of each subject?
subjSamples     = ceil(rand(opts.numIter, size(data, 1))*size(data, 1));
numTrials       = size(data, 2);

% Stack subjects so data are in timeseries format.
data            = reshape(data, [size(data, 1)*size(data, 2) size(data, 3)]);
if (isempty(opts.baseEffect))
    opts.baseEffect = opts.testFunc(stripnans(data));
end
if (opts.verbose)
    disp(['ghootstrap: Base effect size: ' num2str(opts.baseEffect)]);
end

if (opts.verbose)
    disp(['ghootstrap: Running ' num2str(opts.numIter) ...
          ' iterations...']);
end

% Run numIter iterations, selecting numTrials from each subject.
for iterIdx = 1:opts.numIter;
    theseSubjs          = subjSamples(iterIdx, :);
    trialSelect         = [];
    for thisSubj = theseSubjs;
        trialSelect         = [trialSelect ; ((numTrials*(thisSubj-1))+1):(numTrials*thisSubj)];
    end
    theseData           = data(trialSelect, :);
    rawEffects(iterIdx) = opts.testFunc(stripnans(theseData));
    if (opts.veryverbose)
        disp(['ghootstrap: Iteration ' num2str(iterIdx) ...
              ', selecting data from subjects ' num2str(theseSubjs) ...
              '. Effect=' num2str(rawEffects(iterIdx), '%.2f') ...
              ' (' num2str(sign(rawEffects(iterIdx))==sign(opts.baseEffect)) ...
              ')']);
    end
end % for iterIdx

p = mean(sign(rawEffects)~=sign(opts.baseEffect));

if (opts.verbose)
    disp(['ghootstrap: Result: ' num2str(p*100) ...
          '% of iterations with different effect direction from full dataset.']);
end

end % function ghootstrap

function d = stripnans(d)
    d = d(~any(isnan(d)'), :);
end
