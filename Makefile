#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 0.1.9
# Alexey Potehin <gnuplanet@gmail.com>, http://www.gnuplanet.ru/doc/cv
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
PROG_URL            := https://github.com/progman/libhash.git
PROG_NAME           := hash
PROG_VERSION        := 0.0.1
PROG_TYPE           := exe

OUT_DIR             := bin
C_LIST              := md5.c sha1.c sha256.c sha512.c
CPP_LIST            := crc16.cpp crc32.cpp md5.cpp sha1.cpp sha256.cpp sha512.cpp hash.cpp
HEADER_LIST         := crc16.hpp crc32.hpp md5.h md5.hpp sha1.h sha1.hpp sha256.h sha256.hpp sha512.h sha512.hpp

CFLAGS              :=
CPPFLAGS            :=
LFLAGS              :=
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
CC                  ?= gcc
CXX                 ?= g++
LN                  ?= g++
STRIP               := strip --strip-unneeded -R .comment -R .GCC.command.line -R .note.gnu.gold-version
AR                  := ar rsc
RM                  := rm -rf
MKDIR               := mkdir
REF                 := ln -sf
EXE                 :=
DLL                 := .so
LIB                 := .a
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
FLAGS               := -pedantic -Wall -Wextra -Wlong-long -Wunused -pipe -march=native -mtune=native -I./

FLAGS_DBG           := $(FLAGS) -O0 -g3 -ggdb -pg -fmax-errors=3 -fstack-protector-all
FLAGS_REL           := $(FLAGS) -O3 -g0           -fmax-errors=3 -funroll-all-loops
FLAGS_TST           := $(FLAGS) -O3 -g0                          --analyze -fsanitize=address -fsanitize=bounds

CFLAGS_DBG          := $(FLAGS_DBG) $(CFLAGS)   -std=c99
CFLAGS_REL          := $(FLAGS_REL) $(CFLAGS)   -std=c99
CFLAGS_TST          := $(FLAGS_TST) $(CFLAGS)   -std=c99

CFLAGS_x32DBG.EXE   := $(CFLAGS_DBG)            -m32
CFLAGS_x32REL.EXE   := $(CFLAGS_REL)            -m32
CFLAGS_x32TST.EXE   := $(CFLAGS_TST)            -m32
CFLAGS_x64DBG.EXE   := $(CFLAGS_DBG)            -m64
CFLAGS_x64REL.EXE   := $(CFLAGS_REL)            -m64
CFLAGS_x64TST.EXE   := $(CFLAGS_TST)            -m64

CFLAGS_x32DBG.DLL   := $(CFLAGS_x32DBG.EXE)     -fPIC
CFLAGS_x32REL.DLL   := $(CFLAGS_x32REL.EXE)     -fPIC
CFLAGS_x64DBG.DLL   := $(CFLAGS_x64DBG.EXE)     -fPIC
CFLAGS_x64REL.DLL   := $(CFLAGS_x64REL.EXE)     -fPIC

CPPFLAGS_DBG        := $(FLAGS_DBG) $(CPPFLAGS) -std=c++11
CPPFLAGS_REL        := $(FLAGS_REL) $(CPPFLAGS) -std=c++11
CPPFLAGS_TST        := $(FLAGS_TST) $(CPPFLAGS) -std=c++11

CPPFLAGS_x32DBG.EXE := $(CPPFLAGS_DBG)          -m32
CPPFLAGS_x32REL.EXE := $(CPPFLAGS_REL)          -m32
CPPFLAGS_x32TST.EXE := $(CPPFLAGS_TST)          -m32
CPPFLAGS_x64DBG.EXE := $(CPPFLAGS_DBG)          -m64
CPPFLAGS_x64REL.EXE := $(CPPFLAGS_REL)          -m64
CPPFLAGS_x64TST.EXE := $(CPPFLAGS_TST)          -m64

CPPFLAGS_x32DBG.DLL := $(CPPFLAGS_x32DBG.EXE)   -fPIC
CPPFLAGS_x32REL.DLL := $(CPPFLAGS_x32REL.EXE)   -fPIC
CPPFLAGS_x64DBG.DLL := $(CPPFLAGS_x64DBG.EXE)   -fPIC
CPPFLAGS_x64REL.DLL := $(CPPFLAGS_x64REL.EXE)   -fPIC
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
LFLAGS_DBG          := $(LFLAGS) -g3 -Wl,--gc-sections -Wl,--as-needed -ggdb
LFLAGS_REL          := $(LFLAGS) -g0 -Wl,--gc-sections -Wl,--as-needed       -s

