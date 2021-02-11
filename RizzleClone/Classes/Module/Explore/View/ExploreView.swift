//
//  ExploreView.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import Foundation

protocol ExploreView {
    func didCategoryRecieved(videos: [VideoElement])
    func didErrorOccured()
}
