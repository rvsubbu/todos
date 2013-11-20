rm -f dts firstddnums next_items.html len
grep -n "<dt" tasks.html | cut -d: -f1 > dts
touch firstddnums next_items.html
grep -n "<\/dl" tasks.html | cut -d: -f1 > len
l=$((1+`cat len`))
for n in `cat dts`
do
	echo $(($l-$n)) >> firstddnums
done 
for n in `cat firstddnums`
do
	tail -n $n tasks.html | head -1 >> next_items.html
done 
rm -f firstddnums dts len

