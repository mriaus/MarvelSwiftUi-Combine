//
//  SerieRowView.swift
//  SwiftUiMarvel
//
//  Created by Marcos on 19/11/23.
//

import SwiftUI

struct SerieRowView: View {
    
    let serie: Serie
    
    init(serie: Serie) {
        self.serie = serie
    }
    
    var body: some View {
        ZStack {
            //Get the info of the parent in this case width and height
            GeometryReader { geometry in
                
                AsyncImage(url: URL(string: serie.image ?? "")) { image in
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
                    .overlay(
                        VStack {
                            Text(serie.name ?? "Desconocido")
#if os(watchOS)
                                .font(.headline)
#else
                                .font(.title)
#endif
                                .foregroundColor(.white)
                                .bold()
                                .padding(.top, 64)
#if os(iOS) || os(macOS)
                            Spacer()

                            Text(serie.description ?? "")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.top, 32)
                            #endif
                            
                        }
                            .padding(.vertical, 24)
                            .padding(.horizontal, 24)
                        
                    )
                    .cornerRadius(20)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
            }
        }
    }
}

#Preview {
    SerieRowView(serie: Serie(id: 1002, name: "Hulk 1", description: "The Avengers have diassembled...long live the New Avengers! A breakout at the Raft superhuman prison facility unites the likes of Captain America and Iron Man with Spider-Man and Wolverine to form Earth's Mightiest Heroes as never before! Watch the team persevere through Civil War, Secret Invasion, Dark Reign and onward!", image: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/538615ca33ab0.jpg", startYear: 1990, endYear: 1995,rating: "5"))
}
