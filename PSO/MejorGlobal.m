% MejorGlobal: Devuelve el individuo de S con mayor beneficio
function res = MejorGlobal(S,beneficio)
    feval_S = EvaluaPoblacion(S,beneficio);
    [~,ind] = max(feval_S);
    res = S(ind,:);
end