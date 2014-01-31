//author: Siganov Ilya
//date: 31.01.2014
package main

import (
	"os"
	"log"
	"bufio"
	"io"
	"fmt"
	"strings"
	"strconv"
)

func read_lines(path string) []string {
	var lines []string
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
		lines = append(lines, string(line))
	}
	return lines
}

func task(x int, n int) int {
	for n < x {
		n <<= 1
	}
	return n
}

func main() {
	lines := read_lines(os.Args[1])
	for i, line := range lines {
		numbers := strings.Split(string(line), ",")
		x, _ := strconv.Atoi(numbers[0])
		n, _ := strconv.Atoi(numbers[1])
		fmt.Println(task(x, n))
	}
}
