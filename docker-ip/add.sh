echo '
alias dockerip='docker inspect $1 --format="{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}"'
' >> ~/.bashrc