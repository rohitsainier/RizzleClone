//
//  LazyImageView.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import UIKit
import AVFoundation


class LazyImageView: UIImageView
{
    private let imageCache = NSCache<AnyObject, UIImage>()
    
    func loadImage(fromURL imageURL: URL)
    {
        if let cachedImage = self.imageCache.object(forKey: imageURL as AnyObject)
        {
            debugPrint("image loaded from cache for =\(imageURL)")
            DispatchQueue.main.async { [weak self] in
            self?.image = cachedImage
            }
            return
        }
        
        DispatchQueue.global().async {
            [weak self] in
            let asset = AVAsset(url: imageURL)
            let avAssetImageGenerator = AVAssetImageGenerator(asset: asset)
            avAssetImageGenerator.appliesPreferredTrackTransform = true
            let thumnailTime = CMTimeMake(value: 5, timescale: 1)
            do {
                let cgThumbImage = try avAssetImageGenerator.copyCGImage(at: thumnailTime, actualTime: nil)
                let thumbImage = UIImage(cgImage: cgThumbImage)
                debugPrint("image downloaded from server...")
                DispatchQueue.main.async {
                    self?.imageCache.setObject(thumbImage, forKey: imageURL as AnyObject)
                    self?.image = thumbImage
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
