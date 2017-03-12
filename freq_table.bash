filename=$1
basename=${filename%.text}

tr ' ' '\n' < ${filename} | tr -d '.,!#"' | sed 's/[«»]//g ; s/^\(.*\)$/\L\1/'  | sort | uniq -c | sort -rn -k1,1 | tee ${basename}.freq

