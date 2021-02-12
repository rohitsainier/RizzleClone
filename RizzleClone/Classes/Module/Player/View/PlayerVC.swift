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
    var selectedIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configUI()
    }
    
    private func configUI(){
        collectionView.register(UINib(nibName: "VideoPlayerCell", bundle: nil), forCellWithReuseIdentifier: "VideoPlayerCell")
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let indexPath = IndexPath(item: selectedIndex, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: [.centeredVertically, .centeredHorizontally], animated: true)
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
        print(indexPath.row)
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("willDisplay:\(indexPath.row)")
        selectedIndex = indexPath.row
        guard let videoCell = (cell as? VideoPlayerCell) else { return }
        DispatchQueue.main.async {
            videoCell.playerView.player?.play()
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("didEndDisplaying:\(indexPath.row)")
        guard let videoCell = cell as? VideoPlayerCell else { return };
        videoCell.playerView.player?.pause()
        videoCell.playerView.player = nil
        let avPlayer = AVPlayer(url: URL(string: videoNodes[indexPath.row].video.encodeURL)!)
        videoCell.playerView.playerLayer.player = avPlayer
    }
}


