BEGIN { 
    started = 0; 
}

/TLB-DOC-TASK-END/ { 
    started = 0 
}

{
    if ( started == 1 ) { 
        print $LINE 
    }
}

/TLB-DOC-TASK-START/ { 
    started = 1 
}
