all:
	$(CXX) -c main.cpp -O2 --std=c++11
	$(CXX) -c pngio.cpp -O2 --std=c++11
	$(CXX) -o pngio_example main.o pngio.o -lpng -lz

