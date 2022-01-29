#!/bin/bash



# internal
aws cloudwatch put-metric-alarm \
  --alarm-name "temper-internal" \
  --alarm-description "temper internal temperature low" \
  --namespace "temper" \
  --metric-name internal \
  --statistic Minimum \
  --period 300 \
  --evaluation-periods 3 \
  --threshold 20 \
  --comparison-operator LessThanOrEqualToThreshold \
  --dimensions Name=location,Value=sl


# external
aws cloudwatch put-metric-alarm \
  --alarm-name "temper-external" \
  --alarm-description "temper external temperature low" \
  --namespace "temper" \
  --metric-name external \
  --statistic Minimum \
  --period 300 \
  --evaluation-periods 3 \
  --threshold 20 \
  --comparison-operator LessThanOrEqualToThreshold \
  --dimensions Name=location,Value=sl
