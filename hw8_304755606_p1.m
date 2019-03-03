%Problem 1 Spatial Hashing
%David Curry
%ID: 304755606
clear all;
clc;
rng('default');
%define initial conditions and create random matrixs for particles
N = 50;
x = rand(1,N);
y = rand(1,N);
xmax = 1;
ymax = 1;
h = 0.25;
%define number of bins and bin spacing and initialize a binNum matirx
Nx = floor(xmax/h);
Ny = floor(ymax/h);
dx = xmax/Nx;
dy = xmax/Ny;
binNum = zeros(1,N);
%assgign a bin number to all particles
for k = 1:N
    binNum(k) = (ceil(x(k)/dx) - 1)*Ny + ceil((ymax -y(k))/dy);
end
%create initial matrix of binAvgx
binAvgx = zeros(1,Nx*Ny);
%compute the average for each bin by looping thru all bins
for k = 1:Nx*Ny
    sum = 0;
    counter = 0;
    % loop thru all particles to check if they are in the k bin
    for m = 1:N
        if binNum(m) == k
            %increase sum and counter for every particle in bin
            sum = sum + x(m);
            counter = counter + 1;
        end
    end
    %compute average for each bin and then restart loop for next bin
    binAvgx(k) = sum/counter;
end
%repeat for the y values
binAvgy = zeros(1,Nx*Ny);

for k = 1:Nx*Ny
    sumy = 0;
    countery = 0;
    for m = 1:N
        if binNum(m) == k
            sumy = sumy + y(m);
            countery = countery + 1;
        end
    end
    binAvgy(k) = sumy/countery;
end
%add a grid to graph
grid on;
xticks(0:dx:xmax);
yticks(0:dy:ymax);
%keep same graph
hold on;
%plot the initial particle positions
plot(x,y,'.','MarkerSize',8);
%keep same graph
hold on;
%plot average positions
plot(binAvgx,binAvgy, 'x','MarkerSize', 6);
%loop thru all bins to print out the particles in each bin
for k = 1:Nx*Ny
    number = 0;
    %print the bin number
    fprintf('Bin %2.0f: ',k);
    %loop thru all particels
    for m = 1:N
        if binNum(m) == k  %if particle is in the k bin
            fprintf('%.0f ',m);  %print that particle number on same line
            number = number + 1;
        end
    end
    if number == 0;  %if the are no particles in bin, print []
        fprintf('[]');
    end
    fprintf(' \n');  %add a new line for the next bin
end

