wget -P data https://ms8.pmgatishakti.gov.in/api/init/test.json 

cat data/test.json | jq -r '.catalog[].members[].url' | cut -d"=" -f2 > data/state_ids.txt

bash get.sh

bash join_geojsons.sh 

bash get_csvs.sh

uv run combine_csvs.py
