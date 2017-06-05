function [flor] = obtener_ejemplar()
caracteristicas=evalin('base','caracteristicas');
info_entrenamiento=evalin('base','info_entrenamiento');
floresNuevas=caracteristicas(:,info_entrenamiento.testInd);
flor=floresNuevas(:,randi(23));
end