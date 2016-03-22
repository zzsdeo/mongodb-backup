# mongodb-backup

This image runs mongodump to backup data using cronjob to folder `/backup`

## Usage:

    docker run -d \
        --env MONGODB_HOST=mongodb.host \
        --env MONGODB_PORT=27017 \
        --env MONGODB_USER=admin \
        --env MONGODB_PASS=password \
        --volume host.folder:/backup \
        zzsdeo/mongodb-backup

Moreover, if you link `zzsdeo/mongodb-backup` to a mongodb container(e.g. `mongo`) with an alias named mongo, this image will try to auto load the `host`, `port`, `user`, `pass` if possible.

    docker run -d -p 27017:27017 -e MONGODB_PASS="mypass" --name mongo mongo
    docker run -d --link mongo:mongo -v host.folder:/backup zzsdeo/mongodb-backup

## Parameters

    MONGODB_HOST    the host/ip of your mongodb database
    MONGODB_PORT    the port number of your mongodb database
    MONGODB_USER    the username of your mongodb database. If MONGODB_USER is empty while MONGODB_PASS is not, the image will use admin as the default username
    MONGODB_PASS    the password of your mongodb database
    MONGODB_DB      the database name to dump. If not specified, it will dump all the databases
    EXTRA_OPTS      the extra options to pass to mongodump command
    CRON_TIME       the interval of cron job to run mongodump. `0 0 * * *` by default, which is every day at 00:00
    MAX_BACKUPS     the number of backups to keep. When reaching the limit, the old backup will be discarded. No limit, by default
    INIT_BACKUP     if set, create a backup when the container launched

## Restore from a backup

See the list of backups, you can run:

    docker exec mongodb-backup ls /backup

To restore database from a certain backup, simply run:

    docker exec mongodb-backup /restore.sh /backup/2015.08.06.171901
