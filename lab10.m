clear all;
close all;

%parametry%
K=2;
T1=2;
T2=[0,T1/10,T1/2,T1];
Ti=[0,T1/100,T1/10,T1,10*T1];


%%%%%%%%%%%%%%%%%%%%
%Odpowiedzi skokowe%
%%%%%%%%%%%%%%%%%%%%

%1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s=tf('s');
M=(T1*s+1)*(T2*s+1);

k=size(M,2);
figure(1);
hold on, grid on;
for i=1:k
G11=K/M(i);
step(G11);
end
title ('Człon pierwszy');
legend ('a','b','c','d');



%2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=tf('s');
M=T1*s*(Ti*s+1);

k=size(M,2);
format=['r--';'g  ';'b  ';'k  ';'m  '];
figure(2);
hold on, grid on;
for i=1:k
G11=K/M(i);
[y,t]=step(G11);
plot(t,y(:,1,1),format(i,:))
end
title ('Człon drugi');
xlabel ('Time(seconds)');
ylabel ('Amplitude');
legend ('a','b','c','d','e');
axis([0 10 0 9]);



%3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% s=tf('s');
% M=(Ti*s+1);
% 
% k=size(M,2);
% format=['r ';'g ';'b ';'k ';'m ';'c '];
% figure(3);
% hold on, grid on;
% for i=1:1:k-2
% G11=(T1*s)/M(i);
% [y,t]=step(G11);
% plot(t,y(:,1,1),format(i))
% end
% title ('Człon trzeci 1');
% legend ('a','b','c');
% 
% 
% figure(4);
% hold on, grid on;
% for i=4:1:k
% G11=T1*s/M(i);
% [y,t]=step(G11);
% plot(t,y(:,1,1),format(i))
% end
% title ('Człon trzeci 2');
% legend ('d','e');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Charakterystyki częstotliwościowe %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=tf('s');
M=(T1*s+1)*(T2*s+1);

k=size(M,2);
figure(5);
hold on, grid on;
for i=1:k
G11=K/M(i);
bode(G11);
end
title ('Człon pierwszy');
legend ('a','b','c','d');




%2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=tf('s');
M=T1*s*(Ti*s+1);

k=size(M,2);
figure(6);
hold on, grid on;
for i=1:k
G11=K/M(i);
bode(G11);
end
title ('Człon drugi');
legend ('a','b','c','d','e');




%3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=tf('s');
M=(Ti*s+1);

k=size(M,2);
figure(7);
hold on, grid on;
for i=1:k
G11=T1*s/M(i);
bode(G11);
end
title ('Człon trzeci');
legend ('a','b','c','d','e');
