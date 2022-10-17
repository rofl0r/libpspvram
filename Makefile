### 
## libpspvram library makefile
###

TARGET_LIB_vramalloc = libpspvramalloc.a
TARGET_LIB_VRAM   = libpspvram.a
TARGET_LIB = $(TARGET_LIB_VRAM)

vramalloc_OBJS = vramalloc.o
VRAM_OBJS   = vram.o

INCDIR = 
CFLAGS = -G0 -mno-explicit-relocs -O2 -Wall -Werror -g

CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS)

LDFLAGS =
LIBS = 

all: pspvramalloc pspvram

pspvramalloc:
	make TARGET_LIB=$(TARGET_LIB_vramalloc) OBJS=$(vramalloc_OBJS) $(TARGET_LIB_vramalloc)

pspvram:
	make TARGET_LIB=$(TARGET_LIB_VRAM) OBJS=$(VRAM_OBJS) $(TARGET_LIB_VRAM)

clean-vramalloc:
	rm -f *.o $(TARGET_LIB_vramalloc)

clean-vram:
	rm -f *.o $(TARGET_LIB_VRAM)

clean: clean-vramalloc clean-vram


PSPSDK=$(shell psp-config --pspsdk-path)
PSPDIR=$(shell psp-config --psp-prefix)
include $(PSPSDK)/lib/build.mak

install: pspvramalloc pspvram
	@cp -v $(TARGET_LIB_VRAM) $(TARGET_LIB_vramalloc) $(PSPDIR)/lib
	@cp -v *.h $(PSPDIR)/include
	@echo "Done."

clobber:
	rm -f *.o *.a

