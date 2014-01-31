//author: Siganov Ilya
//date: 31.01.2014
/*
CHALLENGE DESCRIPTION: Assume that someone dictates you a sequence of numbers and you need to write it down. For brevity, he dictates it as follows: first says the number of consecutive identical numbers and then says the number itself. E.g. The sequence 1 1 3 3 3 2 2 2 2 14 14 14 11 11 11 2 will be dictated as "Two times one, three times three, four times two, three times fourteen, three times eleven, one time two", so you will write down the sequence 2 1 3 3 4 2 3 14 3 11 1 2. The challenge is to write the program which compresses the given sequence using this approach.
INPUT SAMPLE: Your program should accept as its first argument a path to a filename. The input file contains T lines. Each line is a test case represented by a sequence of integers L, where each integer is N, separated by a whitespace. E.g
40 40 40 40 29 29 29 29 29 29 29 29 57 57 92 92 92 92 92 86 86 86 86 86 86 86 86 86 86
73 73 73 73 41 41 41 41 41 41 41 41 41 41
1 1 3 3 3 2 2 2 2 14 14 14 11 11 11 2
7

OUTPUT SAMPLE: For each test case produce a single line of output containing a compressed sequence of numbers separated by a single space char. E.g.
4 40 8 29 2 57 5 92 10 86
4 73 10 41
2 1 3 3 4 2 3 14 3 11 1 2
1 7

Constraints:
T is in range [20, 50]
N is in range [0, 99]
L length is in range [1, 400]
*/

package main

import (
	"os"
	"log"
	"io"
	"bufio"
	"strings"
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

func as_int(str []string) []int{
	numbers := make([]int, len(str))
	for index, n := range str {
		numbers[index], _ = strconv.Atoi(n)
	}
	return numbers
}

func as_str(numbers []int) []string {
	str := make([]string, len(numbers))
	for index, n := range numbers {
		str[index] = strconv.Itoa(n)
	}
	return str
}

func main() {
	lines := read_lines(os.Args[1])
	for _, line := range lines {
		numbers := as_int(strings.Split(line, " "))

		last := numbers[0]
		counter := 1
		res := []int{}
		for _, n := range numbers[1:] {
			if n == last {
				counter += 1
			} else {
				res = append(res, []int{counter, last}...)
				counter = 1
			}

			last = n
		}
		res = append(res, []int{counter, last}...)

		fmt.Println(strings.Join(as_str(res), " "))
	}
}
