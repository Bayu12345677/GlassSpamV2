setup:
	apt-get update
	apt-get upgrade
	apt-get install python ruby ncurses-utils clang screen curl jq python-pip boxes
	apt-get install mpv ffmpeg ossp-uuid termux-tools
	pip install requests
	pip install rich
	pip install rich-cli
	gcc main.c -o main.out
	
update:
	git pull
	gcc main.c -o main.out
	@echo "[!] ketik make run"
run:
	@if ./main.out; then true; else echo -e "[!] 0xfffff > hanya bisa di jalankan di direktori/folder termux (cd)\nDebug: ";./main.out; fi
reset:
	rm main.out
