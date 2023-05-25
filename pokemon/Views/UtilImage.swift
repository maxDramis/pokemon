//
//  UtilImage.swift
//  pokemon
//
//  Created by Marco Dramisino on 25/05/23.
//

import Foundation
import SwiftUI

struct PokemonImage: View {
    var path: String
    
    init(path: String) {
        self.path = path
    }
    
    var body: some View {
        AsyncImage(url: URL(string: path)) { image in
            if let image = image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, height: 140)
            }
        } placeholder: {
            ProgressView()
                .frame(width: 140, height: 140)
        }
        .background(.thinMaterial)
        .clipShape(Circle())
    }
}