LFLAGS_x32DBG.EXE   := $(LFLAGS_DBG)    -m32
LFLAGS_x32REL.EXE   := $(LFLAGS_REL)    -m32
LFLAGS_x64DBG.EXE   := $(LFLAGS_DBG)    -m64
LFLAGS_x64REL.EXE   := $(LFLAGS_REL)    -m64

LFLAGS_x32DBG.DLL   := $(LFLAGS_x32DBG.EXE) -nostartfiles -shared
LFLAGS_x32REL.DLL   := $(LFLAGS_x32REL.EXE) -nostartfiles -shared
LFLAGS_x64DBG.DLL   := $(LFLAGS_x64DBG.EXE) -nostartfiles -shared
LFLAGS_x64REL.DLL   := $(LFLAGS_x64REL.EXE) -nostartfiles -shared
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
VPATH               := $(dir $(C_LIST) $(CPP_LIST))

O_x32DBG.EXE_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32dbg.exe.o,   $(basename $(C_LIST)))))
O_x32REL.EXE_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32rel.exe.o,   $(basename $(C_LIST)))))
O_x32TST.EXE_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32tst.exe.o,   $(basename $(C_LIST)))))
O_x64DBG.EXE_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64dbg.exe.o,   $(basename $(C_LIST)))))
O_x64REL.EXE_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64rel.exe.o,   $(basename $(C_LIST)))))
O_x64TST.EXE_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64tst.exe.o,   $(basename $(C_LIST)))))

O_x32DBG.DLL_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32dbg.dll.o,   $(basename $(C_LIST)))))
O_x32REL.DLL_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32rel.dll.o,   $(basename $(C_LIST)))))
O_x64DBG.DLL_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64dbg.dll.o,   $(basename $(C_LIST)))))
O_x64REL.DLL_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64rel.dll.o,   $(basename $(C_LIST)))))

O_x32DBG.LIB_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32dbg.lib.o,   $(basename $(C_LIST)))))
O_x32REL.LIB_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32rel.lib.o,   $(basename $(C_LIST)))))
O_x64DBG.LIB_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64dbg.lib.o,   $(basename $(C_LIST)))))
O_x64REL.LIB_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64rel.lib.o,   $(basename $(C_LIST)))))

OPP_x32DBG.EXE_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32dbg.exe.opp, $(basename $(CPP_LIST)))))
OPP_x32REL.EXE_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32rel.exe.opp, $(basename $(CPP_LIST)))))
OPP_x32TST.EXE_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32tst.exe.opp, $(basename $(CPP_LIST)))))
OPP_x64DBG.EXE_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64dbg.exe.opp, $(basename $(CPP_LIST)))))
OPP_x64REL.EXE_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64rel.exe.opp, $(basename $(CPP_LIST)))))
OPP_x64TST.EXE_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64tst.exe.opp, $(basename $(CPP_LIST)))))

OPP_x32DBG.DLL_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32dbg.dll.opp, $(basename $(CPP_LIST)))))
OPP_x32REL.DLL_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32rel.dll.opp, $(basename $(CPP_LIST)))))
OPP_x64DBG.DLL_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64dbg.dll.opp, $(basename $(CPP_LIST)))))
OPP_x64REL.DLL_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64rel.dll.opp, $(basename $(CPP_LIST)))))

OPP_x32DBG.LIB_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32dbg.lib.opp, $(basename $(CPP_LIST)))))
OPP_x32REL.LIB_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32rel.lib.opp, $(basename $(CPP_LIST)))))
OPP_x64DBG.LIB_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64dbg.lib.opp, $(basename $(CPP_LIST)))))
OPP_x64REL.LIB_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64rel.lib.opp, $(basename $(CPP_LIST)))))
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: help
help:
	@echo "use make [x32 | x32dbg | x32test | x64 | x64dbg | x64test | clean]";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: clean
clean:
	@echo "clean";
	@if [ -e $(OUT_DIR) ]; then \
		rm -rf $(OUT_DIR); \
	fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: $(OUT_DIR)
$(OUT_DIR) :
	@if [ ! -e $(OUT_DIR) ]; then \
		(mkdir $(OUT_DIR);) \
	fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/%.x32dbg.exe.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CC)  $< -c $(CFLAGS_x32DBG.EXE)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x32dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x32dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x32rel.exe.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CC)  $< -c $(CFLAGS_x32REL.EXE)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x32"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x32-$(PROG_VERSION)"'
