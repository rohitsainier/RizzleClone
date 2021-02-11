//
//  PlayerVC.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import UIKit

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

extension PlayerVC: PlayerView{
    
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
        if indexPath.row % 2 == 0{
            cell.playerView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
        else{
            cell.playerView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        }
        return cell
    }
    
    
}
