//
//  CharacterCellView.swift
//  SwiftUiMarvel
//
//  Created by Marcos on 9/11/23.
//

import SwiftUI

struct CharacterRowView: View {
    
    var character: Character
    
    
    var body: some View {
        
        ZStack {
            //Get the info of the parent in this case width and height
            GeometryReader { geometry in
                
                AsyncImage(url: URL(string: character.image ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                        .cornerRadius(20)
                } placeholder: {
                    Image(decorative: "MarvelLogo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                        .cornerRadius(20)
                }
                
                Color.black.opacity(0.5)
                    .cornerRadius(20)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .overlay(
                        VStack {
                            HStack {
                                Text(character.name ?? "No name")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }
                    )
            }
        }
    }
}

#Preview {
    CharacterRowView(character: Character(id: 1234, name: "CharacterTest", description: "TestDescription", image: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/538615ca33ab0.jpg"))
}
