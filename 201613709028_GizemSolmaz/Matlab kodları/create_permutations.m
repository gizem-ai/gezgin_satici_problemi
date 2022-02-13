function pop = create_permutations(NVARS,FitnessFcn,options)
% NVARS: Degisken sayisi
% FitnessFcn: Uygunluk fonksiyonu
% options: Genetik Algoritma için kullanilan seçenekler yapisi

totalPopulationSize = sum(options.PopulationSize);
n = NVARS;
pop = cell(totalPopulationSize,1);
for i = 1:totalPopulationSize
    pop{i} = randperm(n); 
end