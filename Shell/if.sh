if [ -f test.txt ]; then
    mv test.txt new.txt
    echo "File renamed successfully."
else
    echo "No such file or not a regular file."
fi
