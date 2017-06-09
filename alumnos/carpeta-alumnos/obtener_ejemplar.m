function [flor,clasificacion_flor] = obtener_ejemplar
caracteristicas=evalin('base','caracteristicas');
clasificacion=evalin('base','clasificacion');
info_entrenamiento=evalin('base','info_entrenamiento');
floresNuevas_caracteristicas=caracteristicas(:,info_entrenamiento.testInd);
floresNuevas_especie=clasificacion(:,info_entrenamiento.testInd);

tmp=size(floresNuevas_caracteristicas);
idx=randi(tmp(2));
flor=floresNuevas_caracteristicas(:,idx);
clasificacion_flor=floresNuevas_especie(:,idx);
end