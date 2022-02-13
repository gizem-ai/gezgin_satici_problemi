function state = traveling_salesman_plot(~, state,flag,locations)

[~,i] = min(state.Score);
genotype = state.Population{i};

plot(locations(:,1),locations(:,2),'go');
plot(locations(genotype,1),locations(genotype,2));
hold off