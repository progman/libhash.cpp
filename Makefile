#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
# 0.0.9
# Alexey Potehin <gnuplanet@gmail.com>, http://www.gnuplanet.ru/doc/cv
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
PROG_NAME       := hash
PROG_VERSION    := 0.0.1
PROG_URL        := https://github.com/progman/libhash.git

OUT_DIR         := bin
C_LIST          := md5.c sha1.c sha256.c sha512.c
CPP_LIST        := crc16.cpp crc32.cpp md5.cpp sha1.cpp sha256.cpp sha512.cpp hash.cpp
HEADER_LIST     := crc16.hpp crc32.hpp md5.h md5.hpp sha1.h sha1.hpp sha256.h sha256.hpp sha512.h sha512.hpp

CFLAGS          :=
CPPFLAGS        :=
LFLAGS          :=
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
CC              ?= gcc
CXX             ?= g++
LN              ?= g++
STRIP           ?= strip --strip-unneeded --remove-section=.comment
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
CFLAGS_x32DBG   := $(CFLAGS)   -m32 -pedantic -Wall -Wextra -Wlong-long -Wunused -pipe -march=native -mtune=native -O0 -I./ -g3 -std=c99   -fdata-sections -ffunction-sections -fmax-errors=3 -ggdb -pg -fstack-protector-all
CFLAGS_x32REL   := $(CFLAGS)   -m32 -pedantic -Wall -Wextra -Wlong-long -Wunused -pipe -march=native -mtune=native -O3 -I./ -g0 -std=c99   -fdata-sections -ffunction-sections -fmax-errors=3 -funroll-all-loops
CFLAGS_x32TST   := $(CFLAGS)   -m32 -pedantic -Wall -Wextra -Wlong-long -Wunused -pipe -march=native -mtune=native -O3 -I./ -g0 -std=c99   -fdata-sections -ffunction-sections --analyze -fsanitize=address -fsanitize=bounds
CFLAGS_x64DBG   := $(CFLAGS)   -m64 -pedantic -Wall -Wextra -Wlong-long -Wunused -pipe -march=native -mtune=native -O0 -I./ -g3 -std=c99   -fdata-sections -ffunction-sections -fmax-errors=3 -ggdb -pg -fstack-protector-all
CFLAGS_x64REL   := $(CFLAGS)   -m64 -pedantic -Wall -Wextra -Wlong-long -Wunused -pipe -march=native -mtune=native -O3 -I./ -g0 -std=c99   -fdata-sections -ffunction-sections -fmax-errors=3 -funroll-all-loops
CFLAGS_x64TST   := $(CFLAGS)   -m64 -pedantic -Wall -Wextra -Wlong-long -Wunused -pipe -march=native -mtune=native -O3 -I./ -g0 -std=c99   -fdata-sections -ffunction-sections --analyze -fsanitize=address -fsanitize=bounds

CPPFLAGS_x32DBG := $(CPPFLAGS) -m32 -pedantic -Wall -Wextra -Wlong-long -Wunused -pipe -march=native -mtune=native -O0 -I./ -g3 -std=c++11 -fdata-sections -ffunction-sections -fmax-errors=3 -ggdb -pg -fstack-protector-all
CPPFLAGS_x32REL := $(CPPFLAGS) -m32 -pedantic -Wall -Wextra -Wlong-long -Wunused -pipe -march=native -mtune=native -O3 -I./ -g0 -std=c++11 -fdata-sections -ffunction-sections -fmax-errors=3 -funroll-all-loops
CPPFLAGS_x32TST := $(CPPFLAGS) -m32 -pedantic -Wall -Wextra -Wlong-long -Wunused -pipe -march=native -mtune=native -O3 -I./ -g0 -std=c++11 -fdata-sections -ffunction-sections --analyze -fsanitize=address -fsanitize=bounds
CPPFLAGS_x64DBG := $(CPPFLAGS) -m64 -pedantic -Wall -Wextra -Wlong-long -Wunused -pipe -march=native -mtune=native -O0 -I./ -g3 -std=c++11 -fdata-sections -ffunction-sections -fmax-errors=3 -ggdb -pg -fstack-protector-all
CPPFLAGS_x64REL := $(CPPFLAGS) -m64 -pedantic -Wall -Wextra -Wlong-long -Wunused -pipe -march=native -mtune=native -O3 -I./ -g0 -std=c++11 -fdata-sections -ffunction-sections -fmax-errors=3 -funroll-all-loops
CPPFLAGS_x64TST := $(CPPFLAGS) -m64 -pedantic -Wall -Wextra -Wlong-long -Wunused -pipe -march=native -mtune=native -O3 -I./ -g0 -std=c++11 -fdata-sections -ffunction-sections --analyze -fsanitize=address -fsanitize=bounds
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
LFLAGS_x32DBG   := $(LFLAGS)   -m32 -g3 -Wl,--gc-sections -Wl,--as-needed -ggdb
LFLAGS_x32REL   := $(LFLAGS)   -m32 -g0 -Wl,--gc-sections -Wl,--as-needed       -s
LFLAGS_x64DBG   := $(LFLAGS)   -m64 -g3 -Wl,--gc-sections -Wl,--as-needed -ggdb
LFLAGS_x64REL   := $(LFLAGS)   -m64 -g0 -Wl,--gc-sections -Wl,--as-needed       -s
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
VPATH           := $(dir $(C_LIST) $(CPP_LIST))

