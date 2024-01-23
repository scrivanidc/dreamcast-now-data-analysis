while :
do
    try=$(curl -s 'http://dreamcast.online/now/api/users.json' | python -mjson.tool | jq -c '.users[] | {username, country, current_game, level}' |sed 's/["{]//g;;s/,/;/g;s/username://;s/country://;s/current_game://;s/level://;s/}/;/' | sed "s/$/`date +"%Y-%m-%d"`;/" | sed "s/$/`date +"%T"`;/" | sed "s/$/`date +"%Y-%m-%d %T"`;/" | sed "s/$/`date -d '-2 hour' +"%Y-%m-%d %T"`;/" >> /home/pi/now_database.csv)
    sleep 300
    cp /home/pi/now_database.csv /home/pi/bkp1.csv
done
