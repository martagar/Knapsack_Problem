% buscaMatVec: Busca si alguna fila de la matriz es igual al vector y
% devuelve la fila. Si no está, devuelve 0

function fila = buscaMatVec(Matriz, Vector)
    i = 1;
    fila = 0;
    while i <= size(Matriz)
        if (Matriz(i,:) == Vector)
            fila = i;
        end
        i = i+1;
    end
end