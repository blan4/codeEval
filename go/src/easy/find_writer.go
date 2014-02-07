//author: Siganov Ilya
//date: 02.02.2014
package main

import (
	"io"
	"os"
	"bufio"
	"log"
	"strings"
	"fmt"
	"strconv"
)

func main() {
	for _, line := range read_lines(os.Args[1]) {
		raw := strings.Split(line, "| ")
		words := strings.Split(raw[0], "")
		positions := strings.Split(raw[1], " ")
		for _, pos := range positions {
			i, _ := strconv.Atoi(pos)
			fmt.Print(words[i-1])
		}
		fmt.Print("\n")
	}
}


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
