#
# A simple Makefile
#
######
#
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
#
######

all:: atscc2php

######

NODE_MODULES="./node_modules"
NODE_MODULES_p="./../node_modules"
NODE_MODULES_pp="./../../node_modules"

######
#
CFLAGS=
#
CFLAGS+=-I$(NODE_MODULES)
CFLAGS+=-I$(NODE_MODULES_P)
CFLAGS+=-DATS_MEMALLOC_LIBC
#
######
#
SOURCES_CATS= \
CATS/atscc2php_main_dats.c \
CATS/atscc2php_emit_dats.c \
CATS/atscc2php_emit2_dats.c \
CATS/catsparse_sats.c CATS/catsparse_all_dats.c 
#
######

atscc2php:: ; $(PATSCC) -O2 -o $@ $(CFLAGS) $(SOURCES_CATS)

###### end of [Makefile] ######
