filename=$1
basename=${filename%.text}

sed 's/http:[^ ]*//' < ${filename} | tr ' ' '\n' | tr -d '.,!#"' | sed 's/[«»]//g ; s/^\(.*\)$/\L\1/'  |\
    sort | uniq -c | sort -rn -k1,1 | tee ${basename}.freq

