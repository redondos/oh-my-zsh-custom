bootstrap() { time knife bootstrap --bootstrap-version 11.12.8 -E production -j '{ "xgen": { "hostname": "'$1'", "domain": "vpc3.10gen.cc" } }' -r "role[vpc3-base]" -N $1.vpc3.10gen.cc $2 }
