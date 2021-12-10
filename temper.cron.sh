#!/bin/bash

DATE=$(date +%s)

# write out summary log
/root/.venv38/bin/python /root/temper/temper.py >> /root/temper/temper.log

# write out raw details
/root/.venv38/bin/python /root/temper/temper.py --json | jq . > /root/temper/raw_json/${DATE}.json
sed -i 's/ temperature/_temperature/g' /root/temper/raw_json/${DATE}.json

# push metrics to cloudwatch
/root/.venv38/bin/aws cloudwatch put-metric-data --metric-name internal --namespace temper --dimensions location=sl --value $(jq .[].internal_temperature /root/temper/raw_json/${DATE}.json)
/root/.venv38/bin/aws cloudwatch put-metric-data --metric-name external --namespace temper --dimensions location=sl --value $(jq .[].external_temperature /root/temper/raw_json/${DATE}.json)
