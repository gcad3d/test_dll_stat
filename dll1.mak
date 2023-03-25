# dll1.mak         build libdll1.dll
# make -f dll1.mak


SRC = dll1.c


#-----------------------------------------------------
# get <fn>.o from <fn>.c for sourceList
OBJ = $(patsubst %.c,%.o, $(notdir $(SRC)))

DEBUG = -g3 -O0

# Linux & MSYS
CPFLG =  -fPIC $(DEBUG)

$(info - MAKE_HOST = $(MAKE_HOST))


#-----------------------------------------------------
ifeq "$(MAKE_HOST)" "x86_64-pc-linux-gnu"
# Linux
LKFLG = $(DEBUG) -shared -export-dynamic -Wno-implicit-function-declaration
FTYP = so

#-----------------------------------------------------
else
# MSYS:  x86_64-pc-msys
LKFLG = $(DEBUG) -shared
FTYP = a

endif


#-----------------------------------------------------
build: $(OBJ)
	@echo ================= $@ ========================
	@echo "SRC=" $(SRC)
	@echo "OBJ=" $(OBJ)
	if test "$(FTYP)" = "so"; then\
  $(CC) $(OBJ) $(LKFLG) -o libdll1.$(FTYP);\
  fi
	if test "$(FTYP)" = "a"; then\
  ar rcs libdll1.$(FTYP) $(OBJ);\
  fi



#-----------------------------------------------------
.c.o:
	@echo ================= Compile $@ ========================
	$(CC) -c $(CPFLG) $<


# eof
