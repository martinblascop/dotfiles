aws-get-volumes-by-tag() {
    aws ec2 describe-volumes --filters "Name=tag:$1,Values=$2"
}
