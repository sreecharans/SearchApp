//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by Cherry on 4/10/25.
//

import Foundation

struct CharacterResponse: Codable {
    let info: Info
    let results: [Character]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let origin: Origin
    let image: String
    let created: String
}

struct Origin: Codable {
    let name: String
}
