function [accuracy] = evalua_red(t,y)
%performance = perform(red_entrenada,clasificacion_test,clasificacion_test_red);
tind = vec2ind(t); 
yind = vec2ind(y);
percentErrors = sum(tind ~= yind)/numel(tind);
accuracy = 100-(percentErrors*100)
end