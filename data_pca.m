% pre-process
% mu: mean of each feature, sigma: std of each feature
[Z, mu, sigma] = zscore(attributes_train);

% PCA
[coeff, score, latent] = pca(Z);

% select top features according to threshold
latent = 100 * latent / sum(latent);
A = length(latent);
percent_threshold = 95;
percents = 0;
for n=1:A
    percents = percents + latent(n);
    if percents > percent_threshold
        break;
    end
end
coeff = coeff(:, 1:n);
score_train = score(:, 1:n);

% same for test set
num_test = size(labels_test, 1);

% (X - mu)/sigma
score_test = (attributes_test - repmat(mu, num_test, 1)) ./ repmat(sigma, num_test, 1);

% PCA features
score_test = score_test * coeff;

clear A
clear coeff
clear latent
clear mu
clear n
clear num_test
clear percent_threshold
clear percents
clear score
clear sigma
clear Z

% visualization
Iris_Setosa = (labels_train == 1);
Iris_Versicolor = (labels_train == 2);
Iris_Virginica = (labels_train == 3);

subplot(1, 2, 1)
scatter(score_train(Iris_Setosa, 1), score_train(Iris_Setosa, 2), 'red');
hold on
scatter(score_train(Iris_Versicolor, 1),score_train(Iris_Versicolor, 2), 'g', '+');
hold on
scatter(score_train(Iris_Virginica, 1),score_train(Iris_Virginica, 2), 'b', '*');
legend('Iris Setosa', 'Iris Versicolor', 'Iris Virginica', 'location', 'northeastoutside')
xlabel('train set')

Iris_Setosa = (labels_test == 1);
Iris_Versicolor = (labels_test == 2);
Iris_Virginica = (labels_test == 3);

subplot(1, 2, 2)
scatter(score_test(Iris_Setosa, 1), score_test(Iris_Setosa, 2), 'red');
hold on
scatter(score_test(Iris_Versicolor, 1),score_test(Iris_Versicolor, 2), 'g', '+');
hold on
scatter(score_test(Iris_Virginica, 1),score_test(Iris_Virginica, 2), 'b', '*');
legend('Iris Setosa', 'Iris Versicolor', 'Iris Virginica', 'location', 'northeastoutside')
xlabel('test set')

clear Iris_Setosa
clear Iris_Versicolor
clear Iris_Virginica