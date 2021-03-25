#
# Requires installations:
# clang, gcc, gcc-multilib, arm-linux-gnueabi-gcc
#

RULES:=$(shell egrep '^[a-zA-Z0-9_/-]*:($$|[^=])' Makefile | sed -re 's/(.*):.*/\1/' | egrep -v '^all')

SRC:=$(wildcard *.c)

CFLAGS:=
ARMFLAGS:=-target arm-linux-gnueabi

all:
	mkdir -p bin
	make $(RULES)
	strip bin/app-*x86*
	arm-linux-gnueabi-strip bin/app-*arm*

bin/dbg-clang-x86: $(SRC)
	clang $(CFLAGS) -g $(SRC) -o $@ -target i386-pc-linux 

bin/app-clang-x86: $(SRC)
	clang $(CFLAGS) $(SRC) -o $@ -target i386-pc-linux 

bin/app-static-clang-x86: $(SRC)
	clang $(CFLAGS) $(SRC) -o $@ -static -target i386-pc-linux 


bin/dbg-clang-x86_64: $(SRC)
	clang $(CFLAGS) -g $(SRC) -o $@ -target x86_64-pc-linux 

bin/app-clang-x86_64: $(SRC)
	clang $(CFLAGS) $(SRC) -o $@ -target x86_64-pc-linux 

bin/app-static-clang-x86_64: $(SRC)
	clang $(CFLAGS) $(SRC) -o $@ -static -target x86_64-pc-linux 



bin/dbg-clang-arm7: $(SRC)
	clang $(CFLAGS) $(ARMFLAGS) -g $(SRC) -o $@ -mcpu=arm7tdmi

bin/app-clang-arm7: $(SRC)
	clang $(CFLAGS) $(ARMFLAGS) $(SRC) -o $@ -mcpu=arm7tdmi

bin/app-static-clang-arm7: $(SRC)
	clang $(CFLAGS) $(ARMFLAGS) $(SRC) -o $@ -static -mcpu=arm7tdmi

bin/dbg-clang-arm-thumb: $(SRC)
	clang $(CFLAGS) $(ARMFLAGS) -g $(SRC) -o $@ -mcpu=arm9 -mthumb

bin/app-clang-arm-thumb: $(SRC)
	clang $(CFLAGS) $(ARMFLAGS) $(SRC) -o $@ -mcpu=arm9 -mthumb

bin/app-static-clang-arm-thumb: $(SRC)
	clang $(CFLAGS) $(ARMFLAGS) $(SRC) -o $@ -static -mcpu=arm9 -mthumb

bin/dbg-clang-arm9: $(SRC)
	clang $(CFLAGS) $(ARMFLAGS) -g $(SRC) -o $@ -mcpu=arm9

bin/app-clang-arm9: $(SRC)
	clang $(CFLAGS) $(ARMFLAGS) $(SRC) -o $@ -mcpu=arm9

bin/app-static-clang-arm9: $(SRC)
	clang $(CFLAGS) $(ARMFLAGS) $(SRC) -o $@ -static -mcpu=arm9



bin/dbg-gcc-x86: $(SRC)
	gcc $(CFLAGS) -g $(SRC) -o $@ -m32

bin/app-gcc-x86: $(SRC)
	gcc $(CFLAGS) $(SRC) -o $@ -m32

bin/app-static-gcc-x86: $(SRC)
	gcc $(CFLAGS) $(SRC) -o $@ -static -m32

bin/dbg-gcc-x86_64: $(SRC)
	gcc $(CFLAGS) -g $(SRC) -o $@ -m64

bin/app-gcc-x86_64: $(SRC)
	gcc $(CFLAGS) $(SRC) -o $@ -m64

bin/app-static-gcc-x86_64: $(SRC)
	gcc $(CFLAGS) $(SRC) -o $@ -static -m64

