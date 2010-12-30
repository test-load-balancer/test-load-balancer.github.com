server:
	jekyll --server

tmp/js: tmp/*.zip
	unzip -o -d tmp/ tmp/jquery-ui*.zip

clean:
	rm -rf tmp/*

check_zip:
	ls tmp/ | grep -q jquery-ui

sw_to_local: 
	util/local_on

google_cdn: 
	util/google_on

local_cdn: check_zip tmp/js sw_to_local
