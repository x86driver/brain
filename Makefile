OBJS = BrainF.o BrainFDriver.o
TARGET = brain

all:$(TARGET)

brain:$(OBJS)
	g++ $(CFLAGS) -o $@ $(OBJS) `llvm-config --cppflags --ldflags --libs core jit native all`

BrainF.o:BrainF.cpp
	g++ $(CFLAGS) -c -o $@ $< `llvm-config --cppflags --ldflags --libs core jit native all`

BrainFDriver.o:BrainFDriver.cpp
	g++ $(CFLAGS) -c -o $@ $< `llvm-config --cppflags --ldflags --libs core jit native all`

clean:
	rm -rf $(TARGET) $(OBJS)
