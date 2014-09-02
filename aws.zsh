# Personal
aws-set()
{
  case $1 in
    prod)
      export AWS_ACCESS_KEY_ID=AKIAIURT56RP5DS4OQEQ
      export AWS_SECRET_ACCESS_KEY=$(/usr/bin/security -q find-internet-password -g -w -s aws.amazon.com -a 10gen-noc)
      export AWS_DEFAULT_REGION=us-east-1
      ;;
    personal)
      export AWS_ACCESS_KEY_ID=AKIAJUGJYXYC445IZX5Q
      export AWS_SECRET_ACCESS_KEY=$(keychain_password AKIAJUGJYXYC445IZX5Q aws.amazon.com)
      export AWS_DEFAULT_REGION=us-west-1
      ;;
    *)
      # prod-ro
      export AWS_ACCESS_KEY_ID=AKIAJCWT6423JIUXXDCQ
      export AWS_SECRET_ACCESS_KEY=$(/usr/bin/security -q find-internet-password -g -w -s aws.amazon.com -a angelo.olivera_readonly)
      export AWS_DEFAULT_REGION=us-east-1
      ;;
  esac
}

aws-set

