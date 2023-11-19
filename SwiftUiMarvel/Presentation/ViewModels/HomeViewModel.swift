//
//  HomeViewModel.swift
//  SwiftUiMarvel
//
//  Created by Marcos on 8/11/23.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    
    let useCase: UseCaseHomeProtocol
    
    @Published var characters: [Character] = []
    var suscriptors = Set<AnyCancellable>()
    private var totalCharacters = 0
    
    
    init(useCase: UseCaseHomeProtocol) {
        self.useCase = useCase
        self.getCharacters()
    }
    
    func getCharacters(){
        let offset = characters.count + 1
        if(totalCharacters < characters.count || totalCharacters == 0){
            useCase.loadCharacters(limit: "100", offset: String(offset))
                .sink { completion in
                    //Completion
                    print("Completion vm -> \(completion)")
                } receiveValue: {[weak self] characterDTO in
                    if let results = characterDTO.data?.results {
                        results.forEach{
                            //TODO: Refactor the thumbnail to reuse
                            self?.characters.append( Character(id: $0.id ?? 0, name: $0.name, description: $0.description, image: "\(String(describing: $0.thumbnail?.path ?? "" )).\($0.thumbnail?.thumbnailExtension?.rawValue ?? "")"))
                        }
                    }else{
                        //TODO: Do something (Navigate to error)
                        print("Error")
                    }
                }
                .store(in: &suscriptors)
        }
    }
}
