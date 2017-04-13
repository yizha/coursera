function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

%{

vals = [0.01 0.03 0.1 0.3 1 3 10 30];
len = length(vals);
errs = zeros(len, len);

for i = 1:8
    for j = 1:8
        c = vals(i);
        s = vals(j);
        idx = 8 * (i - 1) + j;
        fprintf(['\n[%d] C = %f, sigma= %f'], idx, c, s);
        model = svmTrain(X, y, c, @(x1, x2) gaussianKernel(x1, x2, s));
        preds = svmPredict(model, Xval);
        errs(i,j) = mean(double(preds ~= yval));
    end
end

min_err = errs(1,1);
C = vals(1);
sigma = vals(1);
fprintf('\n');
for i = 1:8
    for j = 1:8
        idx = 8 * (i - 1) + j;
        fprintf(['\n[%2d] C = %2.6f, sigma= %f, error = %f'], idx, vals(i), vals(j), errs(i, j));
        if errs(i, j) < min_err
            C = vals(i);
            sigma = vals(j);
            min_err = errs(i, j);
        end
    end
end
fprintf('\n');
fprintf(['Selected C = %f, sigma = %f\n'], C, sigma);
fprintf('\nPress any key to continue ...');
pause;

%}

%{

[ 1] C = 0.010000, sigma= 0.010000, error = 0.565000
[ 2] C = 0.010000, sigma= 0.030000, error = 0.060000
[ 3] C = 0.010000, sigma= 0.100000, error = 0.045000
[ 4] C = 0.010000, sigma= 0.300000, error = 0.145000
[ 5] C = 0.010000, sigma= 1.000000, error = 0.180000
[ 6] C = 0.010000, sigma= 3.000000, error = 0.185000
[ 7] C = 0.010000, sigma= 10.000000, error = 0.185000
[ 8] C = 0.010000, sigma= 30.000000, error = 0.175000
[ 9] C = 0.030000, sigma= 0.010000, error = 0.565000
[10] C = 0.030000, sigma= 0.030000, error = 0.060000
[11] C = 0.030000, sigma= 0.100000, error = 0.045000
[12] C = 0.030000, sigma= 0.300000, error = 0.140000
[13] C = 0.030000, sigma= 1.000000, error = 0.180000
[14] C = 0.030000, sigma= 3.000000, error = 0.180000
[15] C = 0.030000, sigma= 10.000000, error = 0.180000
[16] C = 0.030000, sigma= 30.000000, error = 0.185000
[17] C = 0.100000, sigma= 0.010000, error = 0.565000
[18] C = 0.100000, sigma= 0.030000, error = 0.060000
[19] C = 0.100000, sigma= 0.100000, error = 0.045000
[20] C = 0.100000, sigma= 0.300000, error = 0.080000
[21] C = 0.100000, sigma= 1.000000, error = 0.170000
[22] C = 0.100000, sigma= 3.000000, error = 0.185000
[23] C = 0.100000, sigma= 10.000000, error = 0.180000
[24] C = 0.100000, sigma= 30.000000, error = 0.185000
[25] C = 0.300000, sigma= 0.010000, error = 0.565000
[26] C = 0.300000, sigma= 0.030000, error = 0.060000
[27] C = 0.300000, sigma= 0.100000, error = 0.035000
[28] C = 0.300000, sigma= 0.300000, error = 0.060000
[29] C = 0.300000, sigma= 1.000000, error = 0.100000
[30] C = 0.300000, sigma= 3.000000, error = 0.180000
[31] C = 0.300000, sigma= 10.000000, error = 0.180000
[32] C = 0.300000, sigma= 30.000000, error = 0.180000
[33] C = 1.000000, sigma= 0.010000, error = 0.565000
[34] C = 1.000000, sigma= 0.030000, error = 0.065000
[35] C = 1.000000, sigma= 0.100000, error = 0.030000
[36] C = 1.000000, sigma= 0.300000, error = 0.070000
[37] C = 1.000000, sigma= 1.000000, error = 0.075000
[38] C = 1.000000, sigma= 3.000000, error = 0.140000
[39] C = 1.000000, sigma= 10.000000, error = 0.180000
[40] C = 1.000000, sigma= 30.000000, error = 0.180000
[41] C = 3.000000, sigma= 0.010000, error = 0.565000
[42] C = 3.000000, sigma= 0.030000, error = 0.080000
[43] C = 3.000000, sigma= 0.100000, error = 0.035000
[44] C = 3.000000, sigma= 0.300000, error = 0.075000
[45] C = 3.000000, sigma= 1.000000, error = 0.085000
[46] C = 3.000000, sigma= 3.000000, error = 0.090000
[47] C = 3.000000, sigma= 10.000000, error = 0.180000
[48] C = 3.000000, sigma= 30.000000, error = 0.180000
[49] C = 10.000000, sigma= 0.010000, error = 0.565000
[50] C = 10.000000, sigma= 0.030000, error = 0.080000
[51] C = 10.000000, sigma= 0.100000, error = 0.070000
[52] C = 10.000000, sigma= 0.300000, error = 0.070000
[53] C = 10.000000, sigma= 1.000000, error = 0.085000
[54] C = 10.000000, sigma= 3.000000, error = 0.075000
[55] C = 10.000000, sigma= 10.000000, error = 0.165000
[56] C = 10.000000, sigma= 30.000000, error = 0.180000
[57] C = 30.000000, sigma= 0.010000, error = 0.565000
[58] C = 30.000000, sigma= 0.030000, error = 0.080000
[59] C = 30.000000, sigma= 0.100000, error = 0.060000
[60] C = 30.000000, sigma= 0.300000, error = 0.065000
[61] C = 30.000000, sigma= 1.000000, error = 0.105000
[62] C = 30.000000, sigma= 3.000000, error = 0.075000
[63] C = 30.000000, sigma= 10.000000, error = 0.100000
[64] C = 30.000000, sigma= 30.000000, error = 0.180000
Selected C = 1.000000, sigma = 0.100000

%}

C = 1.0;
sigma = 0.1;

% =========================================================================

end
