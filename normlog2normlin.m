function y = normlog2normlin(x)
    bitnum = 65535;
     base = 2;
    x = x.*bitnum;
    c = bitnum./(log(1+bitnum)./log(base));
    y =base.^(x./c)-1;
    y = y./bitnum;
end