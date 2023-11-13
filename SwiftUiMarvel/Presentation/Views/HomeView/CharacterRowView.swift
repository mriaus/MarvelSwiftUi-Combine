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
        ZStack{
            //TODO : See how to change to a placeholder if the url dosnt contain an image
            AsyncImage(url: URL(string: character.image ?? "" ) ) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
            } placeholder: {
                Image(decorative: "MarvelLogo")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
            }
            
            //Add the black coverage
            GeometryReader{ geometry in
                Color.black.opacity(0.5)
                    .cornerRadius(20)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            
            
            
            VStack{
                HStack{
                    Text(character.name ?? "No name")
                        .font(.title)
                        .foregroundStyle(.white)
                        .bold()
                }
            }
        }
    }
}

#Preview {
    CharacterRowView(character: Character(id: 1234, name: "CharacterTest", description: "TestDescription", image: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/538615ca33ab0.jpg"))
}
