package model

// Music represents a music track
type Music struct {
    ID     string `json:"id"`
    Title  string `json:"title"`
    Artist string `json:"artist"`
    Year   int    `json:"year"`
}
