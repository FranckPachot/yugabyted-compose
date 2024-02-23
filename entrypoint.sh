yugabyted_args=""
if [ -f /root/var/conf/yugabyted.conf ]
then # config already exists, ignore init flags
 tserver_flags="" 
 rm -rf /tmp/.yb.* 
else
 if host "$yugabyted_join" | grep " $(hostname -i)" 
 then
  echo "Ignoring join: $yugabyted_join == $(host $yugabyted_join)"
 else
  until postgres/bin/pg_isready -h "$yugabyted_join" ; do sleep 1 ; done | uniq
  yugabyted_args="--join=$yugabyted_join $yugabyted_args"
 fi
fi
yugabyted_args="$yugabyted_args --cloud_location=$yugabyted_cloud_location"
yugabyted start --background=false $yugabyted_args --tserver_flags=$tserver_flags
