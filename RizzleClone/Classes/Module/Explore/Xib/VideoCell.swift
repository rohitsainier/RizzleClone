//
//  VideoCell.swift
//  RizzleClone
//
//  Created by Rohit Saini on 11/02/21.
//

import UIKit

class VideoCell: UICollectionViewCell {

   
    @IBOutlet weak var videoThumnail: UIImageView!
    @IBOutlet weak var videoBackView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configUI()
    }
    
    private func configUI(){
        videoBackView.layer.cornerRadius = 10
        videoThumnail.layer.cornerRadius = 10
    }

}
