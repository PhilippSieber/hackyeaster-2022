package main

import (
	"fmt"
	"os"
	"strings"
)

func main() {
	fmt.Println("    ________         ___________              ________       .__       .___._.")
	fmt.Println("   /  _____/  ____   \\_   _____/__________   /  _____/  ____ |  |    __| _/| |")
	fmt.Println("  /   \\  ___ /  _ \\   |    __)/  _ \\_  __ \\ /   \\  ___ /  _ \\|  |   / __ | | |")
	fmt.Println("  \\    \\_\\  (  <_> )  |     \\(  <_> )  | \\/ \\    \\_\\  (  <_> )  |__/ /_/ |  \\|")
	fmt.Println("   \\______  /\\____/   \\___  / \\____/|__|     \\______  /\\____/|____/\\____ |  __")
	fmt.Println("          \\/              \\/                        \\/                  \\/  \\/")
	fmt.Println("")
	fmt.Println("Enter the passphrase to unlock the gold.")
	var input string
	fmt.Scanln(&input)
	if len(input) != 28 {
		fmt.Println("Length mismatch")
		os.Exit(1)
	}
	fmt.Println(input)
	s := maschadar(input)
	s = remplazzar(s)
	verifitgar(s, input)
}

func maschadar(s string) string {
	letters := strings.Split(s, "")
	length := len(letters)
	for i := range letters {
		letters[i], letters[(i+3)%length] = letters[(i+3)%length], letters[i]
	}
	for i := range letters {
		letters[i], letters[(i+5)%length] = letters[(i+5)%length], letters[i]
	}
	return strings.Join(letters, "")
}

func remplazzar(s string) string {
	chars := []rune(s)
	for i := range chars {
		chars[i] = chars[i] + rune(i%5+i%2)
	}
	return string(chars)
}

func verifitgar(s string, input string) {
	t := []string{"aug{", "mepdpeuv", "isvohxhqjx", "fhr"}
	s2 := strings.Join(t, "l")
	if strings.Compare(s, s2) == 0 {
		fmt.Println("Congrats, the flag is: he2022{" + input + "}")
	} else {
		fmt.Println("Sorry, no.")
	}
}
