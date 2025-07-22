CXX ?= g++

# Use clang++ when USE_CLANG=1 is specified
ifeq ($(USE_CLANG),1)
    CXX := clang++
endif
DEFINES :=
INCLUDES := -Iinclude
CPPFLAGS := -MMD
CXXFLAGS := -std=c++23 $(INCLUDES) -O3 -Wall -pthread -fPIC $(DEFINES)
LDFLAGS := -shared -pthread
LDLIBS := -lm -ldl


TARGET := BonDriver_LinuxMirakc.so
OBJS := src/BonDriver_LinuxMirakc.o src/char_code_conv.o src/GrabTsData.o src/config.o src/util.o
DEPS := $(OBJS:.o=.d)

all: $(TARGET)

clean:
	$(RM) -v $(TARGET) $(OBJS) $(DEPS)

$(TARGET): $(OBJS)
	$(CXX) $(LDFLAGS) -o $@ $^ $(LDLIBS)

-include $(DEPS)

.PHONY: all clean
