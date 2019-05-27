Iris_Setosa = (labels_train == 1);
Iris_Versicolor = (labels_train == 2);
Iris_Virginica = (labels_train == 3);

scatter(attributes_train(Iris_Setosa, 1), attributes_train(Iris_Setosa, 2), 'red');
hold on
scatter(attributes_train(Iris_Versicolor, 1),attributes_train(Iris_Versicolor, 2), 'g', '+');
hold on
scatter(attributes_train(Iris_Virginica, 1),attributes_train(Iris_Virginica, 2), 'b', '*');
legend('Iris Setosa', 'Iris Versicolor', 'Iris Virginica', 'location', 'northeastoutside')
xlabel('sepal length')
ylabel('sepal width')

clear Iris_Setosa
clear Iris_Versicolor
clear Iris_Virginica