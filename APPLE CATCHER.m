intnum=0;
clear a;
a=arduino('COM3','uno');
%{
for i = 0:.1:10
    in=readVoltage(a,'A0');
    pot_val =(in/5)*1024;
    disp(int64(pot_val));
    %disp(in);
    pause(.5);
end 
%}
LB1 = [-3 -3];LB2 = [3 -3];
RB1 = [3 3];RB2 = [-3 3];
UP1= [-3 3]; UP2=[3 3];
DN1= [3 -3];DN2=[-3 -3];

plot(LB1,LB2,'black','linewidth',2);
hold on;
plot(RB1,RB2,'black','linewidth',2);
hold on;
plot(UP1,UP2,'black','linewidth',2);
hold on;
plot(DN1,DN2,'black','linewidth',2);
hold on;
plot(.5,.5,'.','color','red');
    plot(1,1,'.','color','red');
    plot(1.5,1.5,'.','color','red');
    plot(2,2,'.','color','red');
    plot(2.5,2.5,'.','color','red');
    plot(-.5,-.5,'.','color','red');
    plot(-1,-1,'.','color','red');
    plot(-1.5,-1.5,'.','color','red');
    plot(-2,-2,'.','color','red');
    plot(-2.5,-2.5,'.','color','red');%hold off;
xlim([-3,3]);
ylim=([-3,3]);
x=[-2,1.5,-1,-2.5,0.5,2];
x;
j=0;

for i =1:length(x)
    p1=[x(i) j];
    for j=2.5:-.1:-2.5
     plot(x(i),j,'.','color','red','MarkerSize',10);
     %pause(.1);
     %plot(x(i),j,'.','color','white','MarkerSize',20);
     basket=getX(a);
     disp(basket); 
     
     plot(basket,-2.5,'.','color','Black','MarkerSize',30);
     pause(.1);
     plot(basket,-2.5,'.','color','White','MarkerSize',30);
    end
end

function Xval =getX(a)
Xval=readVoltage(a,'A0');
Xval=interp1([0.00, 5.00],[-2.5, 2.5], Xval);
end
