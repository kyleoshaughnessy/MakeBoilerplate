# Compiler options
CC              = g++
CFLAGS          = -std=c++14 -c -Wall -Iinc -g
LDFLAGS         =
EXECUTABLE_NAME = out

# Folders
SRC = src
BIN = bin
OBJ = $(BIN)/obj

# Source files in $(SRC)
SOURCE_FILES += main.cpp
SOURCE_FILES += funcs.cpp

EXECUTABLE = $(EXECUTABLE_NAME:%=$(BIN)/%)
OBJECT_FILES = $(SOURCE_FILES:%.cpp=$(OBJ)/%.o)

# Default target
build: $(EXECUTABLE)

clean:
	rm -rf $(BIN)

.PHONY: build clean

# Link objects
$(EXECUTABLE): $(OBJECT_FILES)
	@$(CC) $(LDFLAGS) -o $@ $^

# Compile objects
$(OBJECT_FILES): $(OBJ)/%.o: $(SRC)/%.cpp
	@echo $<
	@mkdir -p $(@D)
	@$(CC) $(CFLAGS) -o $@ $<
