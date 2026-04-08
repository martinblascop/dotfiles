aws-get-volumes-by-autoscaling-group() {
  VOLS=$(aws ec2 describe-instances \
    --filters "Name=tag:eks:nodegroup-name,Values=$1" "Name=instance-state-name,Values=running" \
    --query 'Reservations[*].Instances[*].BlockDeviceMappings[*].Ebs.VolumeId' \
    --output text | xargs -n1 printf "'%s'," | sed "s/,$// ; s/'//g")
  echo $VOLS | sed "s/,/\n/g"
  for vol in `echo $VOLS | sed "s/,/\ /g"` ; do echo "SELECT SUM(VolumeReadOps) FROM SCHEMA(\"AWS/EBS\", VolumeId) WHERE VolumeId = '$vol'" ; done
}
