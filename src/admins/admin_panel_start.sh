#!/bin/bash

while true
do

  sudo /usr/local/panel/bin/panel_header.sh clear_screen

  if [ ! -z "$ERROR_MESSAGE" ]
  then
    echo "$ERROR_MESSAGE"
  fi

  echo -e "\t\t\tPanel's Main Window\n\n"

  echo -e "
  Available category:
  \t\t\t1. WWW-domains
  \t\t\t2. Data bases
  \t\t\t3. FTP-accounts
  \t\t\t4. Accounts setings
  \t\t\t5. Services  
  \t\t\t6. Exit\n\n"

  wrong_count=0

  while true
  do
    read -p "Enter number of needed category: " choosen_category
    case "$choosen_category" in
      "1" ) exec $HOME/.panel/www/admin_wwws_category.sh;;
      "2" ) exec $HOME/.panel/db/admin_dbs_category.sh;;
      "3" ) exec $HOME/.panel/ftp/admin_ftps_category.sh;;
      "4" ) exec $HOME/.panel/account/admin_accounts_category.sh;;
      "5" ) exec $HOME/.panel/services/admin_services_category.sh;;
      "6" ) exit ;;
      * ) if [ $wrong_count = "2" ]
          then
            ERROR_MESSAGE='ERROR! You entered wrong argument 3 times. Return to the main menu'
            break
          else
            echo 'Wrong argument. Try again.' 
            wrong_count=$[ $wrong_count + 1 ]
          fi
      ;; 
    esac
  done
done
