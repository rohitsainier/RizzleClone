//
//  PlayerPresenter.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import Foundation


protocol PlayerPresentation {
    
}

struct PlayerPresenter {
    var view: PlayerView
    var interactor: PlayerUseCase
    var router: PlayerRounting
    init(view: PlayerView,interactor: PlayerUseCase,router: PlayerRounting){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension PlayerPresenter: PlayerPresentation{
    
}
