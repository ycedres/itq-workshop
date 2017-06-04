floresNuevas=irisInputs(:,tf.testInd);
[val,idx]=max(net(floresNuevas));

%num_test_samples=size(idx);
prediccion=zeros(3,23);

for i=1:23
    prediccion(idx(i),i)=1;
end
irisTargets_prediccion=irisTargets;
irisTargets_prediccion(:,tf.testInd)=prediccion;