$(OUT_DIR)/%.x32tst.exe.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	@clang  $< -c $(CFLAGS_x32TST.EXE)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x32"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x32-$(PROG_VERSION)"'
$(OUT_DIR)/%.x64dbg.exe.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CC)  $< -c $(CFLAGS_x64DBG.EXE)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x64dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x64dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x64rel.exe.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CC)  $< -c $(CFLAGS_x64REL.EXE)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x64"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x64-$(PROG_VERSION)"'
$(OUT_DIR)/%.x64tst.exe.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	@clang  $< -c $(CFLAGS_x64TST.EXE)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x64"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x64-$(PROG_VERSION)"'

$(OUT_DIR)/%.x32dbg.dll.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CC)  $< -c $(CFLAGS_x32DBG.DLL)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x32dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x32dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x32rel.dll.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CC)  $< -c $(CFLAGS_x32REL.DLL)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x32"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x32-$(PROG_VERSION)"'
$(OUT_DIR)/%.x64dbg.dll.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CC)  $< -c $(CFLAGS_x64DBG.DLL)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x64dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x64dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x64rel.dll.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CC)  $< -c $(CFLAGS_x64REL.DLL)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x64"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x64-$(PROG_VERSION)"'

$(OUT_DIR)/%.x32dbg.lib.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CC)  $< -c $(CFLAGS_x32DBG.EXE)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x32dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x32dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x32rel.lib.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CC)  $< -c $(CFLAGS_x32REL.EXE)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x32"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x32-$(PROG_VERSION)"'
$(OUT_DIR)/%.x64dbg.lib.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CC)  $< -c $(CFLAGS_x64DBG.EXE)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x64dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x64dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x64rel.lib.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CC)  $< -c $(CFLAGS_x64REL.EXE)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x64"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x64-$(PROG_VERSION)"'
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/%.x32dbg.exe.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CXX) $< -c $(CPPFLAGS_x32DBG.EXE) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x32dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x32dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x32rel.exe.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CXX) $< -c $(CPPFLAGS_x32REL.EXE) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x32"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x32-$(PROG_VERSION)"'
$(OUT_DIR)/%.x32tst.exe.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	@clang  $< -c $(CPPFLAGS_x32TST.EXE) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x32"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x32-$(PROG_VERSION)"'
$(OUT_DIR)/%.x64dbg.exe.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CXX) $< -c $(CPPFLAGS_x64DBG.EXE) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x64dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x64dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x64rel.exe.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CXX) $< -c $(CPPFLAGS_x64REL.EXE) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x64"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x64-$(PROG_VERSION)"'
$(OUT_DIR)/%.x64tst.exe.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	@clang  $< -c $(CPPFLAGS_x64TST.EXE) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x64"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x64-$(PROG_VERSION)"'

$(OUT_DIR)/%.x32dbg.dll.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CXX) $< -c $(CPPFLAGS_x32DBG.DLL) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x32dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x32dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x32rel.dll.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CXX) $< -c $(CPPFLAGS_x32REL.DLL) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x32"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x32-$(PROG_VERSION)"'
$(OUT_DIR)/%.x64dbg.dll.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CXX) $< -c $(CPPFLAGS_x64DBG.DLL) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x64dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x64dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x64rel.dll.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CXX) $< -c $(CPPFLAGS_x64REL.DLL) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x64"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x64-$(PROG_VERSION)"'

