# nz-covid-scan-data-backups

```
sqlite3 .data/database.sqlite .dump | grep '2021-06'  | gzip -9c > database.sqlite.2021-06.gz
...

sftp user@server
```

