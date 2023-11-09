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
        ScrollView {
                    LazyVStack {
                        ForEach(homeViewModel.characters, id: \.self) { item in
                            Text(item.name ?? "No name")
                                .onAppear {
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

#Preview {
    HomeView()
}
