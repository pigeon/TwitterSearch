//
//  SearchImageCell.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 29/03/2018.
//  Copyright © 2018 Paysafe. All rights reserved.
//

import UIKit
import Kingfisher

struct SearchImageCellModel {
    let strUrl:String
}

class SearchImageCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    func configure(_ model:SearchImageCellModel) {
        self.image.kf.indicatorType = .activity
        self.image.kf.setImage(with: URL(string: model.strUrl)!)
    }
}
