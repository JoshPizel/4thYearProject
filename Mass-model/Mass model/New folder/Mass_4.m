function Mass_4
% Only 4 masses in a 2 by 2 array.
% Fixed Walls
% 12 spings.

clc;
home

disp('0 ++ Start of Mass_4 program.                                        Mass_4');
    Mass_Number = 4;
    Point_Number = 4;
    Spring_Number = 12;
    Time_Count_Maximum_Seconds = 100;
disp('0 -- End initial start block.');

disp('1 ++ Defining mass spring arrays.');
    % Position / displacement definition
        X = zeros(4,4); Y = zeros(4,4); M = zeros(4, 4); Displacement_Option = zeros(4, 4);
        % Bottom Row Y = 0
            X(1, 1) = 1;   Y(1, 1) = 1; M(1, 1) = 1; Displacement_Option(1, 1) = 0; % Wall, fixed
            X(2, 1) = 2;   Y(2, 1) = 1; M(2, 1) = 1; Displacement_Option(2, 1) = 0; % Wall, fixed
            X(3, 1) = 3;   Y(3, 1) = 1; M(3, 1) = 1; Displacement_Option(3, 1) = 0; % Wall, fixed
            X(4, 1) = 4;   Y(4, 1) = 1; M(4, 1) = 1; Displacement_Option(4, 1) = 0; % Wall, fixed
        % Second Row Y = 1
            X(1, 2) = 1;   Y(1, 2) = 2; M(1, 2) = 1; Displacement_Option(1, 2) = 0; % Wall, fixed
            X(2, 2) = 2;   Y(2, 2) = 2; M(2, 2) = 1; Displacement_Option(2, 2) = 1; % Mass movable
            X(3, 2) = 3;   Y(3, 2) = 2; M(3, 2) = 1; Displacement_Option(3, 2) = 1; % Mass movable
            X(4, 2) = 4;   Y(4, 2) = 2; M(4, 2) = 1; Displacement_Option(4, 2) = 0; % Wall, fixed
        % Third Row Y = 2
            X(1, 3) = 1;   Y(1, 3) = 3; M(1, 3) = 1; Displacement_Option(1, 3) = 0; % Wall, fixed
            X(2, 3) = 2;   Y(2, 3) = 3; M(2, 3) = 1; Displacement_Option(2, 3) = 0; % Mass movable
            X(3, 3) = 3;   Y(3, 3) = 3; M(3, 3) = 1; Displacement_Option(3, 3) = 0; % Mass movable
            X(4, 3) = 4;   Y(4, 3) = 3; M(4, 3) = 1; Displacement_Option(4, 3) = 0; % Wall, fixed
        % Fourth Row Y = 3
            X(1, 4) = 1;   Y(1, 4) = 4; M(1, 4) = 1; Displacement_Option(1, 4) = 0; % Wall, fixed
            X(2, 4) = 2;   Y(2, 4) = 4; M(2, 4) = 1; Displacement_Option(2, 4) = 0; % Wall, fixed
            X(3, 4) = 3;   Y(3, 4) = 4; M(3, 4) = 1; Displacement_Option(3, 4) = 0; % Wall, fixed
            X(4, 4) = 4;   Y(4, 4) = 4; M(4, 4) = 1; Displacement_Option(4, 4) = 0; % Wall, fixed
    % Horizontal springs
        Kx = zeros(4, 4, 4, 4); % I1, J1, I2, J2
        % Bottow Row Y = 0
            Kx(1, 1, 2, 1) = 0; Kx(2, 1, 1, 1) = 0;
            Kx(2, 1, 3, 1) = 0; Kx(3, 1, 2, 1) = 0;
            Kx(3, 1, 4, 1) = 0; Kx(4, 1, 3, 1) = 0;
        % Second Row Y = 1
            Kx(1, 2, 2, 2) = 1; Kx(2, 2, 1, 2) = 1;
            Kx(2, 2, 3, 2) = 1; Kx(3, 2, 2, 2) = 1;
            Kx(3, 2, 4, 2) = 1; Kx(4, 2, 3, 2) = 1;
        % Third Row Y = 2
            Kx(1, 3, 2, 3) = 1; Kx(2, 3, 1, 3) = 1;
            Kx(2, 3, 3, 3) = 1; Kx(3, 3, 2, 3) = 1;
            Kx(3, 3, 4, 3) = 1; Kx(4, 3, 3, 3) = 1;
        % Fourth Row Y = 3
            Kx(1, 4, 2, 4) = 0; Kx(2, 4, 1, 4) = 0;
            Kx(2, 4, 3, 4) = 0; Kx(3, 4, 2, 4) = 0;
            Kx(3, 4, 4, 4) = 0; Kx(4, 4, 3, 4) = 0;
        % Vertical springs
        Ky = zeros(4, 4, 4, 4);
        % Left column X = 0
            Ky(1, 1, 1, 2) = 0; Ky(1, 2, 1, 1) = 0;
            Ky(1, 2, 1, 3) = 0; Ky(1, 3, 1, 2) = 0;
            Ky(1, 3, 1, 4) = 0; Ky(1, 4, 1, 3) = 0;
        % Second column X = 1
            Ky(2, 1, 2, 2) = 1; Ky(2, 2, 2, 1) = 1;
            Ky(2, 2, 2, 3) = 1; Ky(2, 3, 2, 2) = 1;
            Ky(2, 3, 2, 4) = 1; Ky(2, 4, 2, 3) = 1;
        % Third column X = 2
            Ky(3, 1, 3, 2) = 1; Ky(3, 2, 3, 1) = 1;
            Ky(3, 2, 3, 3) = 1; Ky(3, 3, 3, 2) = 1;
            Ky(3, 3, 3, 4) = 1; Ky(3, 4, 3, 3) = 1;
        % Fourth column X = 3
            Ky(4, 1, 4, 2) = 0; Ky(4, 2, 4, 1) = 0;
            Ky(4, 2, 4, 3) = 0; Ky(4, 3, 4, 2) = 0;
            Ky(4, 3, 4 ,4) = 0; Ky(4, 4, 4, 3) = 0;
