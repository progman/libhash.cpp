#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 0.1.1
# Alexey Potehin <gnuplanet@gmail.com>, http://www.gnuplanet.ru/doc/cv
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
PROG_NAME          := hash
PROG_VERSION       := 0.0.1
PROG_URL           := https://github.com/progman/libhash.git

OUT_DIR            := bin
C_LIST             := md5.c sha1.c sha256.c sha512.c
CPP_LIST           := crc16.cpp crc32.cpp md5.cpp sha1.cpp sha256.cpp sha512.cpp hash.cpp
HEADER_LIST        := crc16.hpp crc32.hpp md5.h md5.hpp sha1.h sha1.hpp sha256.h sha256.hpp sha512.h sha512.hpp

CFLAGS             :=
CPPFLAGS           :=
LFLAGS             :=
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
CC                 ?= gcc
CXX                ?= g++
LN                 ?= g++
STRIP              ?= strip --strip-unneeded -R .comment -R .GCC.command.line -R .note.gnu.gold-version
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
FLAGS              := -pedantic -Wall -Wextra -Wlong-long -Wunused -pipe -march=native -mtune=native -I./

FLAGS_DBG          := $(FLAGS) -O0 -g3 -ggdb -pg -fmax-errors=3 -fstack-protector-all
FLAGS_REL          := $(FLAGS) -O3 -g0           -fmax-errors=3 -funroll-all-loops
FLAGS_TST          := $(FLAGS) -O3 -g0                          --analyze -fsanitize=address -fsanitize=bounds

CFLAGS_DBG         := $(FLAGS_DBG) $(CFLAGS)   -std=c99
CFLAGS_REL         := $(FLAGS_REL) $(CFLAGS)   -std=c99
CFLAGS_TST         := $(FLAGS_TST) $(CFLAGS)   -std=c99

CFLAGS_x32DBG      := $(CFLAGS_DBG)            -m32
CFLAGS_x32REL      := $(CFLAGS_REL)            -m32
CFLAGS_x32TST      := $(CFLAGS_TST)            -m32
CFLAGS_x64DBG      := $(CFLAGS_DBG)            -m64
CFLAGS_x64REL      := $(CFLAGS_REL)            -m64
CFLAGS_x64TST      := $(CFLAGS_TST)            -m64

CFLAGS_x32DBG.SO   := $(CFLAGS_x32DBG)         -fPIC
CFLAGS_x32REL.SO   := $(CFLAGS_x32REL)         -fPIC
CFLAGS_x64DBG.SO   := $(CFLAGS_x64DBG)         -fPIC
CFLAGS_x64REL.SO   := $(CFLAGS_x64REL)         -fPIC

CPPFLAGS_DBG       := $(FLAGS_DBG) $(CPPFLAGS) -std=c++11
CPPFLAGS_REL       := $(FLAGS_REL) $(CPPFLAGS) -std=c++11
CPPFLAGS_TST       := $(FLAGS_TST) $(CPPFLAGS) -std=c++11

CPPFLAGS_x32DBG    := $(CPPFLAGS_DBG)          -m32
CPPFLAGS_x32REL    := $(CPPFLAGS_REL)          -m32
CPPFLAGS_x32TST    := $(CPPFLAGS_TST)          -m32
CPPFLAGS_x64DBG    := $(CPPFLAGS_DBG)          -m64
CPPFLAGS_x64REL    := $(CPPFLAGS_REL)          -m64
CPPFLAGS_x64TST    := $(CPPFLAGS_TST)          -m64

CPPFLAGS_x32DBG.SO := $(CPPFLAGS_x32DBG)       -fPIC
CPPFLAGS_x32REL.SO := $(CPPFLAGS_x32REL)       -fPIC
CPPFLAGS_x64DBG.SO := $(CPPFLAGS_x64DBG)       -fPIC
CPPFLAGS_x64REL.SO := $(CPPFLAGS_x64REL)       -fPIC
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
LFLAGS_DBG         := $(LFLAGS) -g3 -Wl,--gc-sections -Wl,--as-needed -ggdb
LFLAGS_REL         := $(LFLAGS) -g0 -Wl,--gc-sections -Wl,--as-needed       -s

LFLAGS_x32DBG      := $(LFLAGS_DBG)    -m32
LFLAGS_x32REL      := $(LFLAGS_REL)    -m32
LFLAGS_x64DBG      := $(LFLAGS_DBG)    -m64
LFLAGS_x64REL      := $(LFLAGS_REL)    -m64

LFLAGS_x32DBG.SO   := $(LFLAGS_x32DBG) -nostartfiles -shared
LFLAGS_x32REL.SO   := $(LFLAGS_x32REL) -nostartfiles -shared
LFLAGS_x64DBG.SO   := $(LFLAGS_x64DBG) -nostartfiles -shared
LFLAGS_x64REL.SO   := $(LFLAGS_x64REL) -nostartfiles -shared
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
VPATH              := $(dir $(C_LIST) $(CPP_LIST))

