#!/usr/bin/awk -f

# Removes empty lines from files
# Eg. 1. Prints additional info about the process. 
# awk -f empty_line_remover.awk -v verbose=true textFile.txt

# Eg. 2. Saves the output to a file.
# awk -f empty_line_remover.awk -v path="/path/to/save/result" textFile.txt

BEGIN {
  output = "";
  currentFile = "";
  files = "";

  if (verbose == "true") {
    print "Removing empty lines...";
  }
}

{
  # Store the name of the current file in a variable
  tempFile = currentFile;
  currentFile = FILENAME;
  
  # checks if a line starts and ends with space
  if (!($0 ~ /^\s*$/)) {
    
    # If the current file changes, update the list of files and the output string
    if (tempFile != currentFile) {
      files = files " " currentFile;
      output = (NR == 1) ? output currentFile ":" : output "\n\n" currentFile ":";
    }

    output = output "\n" $0;
  }
}

END {

  if(path != "") {
    print "Saving the output to: " path;
    print output > path;
  } else print output;

  if (verbose == "true") {
    print "\nRemoved empty lines from source(s):" files;
  }
}

