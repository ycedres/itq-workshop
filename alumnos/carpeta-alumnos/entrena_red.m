function [red_entrenada,info_entrenamiento] = entrena_red(net,caracteristicas,clasificacion)


% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

[red_entrenada,info_entrenamiento] = train(net,caracteristicas,clasificacion);

end