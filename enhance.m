clear all;
clc
tic
p=imread('Path to Image');% To read image
%p=rgb2gray(p);% To convert RGB image to gray image(normalised image)
figure,imshow(p)
title('original_img');

x=0:255;
% breaking points from gui
x1 =input('Enter any value for 1st break point(X1):');
y1 =input('Enter any value for 2nd break point(Y1):');
x2 =%input('Enter any value for 2nd break point(X2):');
y2 =%input('Enter any value for 2nd break point(Y2):');
 
% range definitions
x_r1 = 0:x1;
x_r2 = x1+1:x2;
x_r3 = x2+1:255;
 
% line gradients
a1 = y1/x1;
a2 = (y2-y1)/(x2-x1);
a3 = (255-y2)/(255-x2);
 
% line functions
yo_1 = a1*x_r1;
yo_2 = y1 + (a2*(x_r2-x1));
yo_3 = y2 + (a3*(x_r3-x2));
 
% line concatance
y = [yo_1 yo_2 yo_3];
 
% plot line

figure, plot(x,y),grid on;
xlim([0 255]);
ylim([0 255]);

% Implementing contrast stretching using piece wise linear transform.
[rowi coli]=size(p);
out=zeros(rowi,coli);

for k=1:256
    for i=1:rowi
        for j=1:coli
if p(i,j)==x(k) 
    out(i,j)=y(k);
end
        end
    end
end
figure,imshow(uint8(out))
title('New')
toc
