function [net] = define_red(hiddenLayerSize,learning_rate,epochs)

% Elige un algoritmo de backpropagation
% Puedes obtener una lista completa con: help nntrain

trainFcn = 'trainscg';  % Scaled conjugate gradient backpropagation.
%trainFcn = 'traingd';  % Gradient descent backpropagation.
% Crea una red para clasificación
net = patternnet(hiddenLayerSize, trainFcn);
%net.trainParam.showWindow=1;
net.trainParam.lr = learning_rate;
net.trainParam.epochs = epochs;

end