% GeneraPoblacion: Devuelve la Población inicial en una matriz de 0 y 1

function Pob = GeneraPoblacion(peso,capacidad,NPoblacion)
    i = 1;
    Pob = zeros(NPoblacion,length(peso));
    
    while i <= NPoblacion
        sum = 0;
        while ~isempty(find(Pob(i,:) == 0 & peso+sum <= capacidad, 1))
            cand = find(Pob(i,:) == 0 & peso+sum <= capacidad);
            iter = cand(randi(length(cand)));
            sum = sum + peso(iter);
            Pob(i,iter) = 1;
        end
        i = i + 1;
    end
    
end