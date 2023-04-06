package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, req *http.Request) {
		fmt.Fprintf(w, `
		<h1> Docker </h1>
		<div> this is programm for testing docker work </div>
		`)
	})

	http.ListenAndServe(":8080", nil)
}
