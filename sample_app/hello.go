package main

import (
	"fmt"

	"rsc.io/quote"
)

var Version string

func main() {
	fmt.Printf("version is: %s\n", Version)
	nums := []int{2, 3, 4}
	t := dummy
	_ = t
	for i, num := range nums {
		if num == 3 {
			fmt.Println("index:", i)
		}
	}
	fmt.Println(quote.Hello())
}

func dummy() {
	fmt.Println("func call")
}
