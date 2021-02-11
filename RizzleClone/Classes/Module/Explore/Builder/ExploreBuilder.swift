//
//  ExploreBuilder.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import UIKit

struct ExploreModuleBuilder{
    static func build(usingNavigationFactory factory: NavigationFactory) -> UINavigationController{
        let mainstory = Storyboard.Main.load
        let view = mainstory.instantiateViewController(withIdentifier: "ExploreVC") as! ExploreVC
        let interactor = ExploreInteractor()
        let router = ExploreRouter(view: view)
        let presenter = ExplorePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return factory(view)
    }
}
