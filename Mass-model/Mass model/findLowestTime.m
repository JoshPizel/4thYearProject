function time = findLowestTime
%used to find the CFL lowest time
max_displacement = 1e-5;
min_time=1e50;

masses=xlsread(strcat(pwd,'/Masses.xlsx'));
springs=xlsread(strcat(pwd,'/Springs.xlsx'));

[m,n]=size(springs);

for row=1:1:m%traverse masses
    for col=1:1:n%traverse connections
        if(not(springs(row,col)==0))
            time = sqrt(max_displacement*masses(row,3)/springs(row,col))/2;
        end
        if(time <=min_time)
            min_time=time;
        end
    end
end
time = min_time;



end