#! /bin/bash
function getsize(){
	size=$(dpkg-query -W --showformat='${Installed-Size;10}\t${Package}\n' | grep -m 1 "[0987654321]\{0,20\}$1" | grep -o "[0-9]\{0,20\}")
	# package name is first passed argument	
	packageName=$1
	#size=$(apt-cache show $packageName | grep 'Installed-Size' | sed 's/Installed-Size:\ //g')
	#echo Size is $size \|
	#echo -e "\|$size $packageName\| \\n"
	echo $size
}
# loop to get all arguments, this should only be package names
for i in $@;do
	declare -i total+=$(getsize $i)
	echo -e $(getsize $i)\\t$i
done

# show final total output at end
echo "################################"
echo "# Total Size in Kilobytes ######"
echo "################################"
echo "Total: $total"
