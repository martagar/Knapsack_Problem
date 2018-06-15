% MejorLocal: Devuelve una población en PobRes de los mejores de S y los
% mejores de particular (pbest)

function PobRes = MejorLocal(S,pbest,b)
    NPoblacion = size(S,1); 
    feval_S = EvaluaPoblacion(S,b);
    feval_pbest = EvaluaPoblacion(pbest,b);
    PobRes = zeros(NPoblacion,length(b));
    
    i = 1;
    while i <= NPoblacion
        if max(feval_S(i),feval_pbest(i)) == feval_S(i)
            PobRes(i,:) = S(i,:);
        else
            PobRes(i,:) = pbest(i,:);
        end
        i = i+1;
    end
end