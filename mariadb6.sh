#!/bin/bash

result="$(zenity  --forms --title="Create User Database"  --text="Enter Information"\
  --add-entry="User name"\
  --add-password="Password"\
  --add-entry="Host name"\
  --add-entry="Database name"\
  --add-entry="Table name")"

#user=$user
#pass=$pass
#host=$host
#db=$db
#tb=$tb
#GRANT ALL ON ${Ndb}.${Ntb} TO '${Nuser}'@'${Nhost}' IDENTIFIED BY '${Npass}';

	Nuser="$(echo "$result"| cut -d '|' -f 1)"
	Npass="$(echo "$result"| cut -d '|' -f 2)"
	Nhost="$(echo "$result"| cut -d '|' -f 3)"
	Ndb="$(echo "$result"| cut -d '|' -f 4)"
	Ntb="$(echo "$result"| cut -d '|' -f 5)"



mariadb --user=${Nuser} --host=${Nhost} --password=${Npass} <<  mariadb_query

CREATE  DATABASE  ${Ndb};

GRANT ALL ON ${Ndb}.${Ntb} TO '${Nuser}'@'${Nhost}';

FLUSH PRIVILEGES;

mariadb_query

zenity --info         --text "sucssecfully of added ${Nuser} and databases!"
