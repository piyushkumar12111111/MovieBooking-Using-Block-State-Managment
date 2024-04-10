package handler

import (
	"encoding/json"
	"net/http"

	model "github.com/piyushkumar/Hotelbooking/models"
)

var musics = []model.Music{
	{ID: "1", Title: "Track One", Artist: "Artist A", Year: 2024},
	{ID: "2", Title: "Track Two", Artist: "Artist B", Year: 2024},
	{ID: "3", Title: "Track Three", Artist: "Artist C", Year: 2024},
	{ID: "4", Title: "Track Four", Artist: "Artist D", Year: 2024},
	{ID: "5", Title: "Track Five", Artist: "Artist E", Year: 2024},
	// Add more tracks as needed
}

var favourite = []model.Music{
	{ID: "1", Title: "Track One", Artist: "Artist A", Year: 2024},
}

func GetLatestMusics(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(musics)
}

// GetMusicByID returns a music track by its ID
func GetMusicByID(w http.ResponseWriter, r *http.Request) {

	w.Header().Set("Content-Type", "application/json")

	// Get the ID from the URL
	params := r.URL.Query()
	id := params.Get("id")

	// Find the music track by ID
	for _, music := range musics {
		if music.ID == id {
			json.NewEncoder(w).Encode(music)
			return
		}
	}

	// If no music track is found, return an empty response
	json.NewEncoder(w).Encode("No movie found with the given ID.")
}

//! Implement the AddToFavourite handler function
func AddToFavourite(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")

	// Get the ID from the URL
	params := r.URL.Query()
	id := params.Get("id")

	// Find the music track by ID
	for _, music := range musics {
		if music.ID == id {
			favourite = append(favourite, music)
			json.NewEncoder(w).Encode(favourite)
			return
		}
	}

	// If no music track is found, return an empty response
	json.NewEncoder(w).Encode("No music found with the given ID.")
}

//! Implement the addtofav find by id 

func FindAddToFavouriteByID(w http.ResponseWriter, r *http.Request) {
    
	w.Header().Set("Content-Type", "application/json")

	// Get the ID from the URL
	params := r.URL.Query()
	id := params.Get("id")

	// Find the music track by ID
	for _, music := range favourite {
		if music.ID == id {
			json.NewEncoder(w).Encode(music)
			return
		}
	}

	// If no music track is found, return an empty response
	json.NewEncoder(w).Encode("No music found with the given ID.")


}