
SOURCE="/path/to/source"
BACKUP_DIR="/path/to/backup"
FILENAME="backup_$(date +%F).tar.gz"

echo "Checking disk space..."
df -h /

echo -e "\nStarting Backup..."

if [ ! -d "$SOURCE" ]; then
    echo "ERROR: The folder you want to back up does not exist!"
    exit 1
fi

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/$FILENAME" -C "$SOURCE" .

if [ $? -eq 0 ]; then
    echo "SUCCESS: Your backup was saved as $FILENAME"
else
    echo "ERROR: Something went wrong during the backup."
    exit 1
fi
