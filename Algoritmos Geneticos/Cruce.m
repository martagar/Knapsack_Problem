% Cruce: Devuelve un hijo a partir de la union de dos padres (operador OR)
% y seleccionando los objetos que dan mejor beneficio por peso.

function PobRes = Cruce(parejas,Pob,peso,beneficio,capacidad)
    N = size(Pob,2);
    PobRes = [];

    while ~isempty(parejas)
        union = or(Pob(parejas(1,1),:),Pob(parejas(1,2),:));
        bp = beneficio./peso;

        union = find(union == 1);
        bp = bp(union);

        matriz_ordenar = [bp' union'];
        matriz_ordenar = sort(matriz_ordenar,1,'descend');
        ind = matriz_ordenar(:,2)'; 

        i = 1;
        sum = 0;
        res = zeros(1,N);
        while i <= length(ind)
            if peso(ind(i)) + sum <= capacidad
                sum = sum + peso(ind(i));
                res(ind(i)) = 1;
            end
            i = i+1;
        end
        
        PobRes = [PobRes; res];
        parejas(1,:) = [];
    end
end




