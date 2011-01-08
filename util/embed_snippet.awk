BEGIN { 
    verbatim = 1
    embedded = 0
}

$0 ~ end { 
    verbatim = 1
}

{
    if ( verbatim == 1 ) { 
        print $LINE 
    } else if ( embedded == 0 ) {
        print snippet
        embedded = 1
    }
}

$0 ~ start { 
    verbatim = 0
}

END {
    if ( verbatim == 0 ) {
        print "WTF! no end for '" start "'. Really???"
        exit 1
    }
}