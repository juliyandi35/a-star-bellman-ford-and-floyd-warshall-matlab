function [jarak,rute,waktu]=floydwarshall_fast(map,dari,ke)

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

s=dari;
t=ke;
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
    jarak=S(dari,ke);
    %     disp('Terhubung');
end

