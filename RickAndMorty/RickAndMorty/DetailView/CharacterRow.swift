//
//  CharacterRow.swift
//  RickAndMorty
//
//  Created by Cherry on 4/10/25.
//

import SwiftUI

struct CharacterRow: View {
    var character: Character

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable().scaledToFit()
                    .frame(width: 50, height: 50)
                    .accessibilityLabel("Image of \(character.name)")
                } placeholder: {
                    ProgressView()
                }
                VStack(alignment: .leading) {
                    Text(character.name)
                        .font(.headline)
                        .accessibilityLabel("Name: \(character.name)")
                    Text(character.species)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .accessibilityLabel("Species: \(character.species)")
                }
            }
        }
    }
