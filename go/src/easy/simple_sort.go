package main

import (
	"os"
	"bufio"
	"io"
	"log"
	"strings"
	"strconv"
	"fmt"
)

func main() {
	lines := read_lines(os.Args[1])
	for _, line := range lines {
		numbers := strings.Split(line, " ")
		result := merge_sort(as_array(numbers))
		for _, v := range result {
			fmt.Print(v, " ")
		}
		fmt.Print("\n")
	}
}

type array []float64

func merge(left array, right array) array {
	l := len(left)
	r := len(right)
	res := make(array, l + r)
	i, j := 0, 0
	for i < l && j < r {
		if left[i] < right[j] {
			res[i+j] = left[i]
			i++
		} else {
			res[i+j] = right[j]
			j++
		}
	}
	for ;i < l; i++ {
		res[i+j] = left[i]
	}
	for ;j < r; j++ {
		res[i+j] = right[j]
	}
	return res
}

func merge_sort(numbers array) array {
	if len(numbers) <= 1 {
	    return numbers
	}
	middle := len(numbers) / 2
	var left, right array
	if len(numbers) % 2 == 1 {
		left = make(array, middle)
		right = make(array, middle + 1)
	} else {
		left = make(array, middle)
		right = make(array, middle)
	}

	copy(left, numbers[:middle])
	copy(right, numbers[middle:])

	left = merge_sort(left)
	right = merge_sort(right)

	return merge(left, right)
}

func as_array(str []string) array{
	numbers := make(array, len(str))
	for index, n := range str {
		numbers[index], _ = strconv.ParseFloat(n, 10)
	}
	return numbers
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


