source /usr/local/share/zsh/site-functions/_aws

aws-set()
{
  case $1 in
    10gen-noc)
        export AWS_ACCOUNT=noc-rw
        source <(aws-okta env noc)
        aws_okta=1
        ;;
    sandbox)
        export AWS_ACCOUNT=sandbox
        source <(aws-okta env sandbox)
        aws_okta=1
        ;;
    platform)
        export AWS_ACCOUNT=platform-ro
        source <(aws-okta env prod-ro)
        aws_okta=1
      ;;
    platform-rw)
        export AWS_ACCOUNT=platform-rw
        source <(aws-okta env prod)
        aws_okta=1
      ;;
    admin)
        export AWS_ACCOUNT=admin
        source <(aws-okta env admin)
        aws_okta=1
      ;;
    prod-iam)
      # angelo.olivera @ 10gen-noc
      export AWS_ACCOUNT=noc-rw-iam
      export AWS_ACCESS_KEY_ID=AKIAI3JZTEOXJDT3UMJQ
      export AWS_DEFAULT_REGION=us-east-1
      ;;
    ops)
      export AWS_ACCOUNT=ops
      export AWS_ACCESS_KEY_ID=AKIAIXOUVQJX3YLWL65A
      export AWS_DEFAULT_REGION=us-east-1
      ;;
    platform-iam)
      export AWS_ACCOUNT=platform-rw-iam
      export AWS_ACCESS_KEY_ID=AKIAJRXZNVSW67DLESRA
      export AWS_DEFAULT_REGION=us-east-1
      ;;
    personal)
      export AWS_ACCOUNT=personal
      export AWS_ACCESS_KEY_ID=AKIAJUGJYXYC445IZX5Q
      export AWS_DEFAULT_REGION=us-west-1
      ;;
    test)
      # redondos@10gen-test
      export AWS_ACCOUNT=test
      export AWS_ACCESS_KEY_ID=AKIAIFUYGOOQ6DCMSIHA
      export AWS_DEFAULT_REGION=us-east-1
      ;;
    corp)
      export AWS_ACCOUNT=corp
      export AWS_ACCESS_KEY_ID=AKIAIV2AGM54EQ6GTMBA
      ;;
    build)
      export AWS_ACCOUNT=build
      # angelo.olivera@10gen-build
      export AWS_ACCESS_KEY_ID=AKIAJ7QF76HBMWBVDXTQ
      export AWS_DEFAULT_REGION=us-east-1
      ;;
    pm)
      # angelo.olivera@product-management
      export AWS_ACCOUNT=pm
      export AWS_ACCESS_KEY_ID=AKIAJO3DS4536J2O52UQ
      export AWS_DEFAULT_REGION=us-east-1
      ;;
    clear)
      unset AWS_ACCESS_KEY_ID
      unset AWS_SECRET_ACCESS_KEY
      unset AWS_ACCOUNT
      unset AWS_OKTA_PROFILE
      unset AWS_SECURITY_TOKEN
      unset AWS_SESSION_TOKEN
      ;;
    *)
      # angelo.olivera_readonly@prod-ro
      export AWS_ACCOUNT=noc-ro
      export AWS_ACCESS_KEY_ID=AKIAJCWT6423JIUXXDCQ
      export AWS_DEFAULT_REGION=us-east-1
      ;;
  esac

  if [[ -z $aws_okta ]]; then
    export AWS_SECRET_ACCESS_KEY=$(/usr/bin/security -q find-internet-password -g -w -s aws.amazon.com -a $AWS_ACCESS_KEY_ID)
    unset aws_okta
  fi
}

aws-show()
{
  echo AWS_ACCOUNT=$AWS_ACCOUNT
  echo AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
  echo AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
  echo AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION
}

aws-account()
{
  echo $AWS_ACCOUNT
}

if [[ -e /usr/bin/security ]]; then
  aws-set
fi
