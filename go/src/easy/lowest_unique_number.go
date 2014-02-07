//author: Siganov Ilya
//date: 02.02.2014
package main

import (
	"os"
	"log"
	"bufio"
	"io"
	"fmt"
	"strings"
	"strconv"
	"sort"
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

func find_index(numbers []int, number int) int {
	for index, num := range numbers {
		if number == num {
			return index
		}
	}
	return 0
}

func main() {
	lines := read_lines(os.Args[1])
	for _, line := range lines {
		original := as_int(strings.Split(line, " "))

		count_map := make(map[int]int)
		for _, n := range original {
			count_map[n]++
		}
		uniqueness := make([]int, len(count_map))
		i := 0
		for k,_ := range count_map {
			uniqueness[i] = k
			i++
		}
		sort.Ints(uniqueness)

		winner := 0
		for _, n := range uniqueness {
			if count_map[n] == 1 {
				winner = find_index(original, n) + 1
				break
			}
		}

		fmt.Println(winner)
	}
}
