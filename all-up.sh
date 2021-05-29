DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

for composedir in $DIR/*/
do
	if [ ! -f $composedir/docker-compose.yml ]; then
		echo "No docker-compose.yml found in $composedir, skipping"
	else
		(cd $composedir; docker-compose up -d)
	fi
done
