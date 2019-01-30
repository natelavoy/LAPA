% Nathan Lavoy
% 100995612
% January 30th, 2019

%% Simulation One
iter = 50;
size_x = 10;
size_y = 10;
v = zeros(size_x,size_y);
v(:,1) = 1;
v_new = v;
for i = 1:iter
    for row = 1:size_y
        for col = 2:size_x-1
            if (row == 1)
                v_new(row,col) = v(row+1,col);
            elseif (row == size_y)
                v_new(row,col) = v(row-1,col);
            else
                left = v(row,col-1);
                right = v(row,col+1);
                up = v(row-1,col);
                down = v(row+1,col); 
                v_new(row,col) = 0.25*sum([up down left right]);
            end
            
        end
    end
    v = v_new;
    figure(1);
    surf([1 2 3 4 5 6 7 8 9 10],[1 2 3 4 5 6 7 8 9 10],v);
    pause(0.1)
end
%% Simulation Two
iter = 50;
size_x = 10;
size_y = 10;
v = zeros(size_x,size_y);
v(:,1) = 1;
v(:,size_x) = 1;
v_new = v;
x = [1 2 3 4 5 6 7 8 9 10];
y = [1 2 3 4 5 6 7 8 9 10];
for i = 1:iter
    for row = 2:size_y-1
        for col = 2:size_x-1
            left = v(row,col-1);
            right = v(row,col+1);
            up = v(row-1,col);
            down = v(row+1,col); 
            v_new(row,col) = 0.25*sum([up down left right]);
        end
    end
    v = v_new;
    figure(2);
    surf(x,y,v_new);

    [xcomp, ycomp] = gradient(v_new);
    figure(3);
    quiver(x,y,-xcomp,-ycomp);
    pause(0.1);
end
%% Part 3
iter = 50;
size_x = 10;
size_y = 10;
v = zeros(size_x,size_y);
v(:,1) = 1;
v(:,size_x) = 1;
v_new = v;
x = [1 2 3 4 5 6 7 8 9 10];
y = [1 2 3 4 5 6 7 8 9 10];
for i = 1:iter
    v_new = imboxfilt(v);
    v_new(:,1) = 1;
    v_new(:,size_x) = 1;
    v_new(1,:) = 0;
    v_new(size_y,:) = 0;
    figure(2);
    surf(x,y,v_new);
    hold on;
    zlim([0 1]);
    hold off;
    pause(0.1);
    v = v_new;
end