package main

import (
	"fmt"

	"github.com/bfv/starbase-server/config"
)

func main() {
	config.InitConfig()
	fmt.Println("Hello, Starbase!")
}
