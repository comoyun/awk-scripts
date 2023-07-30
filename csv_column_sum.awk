
BEGIN {
    FS = ",";
    sum = 0;
}

{
    if($column + 0 == $column) {
	# sum -= $column;
        # sum *= $column;
	sum += $column;
    }
}

END {
    print "Sum: " sum;
}