$(OUT_DIR)/%.x32dbg.lib.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CXX) $< -c $(CPPFLAGS_x32DBG.EXE) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x32dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x32dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x32rel.lib.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CXX) $< -c $(CPPFLAGS_x32REL.EXE) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x32"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x32-$(PROG_VERSION)"'
$(OUT_DIR)/%.x64dbg.lib.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CXX) $< -c $(CPPFLAGS_x64DBG.EXE) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x64dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x64dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x64rel.lib.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	@$(CXX) $< -c $(CPPFLAGS_x64REL.EXE) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TYPE="$(PROG_TYPE)"' -D'PROG_TARGET="x64"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x64-$(PROG_VERSION)"'
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION)$(EXE) : $(O_x32DBG.EXE_LIST) $(OPP_x32DBG.EXE_LIST)
	@$(LN) $(O_x32DBG.EXE_LIST) $(OPP_x32DBG.EXE_LIST) $(LFLAGS_x32DBG.EXE) -o $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION)$(EXE)
	@objdump -Dslx $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION) > $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION).dump;
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION)$(DLL) : $(O_x32DBG.DLL_LIST) $(OPP_x32DBG.DLL_LIST)
	@$(LN) $(O_x32DBG.DLL_LIST) $(OPP_x32DBG.DLL_LIST) $(LFLAGS_x32DBG.DLL) -o $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION)$(DLL)
	@$(STRIP) $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION)$(DLL)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION)$(LIB) : $(O_x32DBG.LIB_LIST) $(OPP_x32DBG.LIB_LIST)
	@$(AR) $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION)$(LIB) $(O_x32DBG.LIB_LIST) $(OPP_x32DBG.LIB_LIST)
	@$(STRIP) $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION)$(LIB)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)$(EXE)    : $(O_x32REL.EXE_LIST) $(OPP_x32REL.EXE_LIST)
	@$(LN) $(O_x32REL.EXE_LIST) $(OPP_x32REL.EXE_LIST) $(LFLAGS_x32REL.EXE) -o $(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)$(EXE)
	@$(STRIP) $(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)$(EXE)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)$(DLL)    : $(O_x32REL.DLL_LIST) $(OPP_x32REL.DLL_LIST)
	@$(LN) $(O_x32REL.DLL_LIST) $(OPP_x32REL.DLL_LIST) $(LFLAGS_x32REL.DLL) -o $(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)$(DLL)
	@$(STRIP) $(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)$(DLL)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)$(LIB)    : $(O_x32REL.LIB_LIST) $(OPP_x32REL.LIB_LIST)
	@$(AR) $(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)$(LIB) $(O_x32REL.LIB_LIST) $(OPP_x32REL.LIB_LIST)
	@$(STRIP) $(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)$(LIB)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION)$(EXE) : $(O_x64DBG.EXE_LIST) $(OPP_x64DBG.EXE_LIST)
	@$(LN) $(O_x64DBG.EXE_LIST) $(OPP_x64DBG.EXE_LIST) $(LFLAGS_x64DBG.EXE) -o $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION)$(EXE)
	@objdump -Dslx $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION) > $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION).dump;
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION)$(DLL) : $(O_x64DBG.DLL_LIST) $(OPP_x64DBG.DLL_LIST)
	@$(LN) $(O_x64DBG.DLL_LIST) $(OPP_x64DBG.DLL_LIST) $(LFLAGS_x64DBG.DLL) -o $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION)$(DLL)
	@$(STRIP) $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION)$(DLL)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION)$(LIB) : $(O_x64DBG.LIB_LIST) $(OPP_x64DBG.LIB_LIST)
	@$(AR) $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION)$(LIB) $(O_x64DBG.LIB_LIST) $(OPP_x64DBG.LIB_LIST)
	@$(STRIP) $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION)$(LIB)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)$(EXE)    : $(O_x64REL.EXE_LIST) $(OPP_x64REL.EXE_LIST)
	@$(LN) $(O_x64REL.EXE_LIST) $(OPP_x64REL.EXE_LIST) $(LFLAGS_x64REL.EXE) -o $(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)$(EXE)
	@$(STRIP) $(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)$(EXE)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)$(DLL)    : $(O_x64REL.DLL_LIST) $(OPP_x64REL.DLL_LIST)
	@$(LN) $(O_x64REL.DLL_LIST) $(OPP_x64REL.DLL_LIST) $(LFLAGS_x64REL.DLL) -o $(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)$(DLL)
	@$(STRIP) $(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)$(DLL)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)$(LIB)    : $(O_x64REL.LIB_LIST) $(OPP_x64REL.LIB_LIST)
	@$(AR) $(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)$(LIB) $(O_x64REL.LIB_LIST) $(OPP_x64REL.LIB_LIST)
	@$(STRIP) $(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)$(LIB)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x32dbg.exe
x32dbg.exe: $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION)$(EXE)
	@$(REF) $(PROG_NAME)-x32dbg-$(PROG_VERSION)$(EXE) $(OUT_DIR)/$(PROG_NAME)$(EXE)
	@echo "ready $(PROG_NAME)-x32dbg-$(PROG_VERSION)$(EXE)";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x32dbg.dll
x32dbg.dll: $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION)$(DLL)
	@$(REF) $(PROG_NAME)-x32dbg-$(PROG_VERSION)$(DLL) $(OUT_DIR)/$(PROG_NAME)$(DLL)
	@echo "ready $(PROG_NAME)-x32dbg-$(PROG_VERSION)$(DLL)";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x32dbg.lib
x32dbg.lib: $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION)$(LIB)
	@$(REF) $(PROG_NAME)-x32dbg-$(PROG_VERSION)$(LIB) $(OUT_DIR)/$(PROG_NAME)$(LIB)
	@echo "ready $(PROG_NAME)-x32dbg-$(PROG_VERSION)$(LIB)";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x32dbg
x32dbg:
	@if [ "$(PROG_TYPE)" = "exe" ]; then \
		${MAKE} -s x32dbg.exe; \
	fi

	@if [ "$(PROG_TYPE)" = "dll" ]; then \
		${MAKE} -s x32dbg.dll; \
	fi

	@if [ "$(PROG_TYPE)" = "lib" ]; then \
		${MAKE} -s x32dbg.lib; \
	fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x32.exe
