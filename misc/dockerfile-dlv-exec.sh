docker build -f Dockerfile-dlv-exec -t dlv-exec .
/ # dlv exec app
Type 'help' for list of commands.
(dlv) b main.main
Breakpoint 1 set at 0x4b5c76 for main.main() .usr/src/app/hello.go:9
(dlv) c
> main.main() .usr/src/app/hello.go:9 (hits goroutine(1):1 total:1) (PC: 0x4b5c76)
(dlv) c
index: 1
Hello, world.
Process 23 has exited with status 0
(dlv) exit
/ #