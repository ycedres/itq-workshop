function [mal_clasificadas_caracteristicas,mal_clasificadas_clasificacion_red,mal_clasificadas_clasificacion_real]=obtener_mal_clasificadas

caracteristicas=evalin('base','caracteristicas'); %Caracteristicas reales
clasificacion=evalin('base','clasificacion'); %Clasificacion real

info_entrenamiento=evalin('base','info_entrenamiento'); %Contiene los índices de las muestras de train,val y test
clasificacion_red=evalin('base','clasificacion_red'); %La clasificacion dada por la red

caracteristicas_test=caracteristicas(:,info_entrenamiento.testInd); %Caracteristicas de musetras test
clasificacion_test=clasificacion(:,info_entrenamiento.testInd); %Tablas de verdad muestras test
clasificacion_red_test=clasificacion_red(:,info_entrenamiento.testInd); %Clasificacion red muestras test

[~,idx_real]=max(clasificacion_test); %El indice del maximo (softmax) real para cada muestra test
[~,idx_red]=max(clasificacion_red_test); %El indice del maximo (softmax) dado por la red para cada muestra test

index_error=idx_real~=idx_red;
index_error=sum(index_error);
mal_clasificadas_idx=find(index_error~=0);
mal_clasificadas_caracteristicas=caracteristicas_test(:,mal_clasificadas_idx);
mal_clasificadas_clasificacion_red=clasificacion_red_test(:,mal_clasificadas_idx);
mal_clasificadas_clasificacion_real=clasificacion_test(:,mal_clasificadas_idx);

% [val,idx]=max(clasificacion_red_test);
% prediccion=zeros(3,size(idx,2));
% 
% for i=1:size(idx,2)
%     prediccion(idx(i),i)=1;
% end
% %
% 
% 
% index_error=clasificacion_test~=prediccion;
% index_error=sum(index_error);
% mal_clasificadas_idx=find(index_error~=0);
% mal_clasificadas_caracteristicas=caracteristicas(:,mal_clasificadas_idx);
% mal_clasificadas_clasificacion_red=clasificacion_test(:,mal_clasificadas_idx);
% mal_clasificadas_clasificacion_real=clasificacion(:,mal_clasificadas_idx);


end