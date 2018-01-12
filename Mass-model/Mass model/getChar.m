function c=getChar(N)

%given a number from 1-26, gives the equivelent character value in
%alphabetical order

%currently can only do up to 99

if(N/26>1)
    i=rem(N,26);
    c = char(floor(N/26)+64);
    c = strcat(c,char(i+64));
else
    c = char(N+64);
end



end