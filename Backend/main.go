package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
	handler "github.com/piyushkumar/Hotelbooking/Handler"
)

func main() {

	r := mux.NewRouter()

	fmt.Println("This is the main function of the backend.")

	// Add your routes as needed
	r.HandleFunc("/api/v1/musics", handler.GetLatestMusics).Methods("GET")
	r.HandleFunc("/api/v1/musics/{id}", handler.GetMusicByID).Methods("GET")
	r.HandleFunc("/api/v1/favourite/{id}", handler.AddToFavourite).Methods("POST")
	//r.HandleFunc("/api/v1/favourite", handler.GetFavourite).Methods("GET")
	r.HandleFunc("/api/v1/musics/{id}", handler.GetMusicByID).Methods("GET")
	r.HandleFunc("/api/v1/favourite/{id}", handler.AddToFavourite).Methods("POST")
	//r.HandleFunc("/api/v1/favourite", handler.GetFavourite).Methods("GET")

	log.Fatal(http.ListenAndServe(":8080", r))
}