//
//  PlayerRouter.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import UIKit

protocol PlayerRounting {
    
}

struct PlayerRouter {
    var view: UIViewController
    init(view: UIViewController){
        self.view = view
    }
}

extension PlayerRouter: PlayerRounting{
    
}
