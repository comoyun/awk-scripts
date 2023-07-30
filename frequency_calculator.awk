# Determines the number of times each word has occurred in a text file
# USAGE: awk -f word_frequency_calculator.awk [-v sort="true"] file.txt

{
    id = 0;

    while(++id < NF) {
	gsub(/[^[:alnum:]]/, "", $id);

	$id = tolower($id);

	uniqWords[$id] = uniqWords[$id] + 1;
    }
}

END {
    if(sort == "true") asorti(uniqWords);

    for (i in uniqWords) {
        printf "%-8s %s\n", i, uniqWords[i];
    }
}