%Ky = zeros(4, 4, 4, 4);
disp('2 ++ Defining run time parameters.                                   Mass_4');
    Maximum_Displacement = 1e-5;
    Minimum_Time = 1e50;
    for I1 = 1: 1: 4;
        for J1 = 1: 1: 4;
            for I2 = 1: 1: 4;
                for J2 = 1: 1: 4;
                    if (Kx(I1, J1, I2, J2) ~= 0);
                        D_T = sqrt(Maximum_Displacement * M(I1, J1) / Kx(I1, J1, I2, J2)) / 2;
                        if (D_T <= Minimum_Time);
                            Minimum_Time = D_T;
                        end
                    end
                    if (Ky(I1, J1, I2, J2) ~= 0);
                        D_T = sqrt(Maximum_Displacement * M(I1, J1) / Ky(I1, J1, I2, J2)) / 2;
                        if (D_T <= Minimum_Time);
                            Minimum_Time = D_T;
                        end
                    end
                end
            end
        end
    end
    D_T = Minimum_Time;
    Time_Count_Maximum = fix(Time_Count_Maximum_Seconds / Minimum_Time) + 1;
disp('2 -- End run time parameter setup.');

disp('3 ++ Compute time information                                        Mass_2.');
    X_T = zeros(4, 4);
    Y_T = zeros(4, 4);
    X_Pos = zeros(Time_Count_Maximum, Point_Number, Point_Number);
    Y_Pos = zeros(Time_Count_Maximum, Point_Number, Point_Number);
    D_X = zeros(Time_Count_Maximum, Point_Number, Point_Number);
    D_Y = zeros(Time_Count_Maximum, Point_Number, Point_Number);

    D_X(1, 2, 2) = 0.85; D_X(2, 2, 2) = 0.8501;
    D_Y(1, 2, 2) = 0.; D_Y(2, 2, 2) = 0.00;
