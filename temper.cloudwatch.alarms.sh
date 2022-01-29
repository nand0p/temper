#!/bin/bash


NAME=temper
PERIOD=300
THRESHOLD=20
EVALUATION_PERIODS=3
LOCATION=sl


# internal
aws cloudwatch put-metric-alarm \
  --alarm-name "${NAME}-internal" \
  --alarm-description "${NAME} internal temperature low" \
  --namespace "${NAME}" \
  --metric-name internal \
  --statistic Minimum \
  --period ${PERIOD} \
  --evaluation-periods ${EVALUATION_PERIODS} \
  --threshold ${THRESHOLD} \
  --comparison-operator LessThanOrEqualToThreshold \
  --dimensions Name=location,Value=${LOCATION}


# external
aws cloudwatch put-metric-alarm \
  --alarm-name "${NAME}-external" \
  --alarm-description "${NAME} external temperature low" \
  --namespace "${NAME}" \
  --metric-name external \
  --statistic Minimum \
  --period ${PERIOD} \
  --evaluation-periods ${EVALUATION_PERIODS} \
  --threshold ${THRESHOLD} \
  --comparison-operator LessThanOrEqualToThreshold \
  --dimensions Name=location,Value=${LOCATION}
