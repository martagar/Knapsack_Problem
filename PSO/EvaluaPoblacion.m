% EvaluaPoblacion: Devuelve un vector de la evaluaci�n de cada individuo
% de la Poblaci�n (Pob)

function [eval] = EvaluaPoblacion(Pob,beneficio)
    i = 1;
    eval = zeros(1,size(Pob,1));
    while i <= size(Pob,1)
        eval(i) = fevalTablero(Pob(i,:),beneficio);
        i = i+1;
    end
end