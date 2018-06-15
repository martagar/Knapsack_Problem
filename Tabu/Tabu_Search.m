function Best = Tabu_Search(peso,beneficio,capacidad)
    permanencia = 4; 
    maxItera = 80;   
    Best_itera = 25; 
    
    Actual = genera_inicial(peso,beneficio,capacidad);
    Best = Actual;
    
    TabuList = []; 
    MatrizTabu = [];
    
    itera = 1;
    itera_b = 1;
    while itera <= maxItera && itera_b <= Best_itera
        indTabu = find(TabuList~=0);
        TabuList(indTabu) = TabuList(indTabu)-1;
        
        SucesorList = Sucesores(Actual,peso,beneficio,capacidad);
        
        if ~isempty(SucesorList)
            ocupado = SucesorList(1,:);
            Nuevo = find(ocupado == 1);
            
            fila = buscaMatVec(MatrizTabu,ocupado);
            
            % si fila es 0 significa que no está por lo que lo introducimos y 
            % la posición es la última fila de la matriz tabu
            if fila == 0;
                pos = size(MatrizTabu,1)+1;
                MatrizTabu(pos,:) = ocupado;
                TabuList(pos) = 0;     
            else
            % Si no, la posición que buscamos es fila
                pos = fila;
            end
            
            while ~isempty(SucesorList) && ~isequal(Actual,Nuevo)
                SucesorList(1,:) = [];
                
                if	fevalu(Nuevo,beneficio) > fevalu(Best,beneficio)							
                        Actual = Nuevo;	
                        Best = Actual;
                        TabuList(pos) = permanencia;	
                        SucesorList = [];
                        itera_b = 1;
                else
                    if	TabuList(pos) == 0
                        Actual = Nuevo;
                        TabuList(pos) = permanencia;
                        SucesorList = [];
                        itera_b = itera_b + 1;
                    else
                        if ~isempty(SucesorList)
                            ocupado = SucesorList(1,:);
                            Nuevo = find(ocupado == 1);
                            fila = buscaMatVec(MatrizTabu,ocupado);
                            if fila == 0;
                                pos = size(MatrizTabu,1)+1;
                                MatrizTabu(pos,:) = ocupado;
                                TabuList(pos) = 0;  
                            else
                                pos = fila;
                            end
                        end
                        itera_b = itera_b + 1;
                    end
                end
            end	
        end
        itera = itera+1;
    end	
end