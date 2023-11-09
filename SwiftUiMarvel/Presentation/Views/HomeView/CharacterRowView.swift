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
        VStack{
            Text(character.name ?? "")
            
        }
    }
}

#Preview {
    CharacterRowView(character: Character(id: 1234, name: "CharacterTest", description: "TestDescription", image: "https://i.etsystatic.com/5249931/r/il/79ce32/3029448289/il_570xN.3029448289_r1py.jpg"))
}
