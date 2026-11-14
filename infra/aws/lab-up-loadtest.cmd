@echo off
REM Start the lab at load-test / demo size: larger database with a standby copy in the second zone.
REM About $0.24/h instead of $0.19/h. Stop with lab-down.cmd as usual.
REM Run from infra\aws.
terraform apply -var="lab_on=true" -var="db_instance_class=db.t4g.small" -var="db_multi_az=true"
