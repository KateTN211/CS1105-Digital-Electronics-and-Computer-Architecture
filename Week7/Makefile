Stack: stack.o
	ld -o Stack stack.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

HelloWorld.o: stack.s
	as -arch arm64 -o stack.o stack.s
