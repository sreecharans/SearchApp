//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Cherry on 4/10/25.
//

import Foundation
import Combine

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false

    private var cancellables = Set<AnyCancellable>()

    init() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] in self?.fetchCharacters(with: $0) }
            .store(in: &cancellables)
    }

    func fetchCharacters(with name: String) {
        guard !name.isEmpty else {
            self.characters = []
            return
        }
        
        isLoading = true
        let urlString = "https://rickandmortyapi.com/api/character/?name=\(name)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                self.isLoading = false
                return
            }
            do {
                let result = try JSONDecoder().decode(CharacterResponse.self, from: data)
                DispatchQueue.main.async {
                    self.characters = result.results
                    print("Fetched characters: \(self.characters)")
                    self.isLoading = false
                }
            } catch {
                print("Error decoding JSON: \(error)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }.resume()
    }
}
