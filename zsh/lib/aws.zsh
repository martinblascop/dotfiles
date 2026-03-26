aws-get-volumes-by-autoscaling-group() {
  VOLS=$(aws ec2 describe-instances \
    --filters "Name=tag:eks:nodegroup-name,Values=$1" "Name=instance-state-name,Values=running" \
    --query 'Reservations[*].Instances[*].BlockDeviceMappings[*].Ebs.VolumeId' \
    --output text | xargs -n1 printf "'%s'," | sed 's/,$//')
  echo $VOLS | sed "s/'//g ; s/,/\n/g"
  echo "SELECT SUM(VolumeReadOps) FROM SCHEMA(\"AWS/EBS\", VolumeId) WHERE VolumeId IN ($VOLS) GROUP BY VolumeId"
}
