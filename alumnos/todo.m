clc
clear
carga_datos_visualizacion;
%figure(1);
%gplotmatrix(caracteristicas, [], clasificacion, ['r', 'b', 'g'],[],[],'off','variable',{'Longitud.Sepalo','Ancho.Sepalo','Longitud.Petalo','Ancho.Petalo'});
[media,std] = grpstats(caracteristicas,clasificacion,{'mean','std'});

red = define_red;
%view(red);

carga_datos_entrenamiento;
[red_entrenada,info_entrenamiento] = entrena_red(red,caracteristicas,clasificacion);



clasificacion_red=red_entrenada(caracteristicas);
performance = perform(red_entrenada,clasificacion,clasificacion_red);
precision=evalua_red(clasificacion,clasificacion_red)


[val,idx]=max(clasificacion_red)
[mal_clasificadas_caracteristicas,mal_clasificadas_clasificacion_red,mal_clasificadas_clasificacion_real]=obtener_mal_clasificadas