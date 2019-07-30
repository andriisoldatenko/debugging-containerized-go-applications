package main

import "fmt"

func main() {
	nums := []int{2, 3, 4}
	t := dummy
	_ = t
	for i, num := range nums {
		if num == 3 {
			fmt.Println("index:", i)
		}
	}
}


func dummy(){
	fmt.Println("func call")
}