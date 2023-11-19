//
//  SeriesView.swift
//  SwiftUiMarvel
//
//  Created by Marcos on 17/11/23.
//

import SwiftUI

struct SeriesView: View {
    let selectedCharacter: String
    @ObservedObject var seriesViewModel: SeriesViewModel
    
    init(useCase: UseCaseSeriesListProtocol ,selectedCharacter: String) {
        self.selectedCharacter = selectedCharacter
        self.seriesViewModel = SeriesViewModel(useCase: useCase, selectedCharacter: selectedCharacter)
    }
    
    var body: some View {
        VStack{
            if(seriesViewModel.isLoading){
                ProgressView("Cargando...")
                    .progressViewStyle(CircularProgressViewStyle())
            }else{
                ScrollView{
                    LazyVStack {
                        ForEach(seriesViewModel.series, id: \.self) { item in
                            SerieRowView(serie: item)
#if os(watchOS)
    .frame(width: 150, height: 200)
#else
    .frame(width: 300, height: 500)
#endif
                        }
                    }
                }
                
            }
        }
        .onAppear{
            seriesViewModel.getSeriesByCharacter(offset: "0", character: selectedCharacter)
        }
    }
}

#Preview {
    SeriesView(useCase:UseCaseSeriesList(), selectedCharacter: "1009694")
}
