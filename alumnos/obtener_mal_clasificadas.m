function [mal_clasificadas_caracteristicas,mal_clasificadas_clasificacion_red,mal_clasificadas_clasificacion_real]=obtener_mal_clasificadas()

red_entrenada=evalin('base','red_entrenada');
caracteristicas=evalin('base','caracteristicas');
clasificacion=evalin('base','clasificacion');
info_entrenamiento=evalin('base','info_entrenamiento');

floresNuevas=caracteristicas(:,info_entrenamiento.testInd);
clasificacion_red=red_entrenada(floresNuevas);
[val,idx]=max(clasificacion_red);

%num_test_samples=size(idx);
%Entrenar
prediccion=zeros(3,size(idx,2));

for i=1:size(idx,2)
    prediccion(idx(i),i)=1;
end
%
clasificacion_test=clasificacion(:,info_entrenamiento.testInd); 

index_error=clasificacion_test~=prediccion;
index_error=sum(index_error);
mal_clasificadas_idx=find(index_error~=0);
mal_clasificadas_caracteristicas=caracteristicas(:,mal_clasificadas_idx);
mal_clasificadas_clasificacion_red=clasificacion_test(:,mal_clasificadas_idx);
mal_clasificadas_clasificacion_real=clasificacion(:,mal_clasificadas_idx);


end