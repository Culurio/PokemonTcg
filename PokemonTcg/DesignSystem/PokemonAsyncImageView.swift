//
//  PokemonAsyncImageView.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 08/07/2025.
//

import SwiftUI

struct PokemonAsyncImageView: View {
    let imageURL: String?
    var size: CGSize? = nil
    var cornerRadius: CGFloat = 8
    var backgroundColor: Color = Color("cardBackground")
    var contentMode: ContentMode = .fit

    var body: some View {
        AsyncImage(url: URL(string: imageURL ?? "")) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: size?.width, height: size?.height)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(cornerRadius)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
                    .frame(width: size?.width, height: size?.height)
                    .background(backgroundColor)
                    .cornerRadius(cornerRadius)
            case .failure:
                Image("Pokeball")
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
                    .frame(width: size?.width, height: size?.height)
                    .foregroundColor(.gray)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(cornerRadius)
            @unknown default:
                EmptyView()
            }
        }
    }
}


#Preview {
    PokemonAsyncImageView(imageURL: "https://m.media-amazon.com/images/I/71nbfl-JklS._AC_SL1024_.jpg")
}
