ifndef samples_dir
  samples_dir := ../sample_projects
endif
export samples_dir

export snippets_file := doc-latest/example_snippets.html

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

embed_snippets: gen_snippets

gen_snippets:
	@echo Using ${samples_dir} as 'sample_projects' directory
	util/refresh_snippets 