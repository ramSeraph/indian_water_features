
while read -r state; do
  echo "Fetching data for state: $state"
  curl "https://ms8.pmgatishakti.gov.in/api/webapi/users/geojson?state=$state" \
    -H 'Accept: application/json,*/*;q=0.01' \
    -H 'Accept-Language: en-US,en;q=0.9' \
    -H 'Cache-Control: no-cache' \
    -H 'Connection: keep-alive' \
    -H 'Pragma: no-cache' \
    -H 'Referer: https://ms8.pmgatishakti.gov.in/' \
    -H 'Sec-Fetch-Dest: empty' \
    -H 'Sec-Fetch-Mode: cors' \
    -H 'Sec-Fetch-Site: same-origin' \
    -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36' \
    -H 'sec-ch-ua: "Google Chrome";v="141", "Not?A_Brand";v="8", "Chromium";v="141"' \
    -H 'sec-ch-ua-mobile: ?0' \
    -H 'sec-ch-ua-platform: "macOS"' > data/geojsons/$state.geojson
done < data/state_ids.txt
