export FLEETCTL_TUNNEL=34.234.16.1
export DEISCTL_TUNNEL=34.234.16.1

fleet-units() {
  units=$(fleetctl list-units)
  echo $units | gsed '1d; s,.*/,,; s,[[:space:]].*,,' | sort | uniq -c
  echo "  $(( $(echo $units | wc -l) - 1)) total"
}
