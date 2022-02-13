locations = zeros(20, 2);
locations = [39.6594540000000,27.8787290000000;
    39.6509470000000,27.9023890000000;
    39.6389980000000,27.9119390000000;
    39.6237380000000,27.8953470000000;
    39.6271390000000,27.8855590000000;
    39.6389060000000,27.8903330000000;
    39.6338500000000,27.8756510000000;
    39.6478220000000,27.8613270000000;
    39.6590340000000,27.8547620000000;
    39.6612400000000,27.8813810000000;
    39.6680390000000,27.8887820000000;
    39.6687740000000,27.9198170000000;
    39.6558180000000,27.9201750000000;
    39.6572880000000,27.9040610000000;
    39.6480980000000,27.8891400000000;
    39.6656500000000,27.9040610000000;
    39.6724500000000,27.8848430000000;
    39.6572880000000,27.8699220000000;
    39.6450650000000,27.8799480000000;
    39.6317190000000,27.8995270000000];

cities = 20;

%bu noktalar? ekran gösterme
plot(locations(:,1),locations(:,2),'bo');

%mesafeler için matris olu?turuldu ve 2 nokta aras? mesafeler hesaplan?p
%matrise eklendi
distances = zeros(cities);
for count1=1:cities,
    for count2=1:count1,
        x1 = locations(count1,1);
        y1 = locations(count1,2);
        x2 = locations(count2,1);
        y2 = locations(count2,2);
        distances(count1,count2)=sqrt((x1-x2)^2+(y1-y2)^2);
        distances(count2,count1)=distances(count1,count2);
    end;
end;

%distances defined earlier
FitnessFcn = @(x) traveling_salesman_fitness(x,distances);

%locations defined earlier
my_plot = @(options,state,flag) traveling_salesman_plot(options, ...
    state,flag,locations);

options = optimoptions(@ga, 'PopulationType', 'custom','InitialPopulationRange', ...
                            [1;cities]);

%ba?lang?ç popülasyonu 60 belirtildi
options = optimoptions(options,'CreationFcn',@create_permutations, ...
                        'CrossoverFcn',@crossover_permutation, ...
                        'MutationFcn',@mutate_permutation, ...
                        'PlotFcn', my_plot, ...
                        'MaxGenerations',500,'PopulationSize',60, ...
                        'MaxStallGenerations',200,'UseVectorized',true);
                    
 numberOfVariables = cities;
[x,fval,reason,output] = ...
    ga(FitnessFcn,numberOfVariables,[],[],[],[],[],[],[],options)