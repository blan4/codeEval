//author: Siganov Ilya
//date: 02.02.2014
package main

import (
	"os"
	"strings"
	"fmt"
	"log"
	"bufio"
	"io"
)

func main() {
	var words = map[string]int {
		"zero": 0,
		"one": 1,
		"two": 2,
		"three": 3,
		"four": 4,
		"five": 5,
		"six": 6,
		"seven": 7,
		"eight": 8,
		"nine": 9,
	}

	lines := read_lines(os.Args[1])
	for _, line := range lines {
		digits := strings.Split(line, ";")
		for _, digit := range digits {
			fmt.Print(words[digit])
		}
		fmt.Println("")
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
