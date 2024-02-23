FROM  yugabytedb/yugabyte:latest
ADD   entrypoint.sh .
HEALTHCHECK --interval=5s --timeout=5s --start-period=5s CMD postgres/bin/pg_isready -h $(hostname)
CMD   bash -x entrypoint.sh 
