% raw data in bezdekIris.data

% read raw data, separate by ','
[sepal_length, sepal_width, petal_length, petal_width, class] = textread('bezdekIris.data', '%f%f%f%f%s', 'delimiter', ',');

% put features into matrix
attributes = [sepal_length sepal_width petal_length petal_width];

% replace class characters with numbers
labels = zeros(150, 1);
labels(strcmp(class, 'Iris-setosa')) = 1;
labels(strcmp(class, 'Iris-versicolor')) = 2;
labels(strcmp(class, 'Iris-virginica')) = 3;

clear sepal_length
clear sepal_width
clear petal_length
clear petal_width
clear class