%      D_X(1, 3, 3) = -0.25; D_X(2, 3, 3) = -0.2501;
%      D_Y(1, 3, 3) = -0.1; D_Y(2, 3, 3) = -0.1001;
%           D_X(1, 2, 3) = -0.25; D_X(2, 2, 3) = -0.2501;
%      D_Y(1, 2, 3) = -0.1; D_Y(2, 2, 3) = -0.1001;
    for Time_Counter = 2: 1 :Time_Count_Maximum;
        D_X_Next = zeros(4, 4);
        D_Y_Next = zeros(4, 4);
        for I1 = 1: 1: 4;
            for J1 = 1: 1: 4;
                if (Displacement_Option(I1, J1) ~= 0);
                    for I2 = 1: 1: 4;
                        for J2 = 1: 1: 4;
                            if ((I1 ~= I2) || (J1 ~= J2));
                                if ((Kx(I1, J1, I2, J2) ~= 0));                                    
                                    R_o = sqrt((X(I2, J2) - X(I1, J1))^2 + (Y(I2, J2) - Y(I1, J1))^2);
                                    X_T(I2, J2) = D_X(Time_Counter, I2, J2) + X(I2, J2);
                                    X_T(I1, J1) = D_X(Time_Counter, I1, J1) + X(I1, J1);
                                    Y_T(I2, J2) = D_Y(Time_Counter, I2, J2) + Y(I2, J2);
                                    Y_T(I1, J1) = D_Y(Time_Counter, I1, J1) + Y(I1, J1);
                                    R_T = sqrt((X_T(I2, J2) - X_T(I1, J1))^2 + (Y_T(I2, J2) - Y_T(I1, J1))^2);
                                    D_R = R_T - R_o;
                                    Phi = atan2((Y_T(I2, J2) - Y_T(I1, J1)) , (X_T(I2, J2) - X_T(I1, J1)));                   
                                    X_Displacement = Kx(I1, J1, I2, J2) * D_T^2 / M(I1, J1) * D_R * cos(Phi);                                
                                    Y_Displacement = Kx(I1, J1, I2, J2) * D_T^2 / M(I1, J1) * D_R * sin(Phi);
                                    D_X_Next(I1, J1) = D_X_Next(I1, J1) + X_Displacement;
                                    D_Y_Next(I1, J1) = D_Y_Next(I1, J1) + Y_Displacement;
                                end
                                if (Ky(I1, J1, I2, J2) ~= 0);
                                    R_o = sqrt((X(I2, J2) - X(I1, J1))^2 + (Y(I2, J2) - Y(I1, J1))^2);
                                    X_T(I2, J2) = D_X(Time_Counter, I2, J2) + X(I2, J2);
                                    X_T(I1, J1) = D_X(Time_Counter, I1, J1) + X(I1, J1);
                                    Y_T(I2, J2) = D_Y(Time_Counter, I2, J2) + Y(I2, J2);
                                    Y_T(I1, J1) = D_Y(Time_Counter, I1, J1) + Y(I1, J1);
                                    R_T = sqrt((X_T(I2, J2) - X_T(I1, J1))^2 + (Y_T(I2, J2) - Y_T(I1, J1))^2);
                                    D_R = R_T - R_o;
                                    Phi = atan2((Y_T(I2, J2) - Y_T(I1, J1)) , (X_T(I2, J2) - X_T(I1, J1))); 
                                    X_Displacement = Ky(I1, J1, I2, J2) * D_T^2 / M(I1, J1) * D_R * cos(Phi);
                                    Y_Displacement = Ky(I1, J1, I2, J2) * D_T^2 / M(I1, J1) * D_R * sin(Phi);
                                    D_X_Next(I1, J1) = D_X_Next(I1, J1) + X_Displacement;
                                    D_Y_Next(I1, J1) = D_Y_Next(I1, J1) + Y_Displacement;
                                end
                            end
                        end
                    end
                end
            end
        end
        for I1 = 1: 1: 4;
            for J1 = 1: 1: 4;
                D_X(Time_Counter + 1, I1, J1) = D_X_Next(I1, J1) + (2 * D_X(Time_Counter, I1, J1) - D_X(Time_Counter - 1, I1, J1))*.9999;
                D_Y(Time_Counter + 1, I1, J1) = D_Y_Next(I1, J1) + (2 * D_Y(Time_Counter, I1, J1) - D_Y(Time_Counter - 1, I1, J1))*.9999;
                X_Pos(Time_Counter + 1, I1, J1) = D_X(Time_Counter + 1, I1, J1);
                Y_Pos(Time_Counter + 1, I1, J1) = D_Y(Time_Counter + 1, I1, J1);
            end    
        end
    end
    figure(22);
    plot(X_Pos(3: Time_Count_Maximum, 2, 2), Y_Pos(3: Time_Count_Maximum, 2, 2));
    figure(23);
    plot(X_Pos(3: Time_Count_Maximum, 2, 3), Y_Pos(3: Time_Count_Maximum, 2, 3));
    figure(32);
    plot(X_Pos(3: Time_Count_Maximum, 3, 2), Y_Pos(3: Time_Count_Maximum, 3, 2));
    figure(33);
    plot(X_Pos(3: Time_Count_Maximum, 3, 3), Y_Pos(3: Time_Count_Maximum, 3, 3));
    DT = fopen('C:\\Mass Spring Data\\Mass Position.txt', 'w');
        fprintf(DT, '%i \r\n', Time_Count_Maximum);
        for Time_Counter = 2: 1 :Time_Count_Maximum;            
            for I1 = 1: 1: 4;
                for J1 = 1: 1: 4;
                    fprintf(DT, '%i, %i, %i, %10.10e, %10.10e \r\n', Time_Counter, I1, J1, X_Pos(Time_Counter, I1, J1), Y_Pos(Time_Counter, I1, J1));
                end
            end                    
        end
    fclose('all');
    
    
    figure(522);
    Y = abs(fft(X_Pos(:, 2, 2)));
    Y = Y(1: 300);
    plot(1: 300, Y);
        figure(533);
    Y = abs(fft(X_Pos(:, 3, 3)));
    Y = Y(1: 300);
    plot((1: 300) / D_T, Y);
    figure(523);
    Y = abs(fft(X_Pos(:, 2, 3)));
    Y = Y(1: 300);
    plot((1: 300) / D_T, Y);
        figure(532);
    Y = abs(fft(X_Pos(:, 3, 2)));
    Y = Y(1: 300);
    plot((1: 300) / D_T, Y);
