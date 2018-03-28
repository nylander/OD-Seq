PREFIX = /home/nylander/bin

ODSEQ := odseq

CXX := g++

CPPFLAGS := -fopenmp

RM := rm -f

CP := cp

SRCS := $(wildcard *.cpp)

OBJS := $(subst .cpp,.o,$(SRCS))

.PHONY: install

all: $(ODSEQ)

$(ODSEQ): $(OBJS)
	$(CXX) $(CPPFLAGS) -o $(ODSEQ) $(OBJS)

depend: .depend

.depend: $(SRCS)
	$(RM) ./.depend
	$(CXX) $(CPPFLAGS) -MM $^>>./.depend;

.PHONY: install

install: $(ODSEQ)
	$(CP) $< $(PREFIX)/$(ODSEQ)

.PHONY: uninstall

uninstall:
	$(RM) $(PREFIX)/$(ODSEQ)

clean:
	$(RM) $(OBJS)

distclean: clean
	$(RM) $(ODSEQ) .depend

-include .depend
