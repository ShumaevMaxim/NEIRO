clear;

t = -2:.05:5;
tt = 0:.05:10;
l = length (t);
f = @(t)2*t + cos(0.5*t) + .25 * (rand (1, length (t)) - .5) ;
z = f (t);
x = [z(1:l - 5); z(2:l - 4); z(3:l - 3); z(4:l - 2); z(5:l - 1)];

net = feedforwardnet ([2 1]);
net.trainParam.epochs = 100;
net.layers{1}.transferFcn = 'tansig';
net.layers{2}.transferFcn = 'purelin';

m = uint8 (.75 * l);
net = train (net, x (:, 1:m), z (1:m));

y = sim (net, x (:, 1:m));
uu = sim (net, repmat(f (tt (l - m + 1:end)), 5, 1));

figure;
hold on;

plot (tt, f (tt), 'b', 'linewidth', 3);
plot (tt (l - m + 1:end), uu, 'r', 'linewidth', 3);
