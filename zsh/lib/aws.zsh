aws-get-volumes-by-autoscaling-group() {
  VOLS=$(aws ec2 describe-instances \
    --filters "Name=tag:eks:nodegroup-name,Values=$1" "Name=instance-state-name,Values=running" \
    --query 'Reservations[*].Instances[*].BlockDeviceMappings[*].Ebs.VolumeId' \
    --output text | xargs -n1 printf "'%s'," | sed "s/,$// ; s/'//g")
  for vol in `echo $VOLS | sed "s/,/\ /g"` ; do
    name=$(aws ec2 describe-volumes --volume-ids "$vol" --query "Volumes[0].Tags[?Key=='Name'].Value | [0]" --output text)
    echo "$vol $name"
  done
}
