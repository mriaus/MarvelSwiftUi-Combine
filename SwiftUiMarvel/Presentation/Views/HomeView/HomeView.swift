//
//  HomeView.swift
//  SwiftUiMarvel
//
//  Created by Marcos on 8/11/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeViewModel = HomeViewModel(useCase: UseCaseHome())
    
    
    var body: some View {
        ZStack {
            Image(decorative: "MarvelBG")
                .resizable()
                .ignoresSafeArea()
            
            ScrollView {
                LazyVStack {
                    ForEach(homeViewModel.characters, id: \.self) { item in
                        CharacterRowView(character: item)
                            .padding()
                            .frame(width: 300)
                            .onAppear {
                                print(item)
                                if item == homeViewModel.characters.last {
                                    // Load more items when the last item is about to appear
                                    homeViewModel.getCharacters()
                                }
                            }
                    }
                }
            }
        }
        
        
    }
}

#Preview {
    HomeView()
}
