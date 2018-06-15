function gbest = PSO(peso,beneficio,capacidad)
    NPoblacion = 40; 
    Best_itera = 15;
    maxIter = 20;   
    cg = 0.9;        % Influencia a la mejor solución global
    cp = 0.4;        % Influencia a la mejor solución parcial
    w = 0.4;         % Constante de inercia

    S = GeneraPoblacion(peso,capacidad,NPoblacion);
    feval = EvaluaPoblacion(S,beneficio);
    
    pbest = S;

    [~,best] = max(feval);
    gbest = S(best,:);
    
    V = zeros(NPoblacion,length(peso));
    
    itera = 1;
    itera_b = 1;    
    while itera <= maxIter && itera_b <= Best_itera 
        rg = rand; % Num aleatorio para global
        rp = rand; % Num aleatorio para particular
        
        V = round(w*V + cg*rg*(repmat(gbest,NPoblacion,1)-S) + cp*rp*(pbest-S));
        S = aplicaVelocidad(S,V,peso,capacidad);
        
        itera = itera+1;
        pbest = MejorLocal(S,pbest,beneficio);
        gbest = MejorGlobal(S,beneficio);
        
        if fevalTablero(gbest,beneficio) > best
            best = fevalTablero(gbest,beneficio);
            itera_b = 1;
        else 
            itera_b = itera_b + 1;
        end
    end
end
