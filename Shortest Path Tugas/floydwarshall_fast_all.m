% clc;
% close all;
clear all;

load('dataset');
map=zeros(30,30);
for i=1:length(s)
    map(s(i),t(i))=w(i);
     map(t(i),s(i))=w(i);
end
map;
for i=1:30
    for j=1:30
        if map(i,j)==0 & i~=j
            map(i,j)=inf;
        end
    end
end
map;
position=[crdt(:,2)';crdt(:,3)'];

AdjMax=map;
N=min(length(AdjMax(:,1)),length(AdjMax(1,:)));
P=-1*ones(N,N);
S=AdjMax;

tstart=tic;
for k=1:N
    for i=1:N
        for j=1:N
            if S(i,k)==inf
                continue;
            end
            if S(k,j)==inf
                continue;
            end
            if S(i,j)>S(i,k)+S(k,j)
                if P(i,k)==-1
                    P(i,j)=k;
                else
                    P(i,j)=P(i,k);
                end
                S(i,j)=S(i,k)+S(k,j);
            end
        end
    end
end

s=1;
t=30;
if P(s,t)==-1
    P = [];
    %     disp('Tidak terhubung')
    rute=[];
    waktu=inf;
    jarak=[];
else
    index = 1;
    p= s;
    so=1;
    s=so;
    while s ~= t
        index = index + 1;
        s = P(s, t);
        if s==-1
            s=t;
            p=[p s];
            break
        else
            p=[p s];
        end
    end
    rute=p;
    waktu=toc(tic);
    jarak=S(1,30);
    %     disp('Terhubung');
end

disp(' ')
disp('------------------------')
disp('Algoritma Floyd Warshall')
disp('------------------------')

jarak
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
title('Floyd-Warshall')