%         % X and y cross coupling method 1
%             % P_Mass = 2;
%             % Mass can move: Compute D_Rx and D_Ry
%                 X_Displacement = 0;
%                 Y_Displacement = 0;
%                         R_o = sqrt((X(2) - X(1))^2 + (Y(2) - Y(1))^2);
%                         X_T(2) = D_X(Time_Counter, 2) + X(2);
%                         X_T(1) = D_X(Time_Counter, 1) + X(1);
%                         Y_T(2) = D_Y(Time_Counter, 2) + Y(2);
%                         Y_T(1) = D_Y(Time_Counter, 1) + Y(1);
%                         R_T = sqrt((X_T(2) - X_T(1))^2 + (Y_T(2) - Y_T(1))^2);
%                         D_R = R_T - R_o;
%                         Phi = atan2((Y_T(2) - Y_T(1)) , (X_T(2) - X_T(1)));
%                     D_Rx = D_R * cos(Phi);
%                     D_Ry = D_R * sin(Phi);                    
%                     X_Displacement = X_Displacement - K(2, 1) * D_T^2 / M(2) * D_Rx;
%                     Y_Displacement = Y_Displacement - K(2, 1) * D_T^2 / M(2) * D_Ry;
%                         R_o = sqrt((X(2) - X(3))^2 + (Y(2) - Y(3))^2);
%                         X_T(2) = D_X(Time_Counter, 2) + X(2);
%                         X_T(3) = D_X(Time_Counter, 3) + X(3);
%                         Y_T(2) = D_Y(Time_Counter, 2) + Y(2);
%                         Y_T(3) = D_Y(Time_Counter, 3) + Y(3);
%                         R_T = sqrt((X_T(2) - X_T(3))^2 + (Y_T(2) - Y_T(3))^2);
%                         D_R = R_T - R_o;
%                         Phi = atan2((Y_T(2) - Y_T(3)) , (X_T(2) - X_T(3)));
%                     D_Rx = D_R * cos(Phi);
%                     D_Ry = D_R * sin(Phi);
%                     X_Displacement = X_Displacement - K(2, 3) * D_T^2 / M(2) * D_Rx;
%                     Y_Displacement = Y_Displacement - K(2, 3) * D_T^2 / M(2) * D_Ry;
%             D_X(Time_Counter + 1, 2) = X_Displacement + 2 * D_X(Time_Counter, 2) - D_X(Time_Counter - 1, 2);
%             X_Pos(Time_Counter + 1, 2) = D_X(Time_Counter + 1, 2);                  
%             D_Y(Time_Counter + 1, 2) = Y_Displacement + 2 * D_Y(Time_Counter, 2) - D_Y(Time_Counter - 1, 2);
%             Y_Pos(Time_Counter + 1, 2) = D_Y(Time_Counter + 1, 2);

end

