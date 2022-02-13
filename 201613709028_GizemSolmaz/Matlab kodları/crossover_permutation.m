function xoverKids  = crossover_permutation(parents,options,NVARS, ...
    FitnessFcn,thisScore,thisPopulation)

% Parents: secilen ebeveynler
% options: OPTIMOPTIONS tarafindan olusturulan options
% NVARS: verilerinin sayisi
% FitnessFcn: uygunluk fonksiyonu
% thisScore: Mevcut nufusun puanlarinin vektoru
% thisPopulation: Mevcut populasyondaki bireylerin matrisi

nKids = length(parents)/2;
xoverKids = cell(nKids,1); 
index = 1;

for i=1:nKids
    parent = thisPopulation{parents(index)};
    index = index + 2;

   
    p1 = ceil((length(parent) -1) * rand);
    p2 = p1 + ceil((length(parent) - p1- 1) * rand);
    child = parent;
    child(p1:p2) = fliplr(child(p1:p2));
    xoverKids{i} = child; 
end