function [t_tabu,cont_t] = pruebas(peso,beneficio,capacidad)
    max = 1000;
    i = 1;     
    cont_t = 0; 
    t_tabu = 0; 
    
    while i <= max
        tic
        eval = fevalu(Tabu_Search(peso,beneficio,capacidad),beneficio);
        t_tabu = t_tabu + toc;
        cont_t = cont_t + (eval==42);
        i = i+1;
    end
end