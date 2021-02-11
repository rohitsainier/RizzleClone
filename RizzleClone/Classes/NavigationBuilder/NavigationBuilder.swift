//
//  NavigationBuilder.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

struct NavigationBuilder{
    static func build(rootView:UIViewController) -> UINavigationController{
        let textStyleAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 22)]
        let largeTextStyleAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 28)]
        let navigationConntroller = UINavigationController(rootViewController: rootView)
        navigationConntroller.navigationBar.tintColor = UIColor.red
        navigationConntroller.navigationBar.barTintColor = UIColor.brown
        navigationConntroller.navigationBar.titleTextAttributes = textStyleAttributes
        navigationConntroller.navigationBar.largeTitleTextAttributes = largeTextStyleAttributes
        navigationConntroller.navigationBar.isTranslucent = true
        navigationConntroller.navigationBar.prefersLargeTitles = true
        navigationConntroller.navigationBar.isHidden = true
        return navigationConntroller
    }
}
