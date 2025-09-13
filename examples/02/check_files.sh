file="calls.sh"

if [ ! -f $file ]; then
    echo "File not found"
elif [ ! -w $file ]; then
    echo "Can't update file"
else
    echo "Can update!"
fi
