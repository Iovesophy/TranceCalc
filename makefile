MAIN = y.tab
OBJ = $(MAIN).c

all:    trancecalc.exe
trancecalc.exe: $(OBJ)
	ruby trancecalcmaker.rb  && cc -o trancecalc  $(OBJ)

$(MAIN).obj:    $(MAIN).c


