% Reemplazo: Devuelve una Población (newPob) y un vector de la evaluación 
% de la población (FitPob). La Población resultante es la mejor entre Pob y
% PobMutada.

function [newPob,FitPob] = Reemplazo(Pob,newPobMutada,FitPob,FitMutada,Modo_Reemplazo)
    if Modo_Reemplazo == 1
        pobtotal = [Pob FitPob'; newPobMutada FitMutada'];
        [~,I] = sort(pobtotal(:,size(pobtotal,2)),'descend');
        pobtotal = pobtotal(I,:);

        newPob = pobtotal(1:size(Pob,1),:);
        FitPob = newPob(:,size(newPob,2));
        FitPob = FitPob';

        newPob(:,size(newPob,2)) = [];
    else
        if size(newPobMutada,1) >= size(Pob,1)
            pobtotal = [newPobMutada FitMutada'];
            [~,I] = sort(pobtotal(:,size(pobtotal,2)),'descend');
            pobtotal = pobtotal(I,:);
            
            newPob = pobtotal(1:size(Pob,1),:);
            FitPob = newPob(:,size(newPob,2));
            FitPob = FitPob';
            
            newPob(:,size(newPob,2)) = [];
        else
            pobaux = [Pob FitPob];
            [~,I] = sort(pobaux(:,size(pobaux,2)),'descend');
            pobaux = pobaux(I,:);
            
            newPob = [newPobMutada; pobaux(1:(size(newPobMutada,1)-size(Pob,1)),1:end-1)];
            FitPob = [FitMutada pobaux(1:(size(newPobMutada,1)-size(Pob,1)),end)'];
        end
    end
end