function [clasificacion_test,clasificacion_test_red] = obtener_datos_test

caracteristicas=evalin('base','caracteristicas');
clasificacion=evalin('base','clasificacion');
red_entrenada=evalin('base','red_entrenada');
info_entrenamiento=evalin('base','info_entrenamiento');

caracteristicas_test=caracteristicas(:,info_entrenamiento.testInd);
clasificacion_test=clasificacion(:,info_entrenamiento.testInd);
clasificacion_test_red=red_entrenada(caracteristicas_test);

end