{ exec } = require "child_process"

task "build", "USE THE MAKEFILE!!!! builds the all your code for production", ->
	exec "coffee -c -b -o server ./"

task "test", "USE THE MAKEFILE!!!! runs all tests in the spec folder" , ->
	exec "mocha --compilers coffee:coffee-script --report nyan spec/*/*.coffee"
