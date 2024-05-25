package utils

import (
	"math/rand"
	"strings"
	"time"
)

var alphabets = "abcdefghijklmnopqrstuvwxyz"

func init() {
	// Create a new random source with a specific seed
	seed := time.Now().UnixNano() // Using current time as the seed for true randomness
	source := rand.NewSource(seed)

	rand.New(source)
}

func RandomInt(min, max int64) int64 {
	return min + rand.Int63n(max-min+1)
}

func RandomString(n int) string {
	var sb strings.Builder
	k := len(alphabets)

	for i := 0; i < n; i++ {
		c := alphabets[rand.Intn(k)]
		sb.WriteByte(c)
	}

	return sb.String()
}

func RandomOwner() string {
	return RandomString(6)
}

func RandoMoney() int64 {
	return RandomInt(0, 1000)
}

func RandomCurrency() string {
	currencies := []string{"USD", "CAD", "EUR"}
	n := len(currencies)
	return currencies[rand.Intn(n)]
}
