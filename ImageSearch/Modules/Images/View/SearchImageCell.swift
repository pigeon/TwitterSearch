//
//  SearchImageCell.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 29/03/2018.
//

import Kingfisher
import UIKit

struct SearchImageCellModel {
    let strUrl: String
}

class SearchImageCell: UICollectionViewCell {
    @IBOutlet var image: UIImageView!

    func configure(_ model: SearchImageCellModel) {
        image.kf.indicatorType = .activity
        image.kf.setImage(with: URL(string: model.strUrl)!)
    }
}
