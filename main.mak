# main.mak          build main[.exe]:
# make -f main.mak


SRC = main.c


#-----------------------------------------
# get <fn>.o from <fn>.c for sourceList
OBJ = $(patsubst %.c,%.o, $(notdir $(SRC)))

DEBUG = -ggdb -pg

# Linux & MSYS
CPFLG = $(DEBUG)

$(info - MAKE_HOST = $(MAKE_HOST))


#-----------------------------------------------------
ifeq "$(MAKE_HOST)" "x86_64-pc-linux-gnu"
# Linux-64:
LKFLG = $(DEBUG) ./libdll1.so -Wl,--unresolved-symbols=ignore-all

#-----------------------------------------------------
else
# MSYS: x86_64-pc-msys
LKFLG =  $(DEBUG) ./libdll1.a
#-L. -ldll1
endif

#-----------------------------------------------------
build: $(OBJ)
	@echo ================= $@ ========================
	@echo "SRC=" $(SRC)
	@echo "OBJ=" $(OBJ)
	$(CC) $(OBJ) $(LKFLG) -o main


#-----------------------------------------------------
clean:
	rm -rf *.o *.obj *.out *.a *.ilk *.pdb *.exp *.lib *.dll *.so *.exe main


#-----------------------------------------------------
.c.o:
	@echo ================= Compile $@ ========================
	@echo "SRC=" $(SRC)
	@echo "OBJ=" $(OBJ)
	$(CC) -c $(CPFLG) $<


# eof
