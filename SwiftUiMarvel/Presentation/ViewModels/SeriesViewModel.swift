//
//  SeriesViewModel.swift
//  SwiftUiMarvel
//
//  Created by Marcos on 17/11/23.
//

import Foundation
import Combine

final class SeriesViewModel: ObservableObject {
    let useCase: UseCaseSeriesListProtocol
    
    @Published var series: [Serie] = []
    var suscriptors = Set<AnyCancellable>()
    @Published var isLoading = false
    private var totalSeries = 0
    let selectedCharacter: String
    
    init(useCase: UseCaseSeriesListProtocol,selectedCharacter: String) {
        self.useCase = useCase
        self.selectedCharacter = selectedCharacter
    }
    
    func getSeriesByCharacter(offset: String, character: String){
        isLoading = true
        if(totalSeries < (Int(offset) ?? 0) + 1 || totalSeries == 0){
            useCase.loadSeries(offset: offset, character: character)
                .sink {[weak self] completion in
                    //Completion
                    print("Completion vm -> \(completion)")
                    self?.isLoading = false
                } receiveValue: {[weak self] serieDTO in
                    if let results = serieDTO.data?.results {
                        results.forEach{
                            //TODO: Refactor the thumbnail
                            self?.series.append(Serie(id: $0.id ?? 0, name: $0.title, description: $0.description, image: "\(String(describing: $0.thumbnail?.path ?? "" )).\($0.thumbnail?.thumbnailExtension?.rawValue ?? "")", startYear: $0.startYear, endYear: $0.endYear, rating: $0.rating) )
                        }
                    }else{
                        //TODO: Do something
                        print("Error")
                    }
                }
                .store(in: &suscriptors)
        }
    }
    
}