O_x32DBG_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32dbg.o,   $(basename $(C_LIST)))))
O_x32REL_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32.o,      $(basename $(C_LIST)))))
O_x32TST_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32tst.o,   $(basename $(C_LIST)))))
O_x64DBG_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64dbg.o,   $(basename $(C_LIST)))))
O_x64REL_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64.o,      $(basename $(C_LIST)))))
O_x64TST_LIST   := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64tst.o,   $(basename $(C_LIST)))))

OPP_x32DBG_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32dbg.opp, $(basename $(CPP_LIST)))))
OPP_x32REL_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32.opp,    $(basename $(CPP_LIST)))))
OPP_x32TST_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x32tst.opp, $(basename $(CPP_LIST)))))
OPP_x64DBG_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64dbg.opp, $(basename $(CPP_LIST)))))
OPP_x64REL_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64.opp,    $(basename $(CPP_LIST)))))
OPP_x64TST_LIST := $(addprefix $(OUT_DIR)/, $(notdir $(addsuffix .x64tst.opp, $(basename $(CPP_LIST)))))
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: help
help:
	@echo "use make [x32 | x64 | x32dbg | x64dbg | clean]";
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
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION) : $(O_x32DBG_LIST) $(OPP_x32DBG_LIST)
	@$(LN) $(OUT_DIR)/*.x32dbg.o* $(LFLAGS_x32DBG) -o $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION)
	@objdump -Dslx $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION) > $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION).dump;
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)    : $(O_x32REL_LIST) $(OPP_x32REL_LIST)
	@$(LN) $(OUT_DIR)/*.x32.o*    $(LFLAGS_x32REL) -o $(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)
	@$(STRIP) $(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION) : $(O_x64DBG_LIST) $(OPP_x64DBG_LIST)
	@$(LN) $(OUT_DIR)/*.x64dbg.o* $(LFLAGS_x64DBG) -o $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION)
	@objdump -Dslx $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION) > $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION).dump;
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
$(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)    : $(O_x64REL_LIST) $(OPP_x64REL_LIST)
	@$(LN) $(OUT_DIR)/*.x64.o*    $(LFLAGS_x64REL) -o $(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)
	@$(STRIP) $(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x32dbg
x32dbg:  $(OUT_DIR)/$(PROG_NAME)-x32dbg-$(PROG_VERSION)
	@ln -sf $(PROG_NAME)-x32dbg-$(PROG_VERSION) $(OUT_DIR)/$(PROG_NAME)
	@echo "ready x32dbg";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x32
x32:     $(OUT_DIR)/$(PROG_NAME)-x32-$(PROG_VERSION)
	@ln -sf $(PROG_NAME)-x32-$(PROG_VERSION) $(OUT_DIR)/$(PROG_NAME)
	@echo "ready x32";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x32test
x32test: $(O_x32TST_LIST) $(OPP_x32TST_LIST)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x64dbg
x64dbg:  $(OUT_DIR)/$(PROG_NAME)-x64dbg-$(PROG_VERSION)
	@ln -sf $(PROG_NAME)-x64dbg-$(PROG_VERSION) $(OUT_DIR)/$(PROG_NAME)
	@echo "ready x64dbg";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x64
x64:     $(OUT_DIR)/$(PROG_NAME)-x64-$(PROG_VERSION)
	@ln -sf $(PROG_NAME)-x64-$(PROG_VERSION) $(OUT_DIR)/$(PROG_NAME)
	@echo "ready x64";
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
.PHONY: x64test
x64test: $(O_x64TST_LIST) $(OPP_x64TST_LIST)
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
