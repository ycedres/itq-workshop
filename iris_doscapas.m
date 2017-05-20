% Solve a Pattern Recognition Problem with a Neural Network
% Script generated by Neural Pattern Recognition app
% Created 20-May-2017 12:00:41
%
% This script assumes these variables are defined:
%
%   irisInputs - input data.
%   irisTargets - target data.
load iris_dataset.mat
x = irisInputs;
t = irisTargets;

% Choose a Training Function
% For a list of all training functions type: help nntrain
% 'trainlm' is usually fastest.
% 'trainbr' takes longer but may be better for challenging problems.
% 'trainscg' uses less memory. Suitable in low memory situations.
% 'trainscg';  % Scaled conjugate gradient backpropagation.
trainFcn = 'trainscg';
% Create a Pattern Recognition Network
hiddenLayerSize = [10,10];
net = patternnet(hiddenLayerSize, trainFcn);
net.trainParam.showWindow=0;
% Setup Division of Data for Training, Validation, Testing
net.divideFcn='divideblock';
net.divideParam.trainRatio = 80/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Train the Network
[net,tr] = train(net,x,t);

% Test the Network
y = net(x);
e = gsubtract(t,y);
performance = perform(net,t,y) % net.performFcn = 'crossentropy'
% Matriz de 1xM (1 fila). En cada elemento esta el indice de la columna
% que tenia un 1 (cada columna es 1 en la clase correcta y 0 en las que no)
tind = vec2ind(t); 
yind = vec2ind(y);
percentErrors = sum(tind ~= yind)/numel(tind);
accuracy = 100-(percentErrors*100)
% View the Network
%view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, ploterrhist(e)
%figure, plotconfusion(t,y)
%figure, plotroc(t,y)

