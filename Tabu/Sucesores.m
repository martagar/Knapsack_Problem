function Lista = Sucesores(Actual,peso,beneficio,capacidad)
    Lista = []; 
    
    pos = Actual(randi(length(Actual)));
    
    candidatos = find(ismember(peso,peso(Actual)) == 0);
    Actual(Actual==pos) = [];
    candidatos = candidatos(peso(candidatos)+sum(peso(Actual)) <= capacidad);
    
    permutaciones = perms(candidatos);
    while ~isempty(permutaciones)
        var = Actual;
        i = 1;

        while i <= size(permutaciones,2) && sum(peso(var)) < capacidad
            peso_acum = peso(permutaciones(1,i))+sum(peso(var));
            if peso_acum <= capacidad
                var = [var permutaciones(1,i)];
            end
            i = i+1;
        end
        
        candidato = zeros(1,length(peso)+1);
        candidato(var) = 1;
        candidato(size(candidato,2)) = fevalu(var,beneficio);
        
        if buscaMatVec(Lista,candidato) == 0;
            Lista = [Lista; candidato];
        end
        permutaciones(1,:) = [];
    end
 
    if ~isempty(Lista)
        [~,I] = sort(Lista(:,size(Lista,2)),'descend');
        Lista = Lista(I,:);
        Lista(:,size(Lista,2)) = [];
    end
end