//
//  ExploreRouter.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import UIKit

protocol ExploreRounting {
    func navigateToPlayerScreen(data:[Node]) -> Void
}

struct ExploreRouter {
    var view: UIViewController
    init(view: UIViewController){
        self.view = view
    }
}

extension ExploreRouter: ExploreRounting{
    func navigateToPlayerScreen(data: [Node]) {
        let playerVC = PlayerModuleBuilder.build(data:data)
        self.view.navigationController?.pushViewController(playerVC, animated: true)
    }
}
