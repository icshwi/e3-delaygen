#
#  Copyright (c) 2018 - Present  European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
# 
# Author  : Jeong Han Lee
# email   : jeonghan.lee@gmail.com
# Date    : Saturday, September 15 13:36:00 CEST 2018
# version : 0.0.1

## The following lines are mandatory, please don't change them.
where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(E3_REQUIRE_TOOLS)/driver.makefile
include $(E3_REQUIRE_CONFIG)/DECOUPLE_FLAGS

# If one would like to use the module dependency restrictly,
# one should look at other modules makefile to add more
# In most case, one should ignore the following lines:

ifneq ($(strip $(ASYN_DEP_VERSION)),)
asyn_VERSION=$(ASYN_DEP_VERSION)
endif


ifneq ($(strip $(CALC_DEP_VERSION)),)
calc_VERSION=$(CALC_DEP_VERSION)
endif



## Exclude linux-ppc64e6500
##EXCLUDE_ARCHS = linux-ppc64e6500


APP:=delaygenApp
APPDB:=$(APP)/Db
APPSRC:=$(APP)/src



USR_INCLUDES += -I$(where_am_I)$(APPSRC)


SOURCES += $(APPSRC)/nigpibInterpose.c
SOURCES += $(APPSRC)/drvAsynDG645.cpp
SOURCES += $(APPSRC)/drvAsynColby.cpp
SOURCES += $(APPSRC)/devDG535.c
SOURCES += $(APPSRC)/drvAsynCoherentSDG.cpp


DBDS += $(APPSRC)/delaygenSupport.dbd



TEMPLATES += $(wildcard $(APPDB)/*.db)
TEMPLATES += $(wildcard $(APPDB)/*.proto*)


db: 

.PHONY: db 

vlibs:

.PHONY: vlibs
