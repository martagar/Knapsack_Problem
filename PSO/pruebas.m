function [t_pso,cont_t] = pruebas(peso,beneficio,capacidad)
    max = 1000; 
    i = 1;     
    cont_t = 0;
    t_pso = 0;
    
    while i <= max
        tic
        eval = fevalTablero(PSO(peso,beneficio,capacidad),beneficio);
        t_pso = t_pso + toc;
        cont_t = cont_t + (eval==42);
        i = i+1;
    end
end