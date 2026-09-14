% clc;
% close all;
clear all;

N=30;         % number of nodes
e_num=39;         % number of edges in the network

load('dataset');

m=s;n=t;s=1;              % Initialization of source node

names={'v1','v2','v3','v4','v5','v6','v7','v8','v9','v10','v11','v12','v13','v14','v15','v16','v17','v18','v19','v20','v21','v22','v23','v24','v25','v26','v27','v28','v29','v30'};
G=digraph(m,n,w);
distance(1:N)=Inf;   % distance of each node initialized to infinity
distance(s)=0;             % distance of source node intitalized to 0
predecessor(1:N)=0;
for i = 1 : N - 1
    for j = 1 : e_num
        v = n(j);
        u = m(j);
        t = distance(u) + w(j);
        if (t < distance(v) )
            distance(v) = t;
            predecessor(v) = u;
        end
    end
end
d=30;
totalCost = distance(d);
TR=shortestpathtree(G,s,d);
rute=TR.Edges.EndNodes;
rute=[rute(1,1) rute(:,2)'];

disp(' ')
disp('------------------------')
disp('Algoritma Bellman Ford')
disp('------------------------')

jarak=sum(TR.Edges.Weight)

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

for i=1:length(m)
    line([position(1,m(i)),position(1,n(i))],[position(2,m(i)),position(2,n(i))]);
end


for i=1:length(L)-1
    line([position(1,L(i)),position(1,L(i+1))],[position(2,L(i)),position(2,L(i+1))],'Color','red','LineWidth',2);
end
title('Bellman-Ford')
