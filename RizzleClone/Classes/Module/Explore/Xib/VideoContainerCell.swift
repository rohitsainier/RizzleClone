//
//  VideoContainerCell.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import UIKit

class VideoContainerCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLbl: UILabel!
    var presenter: ExplorePresentation!
    var VideoInfo: [Node] = []{
        didSet{
            DispatchQueue.main.async { [weak self] in
                guard let `self` = self else{return}
                self.collectionView.reloadData()
            }
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configUI()
    }
    
    private func configUI(){
        collectionView.register(UINib(nibName: "VideoCell", bundle: nil), forCellWithReuseIdentifier: "VideoCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension VideoContainerCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    // sizeForItemAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 2 - 50, height: collectionView.frame.height)
    }
}

extension VideoContainerCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return VideoInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath) as? VideoCell else {return UICollectionViewCell()}
        let videoUrl = URL(string: VideoInfo[indexPath.row].video.encodeURL)!
        ImageLoader.shared.loadImage(fromURL: videoUrl) { (image) in
            DispatchQueue.main.async {
                cell.videoThumnail.image = image
            }
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.moveToPlayerVC(data: VideoInfo,selectedIndex: indexPath.row)
    }
    
}
