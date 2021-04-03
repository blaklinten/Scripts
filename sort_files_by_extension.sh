find . -type f | sed 's/.*\.\([a-z0-9.]\+\)$/\1/' | sort -u > sort.list;

while read extension; do
	mkdir $extension; mv */*.$extension $extension;
done < sort.list

rm sort.list
