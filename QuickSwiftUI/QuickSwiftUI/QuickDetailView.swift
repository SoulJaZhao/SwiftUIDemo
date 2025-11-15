//
//  QuickDetailView.swift
//  QuickSwiftUI
//
//  Created by 赵龙 on 2025/11/14.
//

import SwiftUI
import QuickSwiftUIAPI

struct QuickDetailView: View {
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
        ScrollView {
            VStack(alignment: .leading) {
                Text(pokemon.name)
                
                if let h = pokemon.height {
                    Text(String(h))
                }
                if let w = pokemon.weight {
                    Text(String(w))
                }
                ForEach(abilityNames, id: \.self) { name in
                    Text("\(name)")
                }
                
            }
            .padding()
        }
        .navigationTitle(pokemon.name.capitalized)
        .navigationBarTitleDisplayMode(.inline)
    }
}

