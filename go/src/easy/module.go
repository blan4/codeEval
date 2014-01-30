package main
import (
	"bufio"
	"os"
	"fmt"
	"log"
	"strings"
	"strconv"
	"io"
)

func module(n int, m int) int {
	return n - int(n / m) * m;
}

func main() {
	path := os.Args[1]
	file, error := os.Open(path)
	if error != nil {
		log.Fatal(error)
	}
	defer file.Close()

	reader := bufio.NewReader(file)
	for {
		line, isPrefix, err := reader.ReadLine()
		if err == io.EOF {
			break
		}
		if err != nil {
			log.Fatal(err)
		}
		if isPrefix {
			log.Fatal("Error: Unexpected long line reading", file.Name())
		}

		numbers := strings.Split(string(line), ",")
		n, e := strconv.Atoi(numbers[0])
		m, e := strconv.Atoi(numbers[1])
		if (e != nil){
			fmt.Println(0)
		}
		fmt.Println(module(n, m))
	}
}
