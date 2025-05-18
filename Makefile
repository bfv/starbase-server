# Makefile for starbase-server

BINARY_NAME=starbase-server
CMD_DIR=cmd/$(BINARY_NAME)
BUILD_DIR=build

.PHONY: all build run clean

all: build

build: build-windows build-linux

build-windows:
	@mkdir $(BUILD_DIR) 2>nul || true
	set GOOS=windows && set GOARCH=amd64 && go build -o $(BUILD_DIR)/$(BINARY_NAME).exe $(CMD_DIR)/main.go

build-linux:
	@mkdir $(BUILD_DIR) 2>nul || true
	set GOOS=linux && set GOARCH=amd64 && go build -o $(BUILD_DIR)/$(BINARY_NAME)-linux $(CMD_DIR)/main.go

run: build-windows
	$(BUILD_DIR)/$(BINARY_NAME).exe

clean:
	del /Q $(BUILD_DIR)\$(BINARY_NAME).exe $(BUILD_DIR)\$(BINARY_NAME)-linux 2>nul || true
