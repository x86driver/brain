OBJS = BrainF.o BrainFDriver.o
TARGET = brain
CC = clang
LINK = llvm-g++
LLVM_CFG = `llvm-config --cppflags`
LLVM_LINK_CFG = `llvm-config --cppflags --ldflags --libs all`

all:$(TARGET)

brain:$(OBJS)
	$(LINK) $(CFLAGS) -o $@ $(OBJS) $(LLVM_LINK_CFG)

BrainF.o:BrainF.cpp
	$(CC) $(CFLAGS) -c -o $@ $< $(LLVM_CFG)

BrainFDriver.o:BrainFDriver.cpp
	$(CC) $(CFLAGS) -c -o $@ $< $(LLVM_CFG)

clean:
	rm -rf $(TARGET) $(OBJS)
