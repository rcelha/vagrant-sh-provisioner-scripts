repos=$@

if [ ! `which add-apt-repository` ]; then
    apt-get update
    apt-get install -y python-software-properties python g++ make
fi;

for r in $repos; do
    add-apt-repository $r;
done;
