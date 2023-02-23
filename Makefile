CXX = g++
CXXFLAGS = -g -Wall -O2

chat: socket.o chat.o main.o
	$(CXX) $^ -o $@

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $<

clean:
	rm -f *.o *~ deps.mk chat core

deps.mk: $(wildcard *.cpp) Makefile
	$(CXX) -MM $(wildcard *.cpp) > $@

ifneq (clean, $(MAKECMDGOALS))
-include deps.mk
endif

