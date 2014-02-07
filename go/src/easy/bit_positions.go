package main

import (
	"io"
	"bufio"
	"os"
	"strings"
	"strconv"
	"fmt"
)

func read_lines(path string) []string {
	var lines []string
	file, _ := os.Open(path)
	defer file.Close()
	reader := bufio.NewReader(file)
	for {
		line, _, err := reader.ReadLine()
		if err == io.EOF {
			break
		}
		lines = append(lines, string(line))
	}
	return lines
}

func to_int(str []string) []uint64 {
	numbers := make([]uint64, len(str))
	for i, number := range str {
		numbers[i], _ = strconv.ParseUint(number, 10, 64)
	}
	return numbers
}

func main() {
	lines := read_lines(os.Args[1])

	for _, line := range lines {
		str := strings.Split(line, ",")
		numbers := to_int(str)
		if numbers[0] >> (numbers[1] - 1) & 0x1 == numbers[0] >> (numbers[2] - 1) & 0x1 {
			fmt.Println("true")
		} else {
			fmt.Println("false")
		}
	}
}
