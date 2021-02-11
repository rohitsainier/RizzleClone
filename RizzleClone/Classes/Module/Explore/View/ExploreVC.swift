//
//  ExploreVC.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import UIKit

class ExploreVC: UIViewController {

    //presentation
    var presenter: ExplorePresentation!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

//MARK:- ExploreVC Use Cases
extension ExploreVC: ExploreView{
   
}
