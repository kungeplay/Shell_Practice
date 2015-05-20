users=$(cut -d ':' -f 1 /etc/passwd)
for username in $users
do
id $username
#finger $username
done
