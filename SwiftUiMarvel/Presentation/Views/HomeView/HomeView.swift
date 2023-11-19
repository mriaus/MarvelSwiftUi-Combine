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
        NavigationView {
        ZStack {
            ScrollView {
                LazyVStack {
                        ForEach(homeViewModel.characters, id: \.self) { item in
                            NavigationLink(destination: SeriesView(useCase: UseCaseSeriesList(), selectedCharacter: String(item.id))){
//                                TODO: See how to remove the grey circle in watchOS
                                CharacterRowView(character: item)
                                #if os(watchOS)
                                    .frame(width: 200, height: 200)
                                #else
                                    .frame(width: 300, height: 300)
                                #endif
                                    .padding(.top, 30)
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
        
        
    }
}

#Preview {
    HomeView()
}
