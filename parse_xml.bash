filename=$1
tablename=${filename%.xml}

# for linebreak substitution see http://stackoverflow.com/a/15000774/1328439

xmlstarlet sel -t -m "//pma_xml_export/database/table"  --var linebreak -n --break -n \
   -m "column" -v "concat(@name,',',translate(.,\$linebreak,''))" -n ${filename} |\
   awk 'function printrec(rec){
         if (rec["id"] > 0) 
              printf "insert into sentirus.'${tablename}' values ( %s,%s,%s,\047%s\047,%s,%s,%s,%s,%s,%s,%s,%s);\n",
              rec["id"], 
              rec["twitid"],
              rec["date"],
              rec["text"],
              rec["sberbank"],
              rec["vtb"],
              rec["gazprom"],
              rec["alfabank"],
              rec["bankmoskvy"],
              rec["raiffeisen"],
              rec["uralsib"],
              rec["rshb"]
        }
        BEGIN {FS=","; print "begin;\n"} 
        /^$/ { printrec(rec) }
       /.*,.*/ {rec[$1]=substr($0,index($0,",")+1)}
       END {printrec(rec); printf "commit;\n"}' > insert_values_${tablename}.sql