x32.exe:    $(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)$(EXE)
	@$(REF) $(PROG_NAME)-x32-$(PROG_VERSION)$(EXE) $(OUT_DIR)/$(PROG_NAME)$(EXE)
	@echo "ready $(PROG_NAME)-x32-$(PROG_VERSION)$(EXE)";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x32.dll
x32.dll:    $(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)$(DLL)
	@$(REF) $(PROG_NAME)-x32-$(PROG_VERSION)$(DLL) $(OUT_DIR)/$(PROG_NAME)$(DLL)
	@echo "ready $(PROG_NAME)-x32-$(PROG_VERSION)$(DLL)";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x32.lib
x32.lib:    $(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)$(LIB)
	@$(REF) $(PROG_NAME)-x32-$(PROG_VERSION)$(LIB) $(OUT_DIR)/$(PROG_NAME)$(LIB)
	@echo "ready $(PROG_NAME)-x32-$(PROG_VERSION)$(LIB)";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x32
x32:
	@if [ "$(PROG_TYPE)" = "exe" ]; then \
		${MAKE} -s x32.exe; \
	fi

	@if [ "$(PROG_TYPE)" = "dll" ]; then \
		${MAKE} -s x32.dll; \
	fi

	@if [ "$(PROG_TYPE)" = "lib" ]; then \
		${MAKE} -s x32.lib; \
	fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x32test
x32test:    $(O_x32TST.EXE_LIST) $(OPP_x32TST.EXE_LIST)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x64dbg.exe
x64dbg.exe: $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION)$(EXE)
	@$(REF) $(PROG_NAME)-x64dbg-$(PROG_VERSION)$(EXE) $(OUT_DIR)/$(PROG_NAME)$(EXE)
	@echo "ready $(PROG_NAME)-x64dbg-$(PROG_VERSION)$(EXE)";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x64dbg.dll
x64dbg.dll: $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION)$(DLL)
	@$(REF) $(PROG_NAME)-x64dbg-$(PROG_VERSION)$(DLL) $(OUT_DIR)/$(PROG_NAME)$(DLL)
	@echo "ready $(PROG_NAME)-x64dbg-$(PROG_VERSION)$(DLL)";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x64dbg.lib
x64dbg.lib: $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION)$(LIB)
	@$(REF) $(PROG_NAME)-x64dbg-$(PROG_VERSION)$(LIB) $(OUT_DIR)/$(PROG_NAME)$(LIB)
	@echo "ready $(PROG_NAME)-x64dbg-$(PROG_VERSION)$(LIB)";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x64dbg
x64dbg:
	@if [ "$(PROG_TYPE)" = "exe" ]; then \
		${MAKE} -s x64dbg.exe; \
	fi

	@if [ "$(PROG_TYPE)" = "dll" ]; then \
		${MAKE} -s x64dbg.dll; \
	fi

	@if [ "$(PROG_TYPE)" = "lib" ]; then \
		${MAKE} -s x64dbg.lib; \
	fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x64.exe
x64.exe:    $(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)$(EXE)
	@$(REF) $(PROG_NAME)-x64-$(PROG_VERSION)$(EXE) $(OUT_DIR)/$(PROG_NAME)$(EXE)
	@echo "ready $(PROG_NAME)-x64-$(PROG_VERSION)$(EXE)";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x64.dll
x64.dll:    $(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)$(DLL)
	@$(REF) $(PROG_NAME)-x64-$(PROG_VERSION)$(DLL) $(OUT_DIR)/$(PROG_NAME)$(DLL)
	@echo "ready $(PROG_NAME)-x64-$(PROG_VERSION)$(DLL)";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x64.lib
x64.lib:    $(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)$(LIB)
	@$(REF) $(PROG_NAME)-x64-$(PROG_VERSION)$(LIB) $(OUT_DIR)/$(PROG_NAME)$(LIB)
	@echo "ready $(PROG_NAME)-x64-$(PROG_VERSION)$(LIB)";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x64
x64:
	@if [ "$(PROG_TYPE)" = "exe" ]; then \
		${MAKE} -s x64.exe; \
	fi

	@if [ "$(PROG_TYPE)" = "dll" ]; then \
		${MAKE} -s x64.dll; \
	fi

	@if [ "$(PROG_TYPE)" = "lib" ]; then \
		${MAKE} -s x64.lib; \
	fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x64test
x64test:    $(O_x64TST.EXE_LIST) $(OPP_x64TST.EXE_LIST)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
