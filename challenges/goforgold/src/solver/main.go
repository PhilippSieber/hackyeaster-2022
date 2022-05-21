package main

import (
	"fmt"
	"strings"
)

func main() {
	value := "aug{lmepdpeuvlisvohxhqjxlfhr"
	fmt.Println(unmaschadar(unremplazzar(value)))
}

func unremplazzar(s string) string {
	chars := []rune(s)
	for i := range chars {
		chars[i] = chars[i] - rune(i%5+i%2)
	}
	return string(chars)
}

func unmaschadar(s string) string {
	letters := strings.Split(s, "")
	length := len(letters)
	var j int
	for i := range letters {
		j = length - i - 1
		letters[j], letters[(j+5)%length] = letters[(j+5)%length], letters[j]
	}
	for i := range letters {
		j = length - i - 1
		letters[j], letters[(j+3)%length] = letters[(j+3)%length], letters[j]
	}
	return strings.Join(letters, "")
}
