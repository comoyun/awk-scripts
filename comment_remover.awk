# Removes text between /* and */, inclusive
# Removes single-line comments starting with //
# Script doesn't require any variables to be set

{
  # Remove single-line comments first
  gsub(/\/\/.*$/, "", $0)

  # Remove block comments
  while ((i = index($0, "/*")) != 0) {
    out = substr($0, 1, i - 1)  # leading part of the string
    rest = substr($0, i + 2)
    
    # ... */ ...
    j = index(rest, "*/")
    
    # is */ in trailing part?
    if (j > 0) {
      rest = substr(rest, j + 2)  # remove comment
    } else {
      while (j == 0) {
        # get more text
        if (getline <= 0) {
          print "unexpected EOF or error:", ERRNO > "/dev/stderr"
          exit
        }
        # build up the line using string concatenation
        rest = rest $0
        j = index(rest, "*/")
        
        # is */ in trailing part?
        if (j != 0) {
          rest = substr(rest, j + 2)
          break
        }
      }
    }
    
    # build up the output line using string concatenation
    $0 = out rest
  }

  print $0
}

