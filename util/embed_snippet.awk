BEGIN { 
    verbatim = 1
}

$0 ~ end { 
    verbatim = 1
}

{
    if ( verbatim == 1 ) { 
        print $LINE 
    } 
}

$0 ~ start { 
    verbatim = 0
    print snippet
}

END {
    if ( verbatim == 0 ) {
        print "WTF! no end for '" start "'. Really???"
        exit 1
    }
}