#######################################################################
#                                                                     #
#                         Applied Type System                         #
#                                                                     #
#                              Hongwei Xi                             #
#                                                                     #
#######################################################################

#
# ATS/Postiats - Unleashing the Potential of Types!
# Copyright (C) 2011-20?? Hongwei Xi, ATS Trustworthy Software
# All rights reserved
#
# ATS is  free software;  you can redistribute it and/or modify it under
# the  terms of the  GNU General Public License as published by the Free
# Software Foundation; either version 2.1, or (at your option) any later
# version.
# 
# ATS is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
# for more details.
# 
# You  should  have  received  a  copy of the GNU General Public License
# along  with  ATS;  see the  file COPYING.  If not, please write to the
# Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
# 02110-1301, USA.
#

######
#
# Author: Hongwei Xi (hwxi AT cs DOT bu DOT edu)
# Start Time: July, 2011
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

ATSGCFLAG=
ATSGCFLAG=-D_ATS_GCATS

PATSCCFLAGS=-g
PATSCCFLAGS=-g -O
PATSCCFLAGS=-g -O2

######

SOURCES := \
  atsdoc_translate.sats \
  atsdoc_translate.dats \
  atsdoc_translate_error.dats \
  atsdoc_translate_item.dats \

SOURCESsta := $(filter %.sats, $(SOURCES))
SOURCESdyn := $(filter %.dats, $(SOURCES))

OBJECTS := $(SOURCES)
OBJECTS := $(patsubst %.sats, %_sats.o, $(OBJECTS))
OBJECTS := $(patsubst %.dats, %_dats.o, $(OBJECTS))

######

all:: atsdoc clean

######

atsdoc: atsdoc_main_dats.o $(OBJECTS)
	$(PATSCC) $(ATSGCFLAG) $(PATSCCFLAGS) -o atsdoc atsdoc_main_dats.o $(OBJECTS) -latsdoc

######

%_sats.o: %.sats
	$(PATSCC) $(PATSCCFLAGS) -c $<

%_dats.o: %.dats
	$(PATSCC) $(PATSCCFLAGS) -c $<

######

#
# HX: '-o .depend' means appending instead of overwriting
#
# depend::
#	$(RMF) .depend
#	$(ATSOPT) -o .depend -dep1 -s $(SOURCESsta) -d $(SOURCESdyn)
#	$(ATSOPT) -o .depend -dep1 -d atsdoc_main.dats
#include .depend
#

######

RMF=rm -f
WCL=wc -l

######

srclines:: ; $(WCL) $(SOURCES)

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

cleanall:: clean
cleanall:: ; $(RMF) atsdoc

###### end of [Makefile] ######
