function Pob = alg_Gen(peso,beneficio,capacidad,NPoblacion,Modo_Reemplazo)   
    Best_itera = 35; 
    Pcross = 0.99;   
    Pmut = 0.1;		

    Pob = GeneraPoblacion(peso,capacidad,NPoblacion);
    FitPob = EvaluaPoblacion(Pob,beneficio);
    best = max(FitPob);

    itera_b = 1;
    while itera_b <= Best_itera
         Padres = Seleccion_Torneo(FitPob,3);
         parejas = Emparejar(Padres,Pcross);
         
         newPob = Cruce(parejas,Pob,peso,beneficio,capacidad);
         newPobMutada = Muta(newPob,Pmut,peso,beneficio,capacidad);
         FitMutada = EvaluaPoblacion(newPobMutada,beneficio);
         
         [Pob,FitPob] = Reemplazo(Pob,newPobMutada,FitPob,FitMutada,Modo_Reemplazo);
         
         if max(FitPob) > best
             best = max(FitPob);
             itera_b = 1;
         else 
             itera_b = itera_b+1;
         end
    end
end