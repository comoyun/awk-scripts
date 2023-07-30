{
    id = 0;

    while(++id < NF) {
	gsub(/[^[:alnum:]]/, "", $id);

	$id = tolower($id);

	uniqWords[$id] = uniqWords[$id] + 1;
    }
}

END {
    # Uncomment the below line to sort the array in ascending order
    # asorti(uniqWords);

    for (i in uniqWords) {
        printf "%-8s %s\n", i, uniqWords[i];
    }
}
