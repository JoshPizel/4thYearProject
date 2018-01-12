function timeMap
minTime = findLowestTime();
mass =xlsread(strcat(pwd,'/Masses.xlsx'));
point = length(mass);

%run time;
time_count_max_sec=1000;

time_count_max = fix(time_count_max_sec/minTime)+1;


%calculations
X_T = zeros(point,1);
Y_T = zeros(point,1);
X_pos=zeros(time_count_max,point);
Y_pos=zeros(time_count_max,point);
D_X=zeros(time_count_max,point);
D_Y=zeros(time_count_max,point);

springsC = findConnections();

[m,n] = size(springsC);

springsV =zeros(m,n,2);
springsV(:,:,2) =1; %for now set all spring values to 1. can be changed later.

%initial offsets
D_X(1,2)=0.1;D_X(2,2)=0.1;
D_Y(1,6)=0.8;D_Y(2,6)=0.8;


for count = 2:1:time_count_max %each time record a point
    D_Y_next = zeros(point,1);
    D_X_next = zeros(point,1);
    for row = 1:1:point%traverse masses
        for col = 1:1:n %traversing connections
            if(not(mass(row,3)==0))%check if it isn't a wall
                if(not(spring(row,col)==0))%check if there is a connection
                    R_o = sqrt((mass(springsC(row,col),1)-mass(row,1))^2+((mass(springsC(row,col),2)-mass(row,2)))^2);
                    
                    X_T(springsC(row,col),1)=D_X(count,springsC(row,col))+mass(springsC(row,col),1);
                    X_T(row,1) = D_X(count,row)+mass(row,1);
                    
                    Y_T(springsC(row,col),1)=D_Y(count,springsC(row,col))+mass(springsC(row,col),2);
                    Y_T(row,1) = D_Y(count,row)+mass(row,2);
                    
                    R_T = sqrt((X_T(springsC(row,col),1)-X_T(row,1))^2+(Y_T(springsC(row,col),2)-Y_T(row,2))^2);
                    
                    D_R = R_T-R_o;
                    
                    phi = atan2(Y_T(springsC(row,col),1)-Y_T(row,1),X_T(springsC(row,col),1)-X_T(row,1));
                    
                    x_displace = springsV(row,col,2)*D_T^2/mass(row,1)*D_R*cos(phi);
                    y_displace = springsV(row,col,2)*D_T^2/mass(row,1)*D_R*sin(phi);
                    
                    D_X_next(row,1) = D_X_next(row,1) + x_displace;
                    D_Y_next(row,1) = D_Y_next(row,1) + y_displace;
                end
            end
        end
    end
    
    for row = 1:1:point
        D_X(count+1,row) = D_X_next(row)+(2*D_X(count,row)-D_X(count-1,row))*0.9999;
        D_Y(count+1,row) = D_Y_next(row)+(2*D_Y(count,row)-D_Y(count-1,row))*0.9999;
        
        X_pos(count+1,row) = D_X(count+1,row);
        Y_pos(count+1,row) = D_Y(count+1,row);
    end
end


figure(1);
plot(X_pos(3:time_count_max,2),Y_pos(3:time_count_max,2));
figure(2);
plot(X_pos(3:time_count_max,6),Y_pos(3:time_count_max,6));

end