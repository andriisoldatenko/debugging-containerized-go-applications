dlv connect :40000
Type 'help' for list of commands.
(dlv) b main.main
Breakpoint 1 set at 0x4b5c76 for main.main() /usr/src/app/hello.go:9
(dlv)


dlv connect :40000
Type 'help' for list of commands.
(dlv) b main.main
Breakpoint 1 set at 0x4b5c76 for main.main() ./work/debugging-containerized-go-applications/sample_app/hello.go:9
(dlv) list main.main
Showing /usr/src/app/hello.go:9 (PC: 0x4b5c76)
     4:         "fmt"
     5:
     6:         "rsc.io/quote"
     7: )
     8:
     9: func main() {
    10:         nums := []int{2, 3, 4}
    11:         t := dummy
    12:         _ = t
    13:         for i, num := range nums {
    14:                 if num == 3 {
(dlv) b main.main
