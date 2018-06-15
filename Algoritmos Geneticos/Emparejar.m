% Emparejar: Devuelve las parejas de Padres en forma de índices.

function parejas = Emparejar(Padres,Pcross)
    N = size(Padres,2);  
    cp = find(rand(N,1) < Pcross); % Busca padres en puntos aleatorios
    Padres = Padres(cp);
    
    if rem(size(Padres,2),2)
        Padres = Padres(1:(size(cp,1)-1)); 
    end
    
    parejas = reshape(Padres,size(Padres,2)/2,2);   
end