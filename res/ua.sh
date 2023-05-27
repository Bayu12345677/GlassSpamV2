#!/data/data/com.termux/files/usr/bin/bash

# framework
source lib/app.sh

# login header
Namespace: Std::Main

import.source [io:log.app,io:match.app]

shopt -s expand_aliases

function Ua(){
	eval args=($(parser ["$@"]))

	declare -i limit="${args[1]}"
	declare ua="${args[2]}"
	
	function __init__(){
		
		alias Ua.generate="__Ua__::generate"
	}

	__Ua__::generate(){
		local resp=$(curl -sLX POST "https://user-agents.net/random" --insecure \
		-H "content-type: application/x-www-form-urlencoded" \
		-H 'sec-ch-ua-platform: "Windows"' \
		-H "sec-fetch-dest: document" \
		-H "sec-fetch-mode: navigate" \
		-H "sec-fetch-site: same-origin" \
		-H "sec-fetch-user: ?1" \
		-H "upgrade-insecure-requests: 1" \
		-H "user-agent: $ua" --compressed --data-raw "limit=${limit}&action=generate")

		response=$(echo "$resp"|grep "<li>"|cut -d ">" -f 3|grep "M"|sed 's/<.*//g'|tail +2|sort -R|head -1)

		while true; do
			if test -z "$response"; then response=$(echo "$resp"|grep "<li>"|cut -d ">" -f 3|grep "M"|sed 's/<.*//g'|tail +2|sort -R|head -1); else break; fi
		done
		cat <<< "$response"
	}

	__init__
}

Ua ["\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36\"","\"10\""]
Ua.generate
