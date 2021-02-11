//
//  PlayerVC.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import UIKit
import AVKit

class PlayerVC: UIViewController {

    //OUTLETS
    @IBOutlet weak var collectionView: UICollectionView!
    
    //presentation
    var presenter: PlayerPresentation!
    var videoNodes: [Node] = [Node]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configUI()
    }
    
    private func configUI(){
        collectionView.register(UINib(nibName: "VideoPlayerCell", bundle: nil), forCellWithReuseIdentifier: "VideoPlayerCell")
    }
    
}

extension PlayerVC: PlayerVCView{
    
}

extension PlayerVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SCREEN.width.load, height: SCREEN.height.load)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoNodes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoPlayerCell", for: indexPath) as? VideoPlayerCell else {return UICollectionViewCell()}
        let avPlayer = AVPlayer(url: URL(string: videoNodes[indexPath.row].video.encodeURL)!)
        cell.playerView.playerLayer.player = avPlayer
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("willDisplay:\(indexPath.row)")
        guard let videoCell = (cell as? VideoPlayerCell) else { return }
        videoCell.playerView.player?.play()
        
    }
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("didEndDisplaying:\(indexPath.row)")
        guard let videoCell = cell as? VideoPlayerCell else { return };
        videoCell.playerView.player?.pause()
        videoCell.playerView.player = nil
    }
}


