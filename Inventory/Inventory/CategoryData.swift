//
//  CategoryData.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import SwiftUI
import CoreData


struct Inventory: Identifiable {
    let id: UUID
    let name: String
    let quantity: Int64
    let image: Data?
    let category: String
    let subcategory: String
}

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let subcategories: [String]
}

let categories = [
    Category(name: "Elektronik", imageName: "", subcategories: [
        "Smartphones", "Laptops", "Tablets", "Fernseher", "Kameras", "Kopfhörer", "Lautsprecher"
    ]),
    Category(name: "Haushaltsgeräte", imageName: "", subcategories: [
        "Kühlschränke", "Waschmaschinen", "Geschirrspüler", "Mikrowellen", "Staubsauger", "Kaffeemaschinen"
    ]),
    Category(name: "Möbel", imageName: "", subcategories: [
        "Sofas", "Tische", "Stühle", "Betten", "Schränke", "Regale"
    ]),
    Category(name: "Kleidung", imageName: "", subcategories: [
        "Hemden", "Hosen", "Jacken", "Schuhe", "Accessoires", "Sportbekleidung"
    ]),
    Category(name: "Bürobedarf", imageName: "", subcategories: [
        "Stifte", "Notizbücher", "Ordner", "Drucker", "Papier", "Büroklammern"
    ]),
    Category(name: "Lebensmittel", imageName: "", subcategories: [
        "Obst", "Gemüse", "Fleisch", "Milchprodukte", "Konserven", "Gewürze"
    ]),
    Category(name: "Spielzeug", imageName: "", subcategories: [
        "Puppen", "Bauklötze", "Brettspiele", "Videospiele", "Puzzles", "Lernspielzeug"
    ]),
    Category(name: "Sportartikel", imageName: "", subcategories: [
        "Fahrräder", "Laufbänder", "Hanteln", "Sportbekleidung", "Bälle", "Campingausrüstung"
    ]),
    Category(name: "Kosmetik und Pflege", imageName: "",  subcategories: [
        "Hautpflege", "Haarpflege", "Make-up", "Parfums", "Zahnpflege", "Hygieneprodukte"
    ]),
    Category(name: "Bücher und Medien", imageName: "", subcategories: [
        "Romane", "Sachbücher", "Zeitschriften", "DVDs", "CDs", "E-Books"
    ]),
    Category(name: "Gartenbedarf", imageName: "", subcategories: [
        "Pflanzen", "Gartengeräte", "Dünger", "Samen", "Gartenmöbel", "Bewässerungssysteme"
    ]),
    Category(name: "Autozubehör",imageName: "", subcategories: [
        "Reifen", "Autoelektronik", "Reinigungsprodukte", "Ersatzteile", "Werkzeuge", "Sicherheitsausrüstung"
    ])
]
