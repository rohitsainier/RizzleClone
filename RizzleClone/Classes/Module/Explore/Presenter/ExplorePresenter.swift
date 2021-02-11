//
//  ExplorePresenter.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import Foundation


protocol ExplorePresentation {
    func displayCategory(filename:Jsonfiles) -> Void
}

struct ExplorePresenter {
    var view: ExploreView
    var interactor: ExploreUseCase
    var router: ExploreRounting
    init(view: ExploreView,interactor: ExploreUseCase,router: ExploreRounting){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension ExplorePresenter: ExplorePresentation{
    func displayCategory(filename: Jsonfiles){
        if let videos = interactor.fetchCategory(filename: filename.rawValue){
            view.didCategoryRecieved(videos: videos)
        }
        else{
            view.didErrorOccured()
        }
    }
}
