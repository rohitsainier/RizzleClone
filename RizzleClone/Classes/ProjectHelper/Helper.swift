//
//  Helper.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import UIKit
import AVFoundation

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

func getThumbnailImageFromVideoUrl(url: URL, completion: @escaping ((_ image: UIImage?)->Void)) {
    DispatchQueue.global().async { //1
        let asset = AVAsset(url: url) //2
        let avAssetImageGenerator = AVAssetImageGenerator(asset: asset) //3
        avAssetImageGenerator.appliesPreferredTrackTransform = true //4
        let thumnailTime = CMTimeMake(value: 5, timescale: 1) //5
        do {
            let cgThumbImage = try avAssetImageGenerator.copyCGImage(at: thumnailTime, actualTime: nil) //6
            let thumbImage = UIImage(cgImage: cgThumbImage) //7
            DispatchQueue.main.async { //8
                completion(thumbImage) //9
            }
        } catch {
            print(error.localizedDescription) //10
            DispatchQueue.main.async {
                completion(nil) //11
            }
        }
    }
}
