//
//  ExploreInteractor.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import Foundation


protocol ExploreUseCase {
    func fetchCategory(filename: String) -> [VideoElement]?
}

struct ExploreInteractor {
    
}

extension ExploreInteractor: ExploreUseCase{
    func fetchCategory(filename fileName: String) -> [VideoElement]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([VideoElement].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
                return nil
            }
        }
        return nil
    }
    
}
