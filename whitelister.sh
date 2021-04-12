# Coded by Dat30(https://www.cgtaa.com)
# taked from: 
# https://stackoverflow.com/questions/14029212/automate-whitelisting-ip-addresses-in-iptables-via-bash
# and adapted for save rules and restored on wakeup
declare -A iptArray
iptArray[action]='A'
getval() {
    [[ "$@" =~  \"([^\*]*)\"\ *:\ *\"?([^\",]*)\"?[,\ ]*$ ]] && \
        iptArray[${BASH_REMATCH[1]}]=${BASH_REMATCH[2]}
}
while read line; do
    getval $line
    [[ "$line" =~ } ]] && \
        iptables -${iptArray[action]} INPUT -p ${iptArray[protocol]} \
            -s ${iptArray[ip]}/${iptArray[cidr]} \
            --dport ${iptArray[port]} -j ACCEPT
done < whitelist.json 
# Next line is because we are doing this script only for working with MariaDB
iptables -I INPUT 2 -p tcp --dport 3306 -j DROP

iptables-save > /etc/iptables_backup
echo '/sbin/iptables-restore < /etc/iptables_backup' >> /etc/rc.local
