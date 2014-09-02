
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

PATH=/usr/local/bin:$PATH

path=(~/bin /usr/local/sbin /usr/local/bin $path /sbin /usr/sbin)
