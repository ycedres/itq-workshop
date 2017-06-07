function [mal_clasificadas_caracteristicas,mal_clasificadas_clasificacion_red,mal_clasificadas_clasificacion_real]=obtener_mal_clasificadas

caracteristicas=evalin('base','caracteristicas'); %Caracteristicas reales
clasificacion=evalin('base','clasificacion'); %Clasificacion real

info_entrenamiento=evalin('base','info_entrenamiento'); %Contiene los índices de las muestras de train,val y test
clasificacion_red=evalin('base','clasificacion_red'); %La clasificacion dada por la red
disp('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@')
[val,idx]=max(clasificacion_red)

indices_val_test=[info_entrenamiento.valInd;info_entrenamiento.testInd];
indices_val_test=indices_val_test(:)';

caracteristicas_test=caracteristicas(:,indices_val_test); %Caracteristicas de musetras test
clasificacion_test=clasificacion(:,indices_val_test); %Tablas de verdad muestras test
clasificacion_red_test=clasificacion_red(:,indices_val_test); %Clasificacion red muestras test

[~,idx_real]=max(clasificacion_test); %El indice del maximo (softmax) real para cada muestra test
[~,idx_red]=max(clasificacion_red_test); %El indice del maximo (softmax) dado por la red para cada muestra test

index_error=idx_real~=idx_red
mal_clasificadas_idx=find(index_error~=0);
mal_clasificadas_caracteristicas=caracteristicas_test(:,mal_clasificadas_idx);
mal_clasificadas_clasificacion_red=clasificacion_red_test(:,mal_clasificadas_idx);
mal_clasificadas_clasificacion_real=clasificacion_test(:,mal_clasificadas_idx);

end