//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Cherry on 4/10/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CharacterViewModel()

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText)
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    List(viewModel.characters) { character in
                        NavigationLink(destination: CharacterDetailView(character: character)
                            .transition(.scale)) {
                            CharacterRow(character: character)
                        }
                    }
                }
            }
            .navigationTitle("Characters Search")
        }
    }
}

#Preview {
    ContentView()
}
