function inicial = genera_inicial(peso,beneficio,capacidad)
    bp = beneficio./peso;
    completa = [peso' beneficio' bp'];
    [~,candidatos] = sort(completa(:,size(completa,2)),'descend');
    inicial = [];
    
    while sum(peso(inicial)) < capacidad && ~isempty(candidatos)
        if sum(peso(inicial))+peso(candidatos(1)) <= capacidad
            inicial = [inicial candidatos(1)];
        end
        candidatos(1) = [];
    end
end