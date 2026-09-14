% clc;
% close all;
clear all;

load('dataset');

[path,cost,heuristic,func,iterations] = astar(s,t,w,h,1,30);
% cell2mat(path(:))
disp(' ')
disp('----------------------')
disp('Algoritma A-Star')
disp('----------------------')

rute=cellfun(@str2num, path);
Jarak=cost
L=rute
position=[crdt(:,2)';crdt(:,3)'];
jumlahnode=30;
figure;
plot(position(1,:),position(2,:),'ro');
title('Network');
xlabel('x (m)');
ylabel('y (m)');
axis([101.24 101.275 0.225 0.234])

%texting
for i=1:jumlahnode
    text(position(1,i),position(2,i)+0.5,num2str(i));
end

for i=1:length(s)
    line([position(1,s(i)),position(1,t(i))],[position(2,s(i)),position(2,t(i))]);
end


for i=1:length(L)-1
    line([position(1,L(i)),position(1,L(i+1))],[position(2,L(i)),position(2,L(i+1))],'Color','red','LineWidth',2);
end
title('A-Star')