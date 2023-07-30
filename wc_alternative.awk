BEGIN {
    ln = 0;
    wn = 0;
    cn = 0;
}

{
    cn += length($0) + 1;

    for(i = 0; i < NF; ++i) {
	++wn;
    }

    ++ln;
}

END {
    print ln, wn, cn;
}
