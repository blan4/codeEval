//author: Siganov Ilya
//date: 02.02.2014
/*
CHALLENGE DESCRIPTION:
Write a program which capitalizes the first letter of each word in a sentence.

INPUT SAMPLE: Your program should accept as its first argument a path to a filename. Input example is the following
Hello world
javaScript language
a letter
1st thing

OUTPUT SAMPLE: Print capitalized words in the following way.
Hello World
JavaScript Language
A Letter
1st Thing
 */
package main

import (
	"os"
	"log"
	"bufio"
	"io"
	"strings"
	"fmt"
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

func capitalize(str string) string {
	letters := strings.Split(str, "")
	letters[0] = strings.ToUpper(letters[0])
	return strings.Join(letters, "")
}

func main() {
	for _, line := range read_lines(os.Args[1]) {
		words := strings.Split(line, " ")
		res := make([]string, len(words))
		for i, word := range words {
			res[i] = capitalize(word)
		}
		fmt.Println(strings.Join(res, " "))
	}
}

