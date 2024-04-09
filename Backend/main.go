package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {

	r := mux.NewRouter()

	fmt.Println("This is the main function of the backend.")

	log.Fatal(http.ListenAndServe(":9080", r))
}