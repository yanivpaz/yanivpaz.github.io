# Velero backup and restore
After installing Velero tool , run the backup and restore as described below 

## Backup 
```
helm create mychart
helm install mychart ./mychart
velero backup create mybackup --include-namespaces default
velero backup describe mybackup
velero backup logs mybackup
velero get backups
rm -rf mychart/
```

## Restore 
```
helm delete mychart
velero restore create  --from-backup mybackup
velero delete backup mybackup
```


### Examine the backup file
```
mc config host add mys3 http://localhost:30900/ minio minio123
mc ls mys3/velero/backups/mybackup/
mkdir -p  /tmp/mychart
mc cp  --recursive mys3/velero/backups/mybackup/ /tmp/mybackup
```


