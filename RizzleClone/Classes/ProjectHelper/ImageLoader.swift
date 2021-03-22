//
//  ImageLoader.swift
//  RizzleClone
//
//  Created by App Knit on 22/03/21.
//
import Foundation
import UIKit.UIImage
import Combine
import AVKit

public final class ImageLoader {
    public static let shared = ImageLoader()

    private let cache: ImageCacheType
    private lazy var backgroundQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 5
        return queue
    }()

    public init(cache: ImageCacheType = ImageCache()) {
        self.cache = cache
    }
    
    func loadImage(fromURL url: URL,completion: @escaping (UIImage) -> Void)
    {
        if let image = cache[url] {
            debugPrint("image fetched from cache...")
            completion(image)
            return
        }
        DispatchQueue.global().async {
            [weak self] in
            let asset = AVAsset(url: url)
            let imageGenerator = AVAssetImageGenerator(asset: asset)
            let time = CMTime(seconds: 0.0, preferredTimescale: 600)
            let times = [NSValue(time: time)]
            imageGenerator.generateCGImagesAsynchronously(forTimes: times, completionHandler: { _, image, _, _, _ in
                if let image = image {
                    debugPrint("image downloaded from server...")
                    self?.cache[url] = UIImage(cgImage: image)
                    completion(UIImage(cgImage: image))
                }
            })
        }
    }
}
