local_subnet()
{
count=0
while [ $count -lt 4 ]
  do
    (( count++ ))

    ip_host=`hostname -I`
    ip_sub=`echo $ip_host | cut -d. -f-3`
    dot=.
    #ip_sub=1.1.1
    ip_range=$ip_sub$dot$count

    echo $ip_range
    portscan "$ip_range"
  done
}
portscan()
{
echo remote host $1
for port in {80..81}; do
  if echo >/dev/tcp/$1/$port; then
    echo "port $port is open"
  else
    echo "port $port is closed"
  fi
done 2>/dev/null
}

remote_host(){
echo -n  "write remote host"
read remote
portscan "$remote"
}

if [ -z "$1" ]
  then
    echo "No argument supplied \* $*"
    exit
fi

if [ "$1" = "--all" ] ; then
   local_subnet
   exit
fi

if [ "$1" = "--target" ]; then
   remote_host
   exit
fi
