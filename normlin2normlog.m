function y = normlin2normlog(x)
    bitnum = 65535;
    base = 2;
    x = x.*bitnum;
    c = bitnum./(log(1+bitnum)./log(base));
    y = c.*(log(1+x)./log(base));
    y = y./bitnum;
end