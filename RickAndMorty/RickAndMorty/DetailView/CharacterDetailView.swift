//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Cherry on 4/10/25.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: Character

    var body: some View {
        ScrollView {
            VStack {
                Text(character.name)
                    .font(.largeTitle)
                    .padding(.top)
                AsyncImage(url: URL(string: character.image)) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                } placeholder: {
                    ProgressView()
                }
                Text("Species: \(character.species)")
                Text("Status: \(character.status)")
                Text("Origin: \(character.origin.name)")
                if !character.type.isEmpty {
                    Text("Type: \(character.type)")
                }
                Text("Created: \(formattedDate(character.created))")
            }
            .padding()
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    shareCharacter()
                }) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
    }
    
    private func formattedDate(_ dateString: String) -> String {
        // Convert the date string to a Date object and format it
        let dateFormatter = ISO8601DateFormatter()
        if let date = dateFormatter.date(from: dateString) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateStyle = .medium
            displayFormatter.timeStyle = .none
            return displayFormatter.string(from: date)
        }
        return dateString
    }
    
    private func shareCharacter() {
        let shareText = "\(character.name) - \(character.species) - \(character.status)"
        let activityVC = UIActivityViewController(activityItems: [shareText, URL(string: character.image)!], applicationActivities: nil)
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(activityVC, animated: true, completion: nil)
        }
    }
}
