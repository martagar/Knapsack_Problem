max_iter = 1000; 
t_algGen = 0; 

peso = randi([1 20], 10, 10);
beneficio = randi([1 20], 10, 10);
capacidad = randi([1 100], 1, 10);
NPob = [50 200];
Reemplazo = [1 2];

comb = repmat((1:10),1,4)';
comb2 = ones(20,1); comb3 = ones(20,1)*2;
comb4 = ones(10,1); comb5 = ones(10,1)*2;
comb = [comb [comb2;comb3] [comb4; comb5; comb4;comb5]];

benef = zeros(size(comb,1),max_iter);
for j = 1:size(comb,1)
    i = 1;
    p = peso(comb(j,1),:);
    b = beneficio(comb(j,1),:);
    c = capacidad(comb(j,1));

    while i <= max_iter
        tic;
        [p,b] = shuffle(p,b);
        eval = EvaluaPoblacion(alg_Gen(p,b,c,NPob(comb(j,2)),Reemplazo(comb(j,3))),b);
        benef(j,i) = max(eval);
        t_algGen = t_algGen + toc;
        i = i+1;
    end 
end
boxplot(benef);