filePermission () {
    fileName=$1

    chmod u+rw $fileName
    echo "Gave read and write permission to $fileName file"
}

folderPermission () {
    folderName=$1

    chmod u+r $folderName
    echo "Gave read permission to $folderName folder"
}

echo "File name: $1"
echo "Folder name: $2"

filePermission "$1"
folderPermission "$2"