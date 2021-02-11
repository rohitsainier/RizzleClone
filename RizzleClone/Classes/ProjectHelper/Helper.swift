//
//  Helper.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import UIKit


enum SCREEN{
    case height
    case width
    var load: CGFloat{
        switch self {
        case .height:
            return UIScreen.main.bounds.height
        case .width:
            return UIScreen.main.bounds.width
        }
    }
}

enum Storyboard{
    case Main
    var load: UIStoryboard{
        switch self {
        case .Main:
            return UIStoryboard(name: "Main", bundle: nil)
        }
    }
}

enum Jsonfiles:String{
    case Assignment =  "assignment"
}


