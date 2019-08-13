#!/bin/bash

helpFunction()
{
   echo ""
   echo -h "\tYour own public static IP"
   echo -p "\tYour own public static IP"
   echo -k "\tYour miner private key in RAW format"
   echo -t "\tThe timestamp of the genesis block"
   echo -a "IP of your first peer"
   echo -b "IP of your second peer"
   echo -n "Your Node Name"
   echo ""
   exit 1
}

while getopts "h:p:k:t:a:b:n:" opt
do
   case "$opt" in
      h ) host="$OPTARG" ;;
      p ) port="$OPTARG" ;;
      k ) privKey="$OPTARG" ;;
      t ) timeStamp="$OPTARG" ;;
      a ) peer1="$OPTARG" ;;
      b ) peer2="$OPTARG" ;;
      n ) name="$OPTARG" ;;
      ? ) helpFunction ;;
   esac
done

mkdir blockchain
cp generator-settings.conf settings.conf
sed -i 's/HostIp/'$host'/g' settings.conf
sed -i 's/Port/'$port'/g' settings.conf
sed -i 's/ProducerKey/'$privKey'/g' settings.conf
sed -i 's/TimeStamp/'$timeStamp'/g' settings.conf
sed -i 's/YourNodeName/'$name'/g' settings.conf
sed -i 's/Peer1/'$peer1'/g' settings.conf
sed -i 's/Peer2/'$peer2'/g' settings.conf
echo ""
echo "Generated the settings.conf successfully"