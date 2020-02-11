
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

PATH=~/bin:/usr/local/bin:$PATH

path=(/opt/chefdk/bin)
path+=(~/.rbenv/shims)
path+=(~/bin ~/src/golang/bin/ /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/local/bin $path /sbin /usr/sbin)
path+=(/Users/redondos/Downloads/AWS-ElasticBeanstalk-CLI-2.6.3/eb/macosx/python2.7)
path+=(/Users/redondos/Library/Python/2.7/bin)
path+=(/Users/redondos/.chefdk/gem/ruby/2.1.0/bin)
path+=(~/.cargo/bin)

export WHALEBREW_INSTALL_PATH=~/bin/whalebrew
path+=(~/bin/whalebrew)

fpath+=(/usr/local/Cellar/kubectx/*/share/zsh/)

