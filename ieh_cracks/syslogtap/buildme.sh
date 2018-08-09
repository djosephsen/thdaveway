rm -f syslogtap
docker run --rm -v "$PWD":/go/src/syslogtap -w /go/src/syslogtap golang make

scp syslogtap a.log1.admin.prd.sparkpost:
scp syslogtap b.log1.admin.prd.sparkpost:
scp syslogtap c.log1.admin.prd.sparkpost:
