#! /bin/bash

PS3="Please Enter Your Number selection ------------> "; export PS3

select menu1 in User-menu Group-menu Exit

do
        case $menu1 in
                User-menu)
                    select menu2 in Add-User Modify-User Delete-User list-User Back
                    do
                            case $menu2 in
                                    Add-User)
                                            read -p "Enter Username: " username
                                            sudo useradd $username >> /finaltask
                                            cat /finaltask
                                            echo "---------------------------------------------------------------"
                                            echo -e "1) Add-User\n2) Modify-User\n3) Delete-User\n4) list-User\n5) Back"
                                            ;;
                                    Modify-User)
                                             read -p "Enter username to modify: " username
                                             select menu3 in Change-password Change-user-ID Back
                                             do
                                                     case $menu3 in
                                                             Change-password)
                                                                     sudo passwd "$username" >> /finaltask
                                                                     cat /finaltask
                                                                     echo "---------------------------------------------------------------"
                                                                     echo -e "1) Change-password\n2) Change-user-ID\n3) Back"
                                                                     ;;
                                                             Change-user-ID)
                                                                     read -p "Enter new user ID: " user_id
                                                                     sudo usermod -u "$user_id" "$username" >> /finaltask
                                                                     cat /finaltask
                                                                     echo "---------------------------------------------------------------"
                                                                     echo -e "1) Change-password\n2) Change-user-ID\n3) Back"
                                                                     ;;
                                                             Back)
                                                                     echo "---------------------------------------------------------------"
                                                                     echo -e "1) Add-User\n2) Modify-User\n3) Delete-User\n4) list-User\n5) Back"
                                                                     break
                                                                     ;;
                                                             *)
                                                                     echo "INVALID INPUT"
                                                     esac
                                             done
                                             ;;

                                    Delete-User)
                                            read -p "Enter username to delete: " username
                                            sudo userdel "$username" >> /finaltask
                                            cat /finaltask
                                            echo "---------------------------------------------------------------"
                                            echo -e "1) Add-User\n2) Modify-User\n3) Delete-User\n4) list-User\n5) Back"
                                            ;;
                                    list-User)
                                            cat /etc/passwd | grep "home" | cut -d: -f1
                                            echo "---------------------------------------------------------------"
                                            echo -e "1) Add-User\n2) Modify-User\n3) Delete-User\n4) list-User\n5) Back"
                                            ;;
                                    Back)
                                            echo "---------------------------------------------------------------"
                                            echo -e "1) user-menu\n2) Group-menu\n3) Exit"
                                            break
                                            ;;
                                    *)
                                            echo "INVALID INPUT"
                                            ;;
                            esac
                    done


                        ;;
                Group-menu)
                        select menu4 in Add-group Delete-group list-group Back
                                do
                            case $menu4 in
                                    Add-group)
                                            read -p "Enter Group name: " groupname
                                            sudo groupadd $groupname >> /finaltask
                                            cat /finaltask
                                            echo "---------------------------------------------------------------"
                                            echo -e "1) Add-group\n2) Delete-group\n3) list-group\n4) Back"
                                            ;;
                                    Delete-group)
                                            read -p "Enter group to delete: " groupname
                                            sudo groupdel "$groupname" >> /finaltask
                                            cat /finaltask
                                            echo "---------------------------------------------------------------"
                                            echo -e "1) Add-group\n2) Delete-group\n3) list-group\n4) Back"
                                            ;;
                                    list-group)
                                            cat /etc/group | cut -d: -f1
                                            echo "---------------------------------------------------------------"
                                             echo -e "1) Add-group\n2) Delete-group\n3) list-group\n4) Back"
                                            ;;
                                    Back)
                                            echo "---------------------------------------------------------------"
                                            echo -e "1) user-menu\n2) Group-menu\n3) Exit"
                                            break
                                            ;;
                                    *)
                                            echo "INVALID INPUT"
                                            ;;
                            esac
                    done


                        ;;
                Exit)
                        echo "Good Bye !!!!"
                        break
                        ;;
                *)
                        echo " INVALID INPUT "
        esac
done



