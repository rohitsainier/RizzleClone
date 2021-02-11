//
//  PlayerBuilder.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import UIKit


struct PlayerModuleBuilder{
    static func build(data:[Node]) -> UIViewController{
        let mainstory = Storyboard.Main.load
        let view = mainstory.instantiateViewController(withIdentifier: "PlayerVC") as! PlayerVC
        view.videoNodes = data
        let interactor = PlayerInteractor()
        let router = PlayerRouter(view: view)
        let presenter = PlayerPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}
