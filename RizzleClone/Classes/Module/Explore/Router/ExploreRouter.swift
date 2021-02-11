//
//  ExploreRouter.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import UIKit

protocol ExploreRounting {
    func navigateToPlayerScreen(data:[Node],index: Int) -> Void
}

struct ExploreRouter {
    var view: UIViewController
    init(view: UIViewController){
        self.view = view
    }
}

extension ExploreRouter: ExploreRounting{
    func navigateToPlayerScreen(data: [Node],index:Int) {
        let playerVC = PlayerModuleBuilder.build(data:data,selectedIndex:index)
        self.view.navigationController?.pushViewController(playerVC, animated: true)
    }
}
