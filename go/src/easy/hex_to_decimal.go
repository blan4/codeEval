package main

import (
	"io"
	"bufio"
	"log"
	"os"
	"fmt"
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


func main() {
	for _, line := range read_lines(os.Args[1]) {
		num, _ := strconv.ParseInt(line, 16, 0)
		fmt.Println(num)
	}
}