O_x32DBG_LIST      := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32dbg.o,      $(basename $(C_LIST)))))
O_x32REL_LIST      := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32.o,         $(basename $(C_LIST)))))
O_x32TST_LIST      := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32tst.o,      $(basename $(C_LIST)))))
O_x64DBG_LIST      := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64dbg.o,      $(basename $(C_LIST)))))
O_x64REL_LIST      := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64.o,         $(basename $(C_LIST)))))
O_x64TST_LIST      := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64tst.o,      $(basename $(C_LIST)))))

O_x32DBG.SO_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32dbg.so.o,   $(basename $(C_LIST)))))
O_x32REL.SO_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32.so.o,      $(basename $(C_LIST)))))
O_x64DBG.SO_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64dbg.so.o,   $(basename $(C_LIST)))))
O_x64REL.SO_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64.so.o,      $(basename $(C_LIST)))))

OPP_x32DBG_LIST    := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32dbg.opp,    $(basename $(CPP_LIST)))))
OPP_x32REL_LIST    := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32.opp,       $(basename $(CPP_LIST)))))
OPP_x32TST_LIST    := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32tst.opp,    $(basename $(CPP_LIST)))))
OPP_x64DBG_LIST    := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64dbg.opp,    $(basename $(CPP_LIST)))))
OPP_x64REL_LIST    := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64.opp,       $(basename $(CPP_LIST)))))
OPP_x64TST_LIST    := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64tst.opp,    $(basename $(CPP_LIST)))))

OPP_x32DBG.SO_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32dbg.so.opp, $(basename $(CPP_LIST)))))
OPP_x32REL.SO_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32.so.opp,    $(basename $(CPP_LIST)))))
OPP_x64DBG.SO_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64dbg.so.opp, $(basename $(CPP_LIST)))))
OPP_x64REL.SO_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64.so.opp,    $(basename $(CPP_LIST)))))
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: help
help:
	@echo "use make [x32 | x32.so | x32dbg | x32dbg.so | x32test | x64 | x64.so | x64dbg | x64dbg.so | x64test | clean]";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: clean
clean:
	@echo "clean";
	@if [ -e $(OUT_DIR) ]; then rm -rf $(OUT_DIR); fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: $(OUT_DIR)
$(OUT_DIR) :
	@if [ ! -e $(OUT_DIR) ]; then (mkdir $(OUT_DIR);) fi
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/%.x32dbg.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	$(CC)  $< -c $(CFLAGS_x32DBG)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x32dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x32dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x32.o      : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	$(CC)  $< -c $(CFLAGS_x32REL)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x32"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x32-$(PROG_VERSION)"'
$(OUT_DIR)/%.x32tst.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	clang  $< -c $(CFLAGS_x32TST)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x32"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x32-$(PROG_VERSION)"'
$(OUT_DIR)/%.x64dbg.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	$(CC)  $< -c $(CFLAGS_x64DBG)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x64dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x64dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x64.o      : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	$(CC)  $< -c $(CFLAGS_x64REL)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x64"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x64-$(PROG_VERSION)"'
$(OUT_DIR)/%.x64tst.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	clang  $< -c $(CFLAGS_x64TST)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x64"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x64-$(PROG_VERSION)"'

$(OUT_DIR)/%.x32dbg.so.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	$(CC)  $< -c $(CFLAGS_x32DBG.SO)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x32dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x32dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x32.so.o      : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	$(CC)  $< -c $(CFLAGS_x32REL.SO)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x32"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x32-$(PROG_VERSION)"'
$(OUT_DIR)/%.x64dbg.so.o   : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	$(CC)  $< -c $(CFLAGS_x64DBG.SO)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x64dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x64dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x64.so.o      : %.c   $(HEADER_LIST) Makefile | $(OUT_DIR)
	$(CC)  $< -c $(CFLAGS_x64REL.SO)   -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x64"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x64-$(PROG_VERSION)"'
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/%.x32dbg.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	$(CXX) $< -c $(CPPFLAGS_x32DBG) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x32dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x32dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x32.opp    : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	$(CXX) $< -c $(CPPFLAGS_x32REL) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x32"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x32-$(PROG_VERSION)"'
$(OUT_DIR)/%.x32tst.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	clang  $< -c $(CPPFLAGS_x32TST) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x32"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x32-$(PROG_VERSION)"'
$(OUT_DIR)/%.x64dbg.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	$(CXX) $< -c $(CPPFLAGS_x64DBG) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x64dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x64dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x64.opp    : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	$(CXX) $< -c $(CPPFLAGS_x64REL) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x64"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x64-$(PROG_VERSION)"'
$(OUT_DIR)/%.x64tst.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	clang  $< -c $(CPPFLAGS_x64TST) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x64"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x64-$(PROG_VERSION)"'

