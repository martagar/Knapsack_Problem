% Torneo: Seleccionamos N individuos para que sean padres. Para ello
% cada vez que buscamos un individuo probamos con k-aleatorios y
% tomamos el mejor.

function [indices] = Seleccion_Torneo(FitPob,k)  
    N = round(length(FitPob)*0.6);
    indices = zeros(1,N);
    temp = zeros(1,k);
    
    i = 1;
    while i <= N
        j = 1;
        while j <= k
            temp(j) = randi(length(FitPob));
            j = j+1;
        end

        [~,in] = max(FitPob(temp));
        indices(i) = temp(in);
        i = i+1;
    end
end