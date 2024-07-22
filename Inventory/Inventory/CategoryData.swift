//
//  CategoryData.swift
//  Inventory
//
//  Created by Lutz Brückner on 23.07.24.
//

import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let subcategories: [String]
}

let categories = [
    Category(name: "Elektronik", subcategories: [
        "Smartphones", "Laptops", "Tablets", "Fernseher", "Kameras", "Kopfhörer", "Lautsprecher"
    ]),
    Category(name: "Haushaltsgeräte", subcategories: [
        "Kühlschränke", "Waschmaschinen", "Geschirrspüler", "Mikrowellen", "Staubsauger", "Kaffeemaschinen"
    ]),
    Category(name: "Möbel", subcategories: [
        "Sofas", "Tische", "Stühle", "Betten", "Schränke", "Regale"
    ]),
    Category(name: "Kleidung", subcategories: [
        "Hemden", "Hosen", "Jacken", "Schuhe", "Accessoires", "Sportbekleidung"
    ]),
    Category(name: "Bürobedarf", subcategories: [
        "Stifte", "Notizbücher", "Ordner", "Drucker", "Papier", "Büroklammern"
    ]),
    Category(name: "Lebensmittel", subcategories: [
        "Obst", "Gemüse", "Fleisch", "Milchprodukte", "Konserven", "Gewürze"
    ]),
    Category(name: "Spielzeug", subcategories: [
        "Puppen", "Bauklötze", "Brettspiele", "Videospiele", "Puzzles", "Lernspielzeug"
    ]),
    Category(name: "Sportartikel", subcategories: [
        "Fahrräder", "Laufbänder", "Hanteln", "Sportbekleidung", "Bälle", "Campingausrüstung"
    ]),
    Category(name: "Kosmetik und Pflege", subcategories: [
        "Hautpflege", "Haarpflege", "Make-up", "Parfums", "Zahnpflege", "Hygieneprodukte"
    ]),
    Category(name: "Bücher und Medien", subcategories: [
        "Romane", "Sachbücher", "Zeitschriften", "DVDs", "CDs", "E-Books"
    ]),
    Category(name: "Gartenbedarf", subcategories: [
        "Pflanzen", "Gartengeräte", "Dünger", "Samen", "Gartenmöbel", "Bewässerungssysteme"
    ]),
    Category(name: "Autozubehör", subcategories: [
        "Reifen", "Autoelektronik", "Reinigungsprodukte", "Ersatzteile", "Werkzeuge", "Sicherheitsausrüstung"
    ])
]
