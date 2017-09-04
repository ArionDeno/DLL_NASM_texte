#  Como fazer uma DLL em ASM e 
# usar com um programa em C
# ----------------------------
# estarei gerando uma função em assembly com o nasm
# que detecta colisao

# primero geramos o  obj com nasm
# segundo compiamos como o gcc com a opçao -shared
# gcc -shared coliao.obj -o coliao.dll 
#
# a definiçao da função deve ficar em 
# arquivo de cabeçario *.h

all: texte.exe

texte.exe: colisao.dll main.o
	gcc  main.o colisao.dll -o texte.exe -lmingw32 -lSDLmain -lSDL
	
colisao.dll: colisao.asm colisao.h
	nasm -f win32 colisao.asm
	gcc -shared colisao.obj -o colisao.dll -lmingw32 -lSDLmain -lSDL
	
main.o: main.c colisao.h colisao.obj
	gcc -c main.c -lmingw32 -lSDLmain -lSDL
	