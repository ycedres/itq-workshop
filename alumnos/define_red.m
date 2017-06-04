function [net] = define_red()

% Elige un algoritmo de backpropagation
% Puedes obtener una lista completa con: help nntrain

trainFcn = 'trainscg';  % Scaled conjugate gradient backpropagation.
%trainFcn = 'traingd';  % Gradient descent backpropagation.
hiddenLayerSize = 10;
% Crea una red para clasificación
net = patternnet(hiddenLayerSize, trainFcn);
%net.trainParam.showWindow=1;
%net.trainParam.lr = 0.01;
%net.trainParam.epochs = 10000;

end