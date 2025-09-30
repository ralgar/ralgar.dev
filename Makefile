.PHONY: build
build:
	docker run --rm --user $$(id -u) -v ./:/src docker.io/hugomods/hugo:0.115.4 sh -c 'cd /src && hugo --minify'
	cp extra/robots.txt public/

.PHONY: clean
clean:
	rm -rf public/ resources/