$(OUT_DIR)/%.x32dbg.so.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	$(CXX) $< -c $(CPPFLAGS_x32DBG.SO) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x32dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x32dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x32.so.opp    : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	$(CXX) $< -c $(CPPFLAGS_x32REL.SO) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x32"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x32-$(PROG_VERSION)"'
$(OUT_DIR)/%.x64dbg.so.opp : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	$(CXX) $< -c $(CPPFLAGS_x64DBG.SO) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x64dbg"' -D'PROG_FULL_NAME="$(PROG_NAME)-x64dbg-$(PROG_VERSION)"' -D'FLAG_DEBUG="1"'
$(OUT_DIR)/%.x64.so.opp    : %.cpp $(HEADER_LIST) Makefile | $(OUT_DIR)
	$(CXX) $< -c $(CPPFLAGS_x64REL.SO) -o $(OUT_DIR)/$(notdir $@) -D'PROG_URL="$(PROG_URL)"' -D'PROG_NAME="$(PROG_NAME)"' -D'PROG_VERSION="$(PROG_VERSION)"' -D'PROG_TARGET="x64"'    -D'PROG_FULL_NAME="$(PROG_NAME)-x64-$(PROG_VERSION)"'
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION)    : $(O_x32DBG_LIST) $(OPP_x32DBG_LIST)
	$(LN) $(O_x32DBG_LIST) $(OPP_x32DBG_LIST)       $(LFLAGS_x32DBG) -o $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION)
	objdump -Dslx $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION) > $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION).dump;
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION).so : $(O_x32DBG.SO_LIST) $(OPP_x32DBG.SO_LIST)
	$(LN) $(O_x32DBG.SO_LIST) $(OPP_x32DBG.SO_LIST) $(LFLAGS_x32DBG.SO) -o $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION).so
	$(STRIP) $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION).so
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)       : $(O_x32REL_LIST) $(OPP_x32REL_LIST)
	$(LN) $(O_x32REL_LIST) $(OPP_x32REL_LIST)       $(LFLAGS_x32REL) -o $(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)
	$(STRIP) $(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION).so    : $(O_x32REL.SO_LIST) $(OPP_x32REL.SO_LIST)
	$(LN) $(O_x32REL.SO_LIST) $(OPP_x32REL.SO_LIST) $(LFLAGS_x32REL.SO) -o $(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION).so
	$(STRIP) $(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION).so
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION)    : $(O_x64DBG_LIST) $(OPP_x64DBG_LIST)
	$(LN) $(O_x64DBG_LIST) $(OPP_x64DBG_LIST)       $(LFLAGS_x64DBG)    -o $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION)
	objdump -Dslx $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION) > $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION).dump;
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION).so : $(O_x64DBG.SO_LIST) $(OPP_x64DBG.SO_LIST)
	$(LN) $(O_x64DBG.SO_LIST) $(OPP_x64DBG.SO_LIST) $(LFLAGS_x64DBG.SO) -o $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION).so
	$(STRIP) $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION).so
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)       : $(O_x64REL_LIST) $(OPP_x64REL_LIST)
	$(LN) $(O_x64REL_LIST) $(OPP_x64REL_LIST)       $(LFLAGS_x64REL)    -o $(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)
	$(STRIP) $(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION).so    : $(O_x64REL.SO_LIST) $(OPP_x64REL.SO_LIST)
	$(LN) $(O_x64REL.SO_LIST) $(OPP_x64REL.SO_LIST) $(LFLAGS_x64REL.SO) -o $(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION).so
	$(STRIP) $(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION).so
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x32dbg
x32dbg:  $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION)
	@ln -sf $(PROG_NAME)-x32dbg-$(PROG_VERSION) $(OUT_DIR)/$(PROG_NAME)
	@echo "ready x32dbg";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x32dbg.so
x32dbg.so:  $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION).so
	@ln -sf $(PROG_NAME)-x32dbg-$(PROG_VERSION).so $(OUT_DIR)/$(PROG_NAME).so
	@echo "ready x32dbg.so";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x32
x32:     $(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)
	@ln -sf $(PROG_NAME)-x32-$(PROG_VERSION) $(OUT_DIR)/$(PROG_NAME)
	@echo "ready x32";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x32.so
x32.so:  $(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION).so
	@ln -sf $(PROG_NAME)-x32-$(PROG_VERSION).so $(OUT_DIR)/$(PROG_NAME).so
	@echo "ready x32.so";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x32test
x32test: $(O_x32TST_LIST) $(OPP_x32TST_LIST)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x64dbg
x64dbg:  $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION)
	@ln -sf $(PROG_NAME)-x64dbg-$(PROG_VERSION) $(OUT_DIR)/$(PROG_NAME)
	@echo "ready x64dbg";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x64dbg.so
x64dbg.so:  $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION).so
	@ln -sf $(PROG_NAME)-x64dbg-$(PROG_VERSION).so $(OUT_DIR)/$(PROG_NAME).so
	@echo "ready x64dbg.so";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x64
x64:     $(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)
	@ln -sf $(PROG_NAME)-x64-$(PROG_VERSION) $(OUT_DIR)/$(PROG_NAME)
	@echo "ready x64";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x64.so
x64.so:  $(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION).so
	@ln -sf $(PROG_NAME)-x64-$(PROG_VERSION).so $(OUT_DIR)/$(PROG_NAME).so
	@echo "ready x64.so";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x64test
x64test: $(O_x64TST_LIST) $(OPP_x64TST_LIST)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
