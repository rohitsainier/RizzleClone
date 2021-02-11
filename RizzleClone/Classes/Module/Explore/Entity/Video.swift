//
//  Video.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import Foundation


// MARK: - VideoElement
struct VideoElement: Codable {
    let title: String
    let nodes: [Node]
}

// MARK: - Node
struct Node: Codable {
    let video: Video
}

// MARK: - Video
struct Video: Codable {
    let encodeURL: String
    
    enum CodingKeys: String, CodingKey {
        case encodeURL = "encodeUrl"
    }
}
