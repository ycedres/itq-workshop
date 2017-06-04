floresNuevas=caracteristicas(:,info_entrenamiento.testInd);
[val,especie_red]=max(red_entrenada(floresNuevas));

[val,especie_verdad]=max(clasificacion);
especie_verdad=especie_verdad(info_entrenamiento.testInd);