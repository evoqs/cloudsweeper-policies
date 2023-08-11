#Update the AWS account key and secret before running this script
export AWS_ACCESS_KEY_ID="****************"
export AWS_SECRET_ACCESS_KEY="*********************"

rm -rf out

custodian run --region us-west-2 --cache-period 0 -c ec2-rsizing-on-MemoryUtilization.yaml -s out --verbose
custodian report -c ec2-rsizing-on-MemoryUtilization.yaml -s out --format grid --field Region=region
custodian report -c ec2-rsizing-on-MemoryUtilization.yaml -s out --format json --field Region=region > out/out_MemoryUtilization.json

custodian run --region us-west-2 --cache-period 0 -c ec2-rsizing-on-CPUUtilization.yaml -s out --verbose
custodian report -c ec2-rsizing-on-CPUUtilization.yaml -s out --format grid --field Region=region
custodian report -c ec2-rsizing-on-CPUUtilization.yaml -s out --format json --field Region=region > out/out_CPUUtilization.json

custodian run --region us-west-2 --cache-period 0 -c ec2-rsizing.yaml -s out --verbose
custodian report -c ec2-rsizing.yaml -s out --format grid --field Region=region
custodian report -c ec2-rsizing.yaml -s out --format json --field Region=region > out/out_rsizing.json
