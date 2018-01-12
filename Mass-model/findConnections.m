function springsCon = findConnections
%function timeMap creates matrix giving the positions of a set of masses
%and springs at a set time.

%inputs TBD

%outputs: xpos
%         ypos


%get information from external file

%function expects a matrix of the format:
% initial xpos, initial y position, mass value 
total = xlsread(strcat(pwd,'/masses.xlsx'));

%for just xy positions
initial_position = total(:,1:2);

%create spring matrix
connector =delaunayTriangulation(initial_position);

springsCon = zeros(length(initial_position),4);
%sloppy method(slow), remember to attempt optimization
for i=1:1:length(initial_position)%which row to look for
    k=0;%for columns of springDirty
    for row=1:1:length(initial_position)%traversing down
        if(i==connector(row,1))%for first row only
            k=k+1;
            springsCon(i,k)= connector(row,2);
            k=k+1;
            springsCon(i,k)= connector(row,3);
        end
        if(i==connector(row,2))
            k=k+1;
            springsCon(i,k)= connector(row,1);
            k=k+1;
            springsCon(i,k)= connector(row,3);
        end
        if(i==connector(row,3))
            k=k+1;
            springsCon(i,k)= connector(row,1);
            k=k+1;
            springsCon(i,k)= connector(row,2);
        end
    end
end
%next portion of code is to clean up the springs table. This gets rid of
%duplicates and also gets rid of diagonal entries(square connection scheme)

[m,n] = size(springsCon);
%duplicate deletion
for row=1:1:length(initial_position)%traverse down
    for col=1:1:n %traverse across
        for testVal=col+1:1:n %across traverse testing
            if(springsCon(row,col)==springsCon(row,testVal))
                %duplicate found, delete
                springsCon(row,testVal) = 0;
            end
        end
    end
end


%only for square matrices
%essentially check for both x and y displacement
for row=1:1:length(initial_position)%traverse down
    for col=1:1:n %traverse across
        if(not(springsCon(row,col)==0))%to prevent looking at the 0th position
            row1= springsCon(row,col);
            left  = not(initial_position(row1,1)==initial_position(row,1));%check x
            right = not(initial_position(row1,2)==initial_position(row,2));%check y
            if(left&&right)
                springsCon(row,col)=0;
            end
        end
    end
end

%store in springs matrix
delete(strcat(pwd,'/Springs.xlsx'));
xlswrite(strcat(pwd,'/Springs.xlsx'),springsCon);


end