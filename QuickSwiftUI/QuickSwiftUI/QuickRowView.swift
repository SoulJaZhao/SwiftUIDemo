//
//  QuickRowView.swift
//  QuickSwiftUI
//
//  Created by 赵龙 on 2025/11/14.
//

import SwiftUI
import QuickSwiftUIAPI

struct QuickRowView: View {
    let pokemon: PokemonQuery.Data.Pokemon
    
    var abilityNames: [String] {
        pokemon.pokemonabilities
            .compactMap {
                $0.ability?.name
            }
            .map {
                $0
            }
    }

    var body: some View {
        VStack {
            HStack {
                Text(pokemon.name)
                Spacer()
                Text(String(pokemon.height ?? 0))
                Spacer()
                Text(String(pokemon.weight ?? 0))
                Spacer()
            }
            if !pokemon.pokemonabilities.isEmpty {
                Text("Abilities: " + abilityNames.joined(separator: ", "))
            }
        }
    }
}

