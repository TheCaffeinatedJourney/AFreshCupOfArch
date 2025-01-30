#!/bin/bash

# function to selectively add users to groups
manage_group_membership() {
    local group_name="$1"

    if ! getent group "$group_name" > /dev/null; then
        echo "Error: Group '$group_name' does not exist!" >&2
        return 1
    fi

    echo "Listing users and their membership in the group '$group_name':"
    echo "------------------------------------------------------------"

    awk -F: '($3 >= 1000 && $1 != "nobody") { print $1 }' /etc/passwd | while read -r user; do
        if id -nG "$user" | grep -qw "$group_name"; then
            echo "$user: Member"
        else
            echo "$user: Not a member"
        fi
    done

    echo "------------------------------------------------------------"
    echo "Enter the usernames (space-separated) of users to add to the group '$group_name':"
    read -rp "Usernames: " user_list

    for user in $user_list; do
        if id "$user" &> /dev/null; then
            usermod -aG "$group_name" "$user"
            if [[ $? -eq 0 ]]; then
                echo "User '$user' successfully added to the group '$group_name'."
            else
                echo "Error: Could not add user '$user' to the group '$group_name'!" >&2
            fi
        else
            echo "Error: User '$user' does not exist!" >&2
        fi
    done
} 