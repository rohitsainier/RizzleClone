//
//  VideoPlayerView.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import AVKit
import AVFoundation
import Foundation
import UIKit

class PlayerView: UIView {
    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
}

