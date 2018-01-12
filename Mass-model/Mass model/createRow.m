function createRow(type,value,N,xstart,ystart)

%function creates a row within the specified excel file
%type specifies to place it within the wall or mass excel files
matrix = zeros(N,4);

for i=1:N
    matrix(i,1) = xstart+ i-1;%x
    matrix(i,2) = ystart+ i-1;%y
    matrix(i,3) = value;
end

matrixLength = length(matrix);


switch type
    case 0
        %mass
        tempMatrix = xlsread(pwd+'/masses.xlsx');
        offset = length(tempMatrix);
        
        xlswrite(strcat(pwd,'/masses.xlsx'),matrix,strcat(getChar(offset),'1:',getChar(matrixLength),'3'))
    case 1
        %wall
        tempMatrix = xlsread(pwd+'/walls.xlsx');
        offset = length(tempMatrix);
        
        xlswrite(strcat(pwd,'/walls.xlsx'),matrix,strcat(getChar(offset),'1:',getChar(matrixLength),'3'))
end



end