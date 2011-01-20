ifndef samples_dir
  samples_dir := ../sample_projects
endif
export samples_dir

export snippets_file := doc-latest/getting_started_with_tlb.html

export max_snippets_per_source_file=10

export embedding_start_tag=TLB-DOC-START@_name_@
export embedding_end_tag=TLB-DOC-END@_name_@

export snip_pre=<pre>
export snip_post=</pre>
export escape_xml=1

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

embed_snippets: 
	@echo Using ${samples_dir} as 'sample_projects' directory
	util/refresh_snippets