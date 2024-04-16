echo '
pad() {
echo $1
if [ -z $1 ]; then
    nohup gedit >/dev/null 2>&1 & exit
else
    file_name="$1"
    nohup gedit "$file_name" >/dev/null 2>&1 & exit
fi
}
' >> ~/.bashrc