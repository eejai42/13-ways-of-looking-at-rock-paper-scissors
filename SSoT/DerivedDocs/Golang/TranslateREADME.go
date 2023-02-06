package main

import (
	"encoding/json"
	"log"
	"os"
	"text/template"
)

func main() {
	// Open the JSON data file
	jsonFile, err := os.Open("C:/Users/auto1/go/src/github.com/eejai42/rock-paper-scissors/SSoT/rps.json")
	if err != nil {
		log.Fatal(err)
	}
	defer jsonFile.Close()

	// Decode the JSON data into a map
	var data map[string]interface{}
	if err := json.NewDecoder(jsonFile).Decode(&data); err != nil {
		log.Fatal(err)
	}

	// Parse the template file
	tmpl, err := template.ParseFiles("C:/Users/auto1/go/src/github.com/eejai42/rock-paper-scissors/SSoT/DerivedDocs/Spanish/readme.gotmplt")
	if err != nil {
		log.Fatal(err)
	}

	// Execute the template with the dynamic JSON data
	if err := tmpl.Execute(os.Stdout, data); err != nil {
		log.Fatal(err)
	}
}
