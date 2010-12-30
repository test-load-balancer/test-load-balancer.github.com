GOOGLE_CDN='<!--GOOGLE-CDN-->'
LOCAL_CDN='<!--LOCAL-DEV-->'
GOOGLE_CDN_END='<!--GOOGLE-CDN-END-->'
LOCAL_CDN_END='<!--LOCAL-DEV-END-->'

function cdn_transform {
    for file_path in `ls _layouts/*.html`; do 
        file_base_name=${file_path##*/}
        cat $file_path | sed -r "s#$1#$2#g" > tmp/$file_base_name
        cat tmp/$file_base_name | sed -r "s#$3#$4#g" > $file_path
    done
}

function cdn_out {
    cdn_transform "$1(<!--)*" "$1<\!--" "(-->)*$2" "-->$2"
}

function cdn_in {
    cdn_transform "$1(<!--)+" $1 "(-->)+$2" $2
}
