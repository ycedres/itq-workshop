function [tipo] = tipo_flor(clasificacion_flor)
tipo_flor=["setosa","versicolor","virginica"];
tipo_flor(vec2ind(clasificacion_flor))
end