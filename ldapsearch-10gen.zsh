ldapsearch-10gen() { ldapsearch -LLLH ldaps://ldap.10gen.cc:6360 -D 'uid=angelo.olivera' -W -b 'c=users,d=identity' uid="$@" }
