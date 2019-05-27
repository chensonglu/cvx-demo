% train set size
m = size(labels_train, 1);

% positive samples
y = (labels_train == 3);

cvx_begin
    variables w1
    variables w2
    variables b
    minimize(-1/m * sum(y .* log(sigmoid(w1*score_train(:, 1) + w2*score_train(:, 2) + b)) + ...
        + (1 - y) .* (-w1*score_train(:, 1) - w2*score_train(:, 2) - b) - ...
        (1 - y) .* log(1 + exp(-w1*score_train(:, 1) - w2*score_train(:, 2) - b))))
cvx_end

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
hold on
x1 = linspace(0.8, 1.5, 100);
x2 = (w1*x1 + b)/(-w2);
plot(x1, x2)
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
hold on
x1 = linspace(0.8, 1.5, 100);
x2 = (w1*x1 + b)/(-w2);
plot(x1, x2)
legend('Iris Setosa', 'Iris Versicolor', 'Iris Virginica', 'location', 'northeastoutside')
xlabel('test set')

clear m
clear y
clear Iris_Setosa
clear Iris_Versicolor
clear Iris_Virginica