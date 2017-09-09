# Radikorec Docker Image
Docker Image for recording radiko and radiruradiu.

This image includes the following:

- [RTMPDump](https://rtmpdump.mplayerhq.hu/) with [KSV patch](https://github.com/K-S-V/Scripts/releases)
- [rec_radiko.sh](https://gist.github.com/poppen/1da36e6e5671df2c273d2c24e4ad23a7) (for recording radiko)
- [rec_radiru.sh](https://gist.github.com/poppen/93fe4d09f3fca0113139bf1e8d9d48c3) (for recording radiruradiu)

## USAGE

```
docker run --rm -d -v /data:/data poppen/radikorec rec_radiru R2 15 /data nhk_r2
docker run --rm -d -v /data:/data poppen/radikorec rec_radiko TBS 60 /data tbs
```

or write your own crontab.

## LICENSE
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
