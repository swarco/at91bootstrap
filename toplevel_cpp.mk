# Copyright (C) 2006 Microchip Technology Inc. and its subsidiaries
#
# SPDX-License-Identifier: MIT

CPPFLAGS += \
	-DIMG_ADDRESS=$(IMG_ADDRESS)	\
	-DIMG_SIZE=$(IMG_SIZE)		\
	-DJUMP_ADDR=$(JUMP_ADDR)	\
	-DOF_OFFSET=$(OF_OFFSET)	\
	-DOF_ADDRESS=$(OF_ADDRESS)	\
	-DCMDLINE_FILE="\"$(LINUX_KERNEL_ARG_STRING_FILE)\""	\
	-DTOP_OF_MEMORY=$(TOP_OF_MEMORY)	\
	-DMACH_TYPE=$(MACH_TYPE)		\

ifeq ($(CONFIG_OVERRIDE_CMDLINE), y)
CPPFLAGS += -DCMDLINE="$(LINUX_KERNEL_ARG_STRING)"
else
CPPFLAGS += -DCMDLINE="\"$(LINUX_KERNEL_ARG_STRING)\""
endif

ASFLAGS += -DJUMP_ADDR=$(JUMP_ADDR)		\
	-DTOP_OF_MEMORY=$(TOP_OF_MEMORY)	\
	-DMACH_TYPE=$(MACH_TYPE)		\

ASFLAGS += -DLINK_ADDR=$(CONFIG_LINK_ADDR)

ifneq ($(IMAGE_NAME),)
CPPFLAGS += -DIMAGE_NAME="\"$(IMAGE_NAME)\""
endif

ifeq ($(CONFIG_OCMS_STATIC), y)
CPPFLAGS += -DCONFIG_OCMS_STATIC
endif

ifeq ($(CONFIG_DEBUG),y)
CPPFLAGS += -DCONFIG_DEBUG
endif

ifeq ($(CONFIG_HW_DISPLAY_BANNER),y)
BANNER:="$(CONFIG_HW_BANNER)"
CPPFLAGS += -DBANNER="$(BANNER)"
endif

ifeq ($(CONFIG_CRYSTAL_12_000MHZ),y)
CPPFLAGS += -DBOARD_MAINOSC=12000000
endif

ifeq ($(CONFIG_CRYSTAL_24_000MHZ),y)
CPPFLAGS += -DBOARD_MAINOSC=24000000
endif

ifeq ($(CONFIG_LOAD_OPTEE),y)
CPPFLAGS += \
	-DOPTEE_IMG_ADDRESS=$(OPTEE_IMG_ADDRESS)	\
	-DOPTEE_IMG_SIZE=$(OPTEE_IMG_SIZE)		\
	-DOPTEE_JUMP_ADDR=$(OPTEE_JUMP_ADDR)		\

ASFLAGS += -DOPTEE_JUMP_ADDR=$(OPTEE_JUMP_ADDR)
endif
