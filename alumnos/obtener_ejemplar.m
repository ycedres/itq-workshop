function [flor] = obtener_ejemplar()
load iris_dataset.mat
caracteristicas=irisInputs;
floresNuevas=caracteristicas(:,info_entrenamiento.testInd);
flor=floresNuevas(randi(23));
end