//
//  PlayerVC.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import UIKit

class PlayerVC: UIViewController {

    //presentation
    var presenter: PlayerPresentation!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension PlayerVC: PlayerView{
    
}
