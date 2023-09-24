## debug dockerized Go application using Delve

## Sample-app
Just hello world

```make
make build-sample-app
make run-sample-app
```


#### Debug inside docker via delve:


>Note: If you are trying to debug `linux/amd64` containers on m1 echo $DOCKER_DEFAULT_PLATFORM
linux/amd64 you need to revisit https://github.com/docker/for-mac/issues/5191#issuecomment-821319621
>  

```
export DOCKER_DEFAULT_PLATFORM="" 
docker build -t dlv-debug -f Dockerfile-dlv-debug .
docker run -it dlv-debug
/usr/src/app # dlv debug
Type 'help' for list of commands.
(dlv) b main.main
Breakpoint 1 set at 0xb9d80 for main.main() ./hello.go:9
(dlv) c
> main.main() ./hello.go:9 (hits goroutine(1):1 total:1) (PC: 0xb9d80)
     4:         "fmt"
     5:
     6:         "rsc.io/quote"
     7: )
     8:
=>   9: func main() {
    10:         nums := []int{2, 3, 4}
    11:         t := dummy
    12:         _ = t
    13:         for i, num := range nums {
    14:                 if num == 3 {
(dlv)
```


### Links