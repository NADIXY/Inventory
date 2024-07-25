//
//  CategoryData.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import Foundation


struct Category: Identifiable {
    let id = UUID()
    let name: String?
    let imageName: String?
    let subcategories: [String]
}

let categories = [
    Category(name: "Elektronik", imageName: "elektro", subcategories: [
        "Smartphones", "Laptops", "Tablets", "Fernseher", "Kameras", "Kopfhörer", "Lautsprecher"
    ]),
    Category(name: "Haushaltsgeräte", imageName: "default", subcategories: [
        "Kühlschränke", "Waschmaschinen", "Geschirrspüler", "Mikrowellen", "Staubsauger", "Kaffeemaschinen"
    ]),
    Category(name: "Möbel", imageName: "default", subcategories: [
        "Sofas", "Tische", "Stühle", "Betten", "Schränke", "Regale"
    ]),
    Category(name: "Kleidung", imageName: "default", subcategories: [
        "Hemden", "Hosen", "Jacken", "Schuhe", "Accessoires", "Sportbekleidung"
    ]),
    Category(name: "Bürobedarf", imageName: "default", subcategories: [
        "Stifte", "Notizbücher", "Ordner", "Drucker", "Papier", "Büroklammern"
    ]),
    Category(name: "Lebensmittel", imageName: "default", subcategories: [
        "Obst", "Gemüse", "Fleisch", "Milchprodukte", "Konserven", "Gewürze"
    ]),
    Category(name: "Spielzeug", imageName: "toys", subcategories: [
        "Puppen", "Bauklötze", "Brettspiele", "Videospiele", "Puzzles", "Lernspielzeug"
    ]),
    Category(name: "Sportartikel", imageName: "sport", subcategories: [
        "Fahrräder", "Laufbänder", "Hanteln", "Sportbekleidung", "Bälle", "Campingausrüstung"
    ]),
    Category(name: "Kosmetik", imageName: "makeup",  subcategories: [
        "Hautpflege", "Haarpflege", "Make-up", "Parfums", "Zahnpflege", "Hygieneprodukte"
    ]),
    Category(name: "Bücher", imageName: "book", subcategories: [
        "Romane", "Sachbücher", "Zeitschriften", "DVDs", "CDs", "E-Books"
    ]),
    Category(name: "Gartenbedarf", imageName: "garden", subcategories: [
        "Pflanzen", "Gartengeräte", "Dünger", "Samen", "Gartenmöbel", "Bewässerungssysteme"
    ]),
    Category(name: "Autozubehör",imageName: "car", subcategories: [
        "Reifen", "Autoelektronik", "Reinigungsprodukte", "Ersatzteile", "Werkzeuge", "Sicherheitsausrüstung"
    ])
]
