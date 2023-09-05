.PHONY: all clean run

D64_IMAGE = "bin/psychedelia.prg"
X64 = x64
X64SC = x64sc

all: clean run
original: clean d64_orig run_orig

psychedelia.prg: src/psychedelia.asm
	64tass -Wall --cbm-prg -Wno-implied-reg -o bin/psychedelia.prg -L bin/list-co1.txt -l bin/labels.txt src/psychedelia.asm
	echo "e36c7c60f7b8c268f761f7cc6a1521c2  bin/psychedelia.prg" | md5sum -c


run: psychedelia.prg
	$(X64) -verbose $(D64_IMAGE)

clean:
	-rm $(D64_IMAGE) $(D64_ORIG_IMAGE) $(D64_HOKUTO_IMAGE)
	-rm bin/psychedelia.prg
	-rm bin/*.txt
