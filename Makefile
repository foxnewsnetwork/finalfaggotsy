build:
	@coffee \
		-c \
		-b \
		-o ./ server

test:
	@mocha \
		--compilers coffee:coffee-script \
		--reporter spec \
		spec/*/*.coffee

.PHONY: test
		
