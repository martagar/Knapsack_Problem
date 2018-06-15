% Muta: Devuelve Población (Pob) mutada. Mutan según probMut para llegar a 
% individuos con mayor función de evaluación.

function Pob = Muta(Pob,probMut,peso,beneficio,capacidad)
    i = 1;
    while i <= size(Pob,1)
        prob_rand = rand();
        if prob_rand < probMut
            pos = find(Pob(i,:) == 1);
            n = pos(randi(length(pos)));
            
            % cand_restantes: candidatos a mutar (transformarse a 1)
            cand_restantes = find(Pob(i,:) == 0);
            
            bp = beneficio./peso;
            
            if ~isempty(cand_restantes)
                bp = bp(cand_restantes);
                bp = [bp' cand_restantes'];
                cand_ordenados = sort(bp,1,'descend');
                cand_ordenados(:,1) = [];
                cand_ordenados = cand_ordenados';
                
                Pob(i,n) = 0;
                
                while sum(peso(Pob(i,:) == 1)) < capacidad && ~isempty(cand_ordenados)
                    if sum(peso(Pob(i,:) == 1)) + peso(cand_ordenados(1)) <= capacidad
                        Pob(i,cand_ordenados(1)) = 1;
                    end
                    cand_ordenados(1) = [];
                end
            end
        end
        i=i+1;
    end
end