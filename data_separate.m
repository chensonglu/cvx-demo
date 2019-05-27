% test set number
num_test = size(labels, 1)/3;

% random sort
rand('seed', 0);
R = randperm(size(labels, 1));

% test set
attributes_test = attributes(R(1:num_test), :);
labels_test = labels(R(1:num_test), :);

% train set
R(1:num_test) = [];
attributes_train = attributes(R, :);
labels_train = labels(R, :);

clear num_test
clear R