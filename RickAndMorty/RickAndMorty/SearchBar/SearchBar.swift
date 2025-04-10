//
//  SearchBar.swift
//  RickAndMorty
//
//  Created by Cherry on 4/10/25.
//
import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        TextField("Search...", text: $text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .accessibilityIdentifier("searchTextField")
    }
}
