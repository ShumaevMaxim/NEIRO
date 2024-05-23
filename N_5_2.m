t = 0:10;
L=length(t);
z=2*t +cos(0.5*t)+.25 + + 0.3 * randn(1,L);
x=[0 z(1:L-1);0 0 z(1:L-2)]; 
net = feedforwardnet([2 1]);
net.trainParam.epochs = 100;
net = train(net,x,z);
y = sim(net,x);
y(11)=sim(net,[z(10) z(9)]');
y(12)=sim(net,[y(11) z(10)]');
for i=1:5
y(12+i)=sim(net,[y(11+i), y(10+i)]' );
end
plot(z, 'b'), hold on, grid on
plot(y, 'r'), hold off 