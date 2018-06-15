% aplicaVelocidad: Devuelve S en la cual se le ha aplicado la velocidad (V)
% Sigue el siguiente criterio:
% Si en V nos encontramos:
%  * <  0 : Se pone el elemento en S a 0
%  * >= 0 : Se pone de forma aleatoria en S a 1 (modificando su V a -1)
function S = aplicaVelocidad(S,V,peso,capacidad)
    i = 1;
    while i <= size(V,1)
        j = 1;
        while j <= size(V,2)
           if V(i,j) < 0
               S(i,j) = 0;
           end
           j = j+1;
        end

        cand = find(V(i,:) >= 0);
        cand = cand(peso(cand) + sum(peso(S(i,:)==1)) <= capacidad);
        while ~isempty(cand)
            iter = cand(randi(length(cand)));
            if peso(iter) + sum(peso(S(i,:)==1)) <= capacidad
                S(i,iter) = 1;
            end
            cand(cand == iter) = [];
        end
        i = i+1;
    end
end