filename=$1
basename=${filename%.text}

tr ' ' '\n' < ${filename} | sort | uniq -c | sort -rn -k1,1 | tee ${basename}.freq

