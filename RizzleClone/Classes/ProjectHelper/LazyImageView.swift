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
        print(imageCache)
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
            let thumnailTime = CMTimeMake(value: 7, timescale: 1)
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
    
    func previewImageFromVideo(url: URL){
        let request = URLRequest(url: url)
        let cache = URLCache.shared
        
        if
            let cachedResponse = cache.cachedResponse(for: request),
            let image = UIImage(data: cachedResponse.data)
        {
            DispatchQueue.main.async { [weak self] in
                guard let `self` = self else {return}
                self.image = image
            }
            
        }
        
        DispatchQueue.global().async {
            [weak self] in
        guard let `self` = self else {return}
        let asset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        imageGenerator.appliesPreferredTrackTransform = true
        imageGenerator.maximumSize = CGSize(width: 250, height: 120)
        
        var time = asset.duration
        time.value = min(time.value, 2)
        
        var image: UIImage?
        
        do {
            let cgImage = try imageGenerator.copyCGImage(at: time, actualTime: nil)
            image = UIImage(cgImage: cgImage)
        } catch { }
        
        if
            let image = image,
            let data = image.pngData(),
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        {
            let cachedResponse = CachedURLResponse(response: response, data: data)
            
            cache.storeCachedResponse(cachedResponse, for: request)
        }
            DispatchQueue.main.async { [weak self] in
                guard let `self` = self else {return}
                self.image = image
            }
        }
    }

}


