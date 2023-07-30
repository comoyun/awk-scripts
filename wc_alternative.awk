BEGIN {
    ln = 0;
    wn = 0;
    cn = 0;
}

{
    cn += length($0) + 1;

    wn += NF;

    ++ln;
}

END {
    print ln, wn, cn;
}
