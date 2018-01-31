function time = findLowestTime
%used to find the CFL lowest time
global springsVal mass
max_displacement = 1e-5;
min_time=1e50;

massVal =mass(:,3); 
[m,n]=size(springsVal);

for row=1:1:m%traverse masses
    for col=1:1:n%traverse connections
        if(springsVal(row,col)~=0)
            time = sqrt(max_displacement*massVal(row)/springsVal(row,col))/2;
        end
        if(time <=min_time)
            min_time=time;
        end
    end
end
time = min_time;



end