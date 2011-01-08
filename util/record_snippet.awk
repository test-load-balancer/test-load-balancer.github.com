BEGIN { 
    started = 0
    idx = 1
    start = ".*" start ".*"
    end = ".*" end ".*"
}

$0 ~ end { 
    if (started == 1) {
        if (name != gensub(end ".*", "\\1", "g")) {
            print "WTF! no end for name '" name "'???" 
            exit 1
        }
        started = 0
    }
    idx++
}

{
    if ( started == 1 ) { 
        print $LINE 
    }
}

$0 ~ start {
    if (idx == nth) {
        name = gensub(start ".*", "\\1", "g")
        print name
        started = 1
    }
}


