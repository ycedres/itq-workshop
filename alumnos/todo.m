carga_datos_visualizacion;
figure(1);
gplotmatrix(caracteristicas, [], clasificacion, ['r', 'b', 'g'],[],[],'off','variable',{'Longitud.Sepalo','Ancho.Sepalo','Longitud.Petalo','Ancho.Petalo'});
[media,std] = grpstats(caracteristicas,clasificacion,{'mean','std'});

red = define_red;
view(red);

carga_datos_entrenamiento;
[red_entrenada,info_entrenamiento] = entrena_red(red,caracteristicas,clasificacion);
y=red_entrenada(caracteristicas)
performance = perform(red_entrenada,clasificacion,y)