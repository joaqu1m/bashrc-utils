if [[ $1 == "add" ]]; then
    read -p "Are you sure you want to add this? (Y/n) " response
    if [[ $response == "Y" || $response == "y" ]]; then
        command git "$@"
    fi
else
    command git "$@"
fi