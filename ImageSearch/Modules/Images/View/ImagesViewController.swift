//
//  ImagesImagesViewController.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 29/03/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

import UIKit

class ImagesViewController: UIViewController, ImagesViewInput {

    var output: ImagesViewOutput!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: ImagesViewInput
    func setupInitialState() {
    }
}

extension ImagesViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
}
