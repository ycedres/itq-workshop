function [mal_clasificadas]=obtener_mal_clasificadas(red_entrenada)

caracteristicas=evalin('base','caracteristicas');
clasificacion=evalin('base','clasificacion');
info_entrenamiento=evalin('base','info_entrenamiento');

floresNuevas=caracteristicas(:,info_entrenamiento.testInd);
[val,idx]=max(red_entrenada(floresNuevas));

%num_test_samples=size(idx);
prediccion=zeros(3,size(idx,2));

for i=1:size(idx,2)
    prediccion(idx(i),i)=1;
end

clasificacion_test=clasificacion(:,info_entrenamiento.testInd); 

index_error=clasificacion_test~=prediccion;
index_error=sum(index_error);
mal_clasificadas_idx=find(index_error~=0);
mal_clasificadas=caracteristicas(:,mal_clasificadas_idx);
% for i=1:size(mal_clasificadas,2)
%      caracteristicas(:,i)
% end
% 

end