//
//  FullScreenFullScreenViewController.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 03/04/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

import UIKit
import Kingfisher


class FullScreenViewController: UIViewController, FullScreenViewInput {

    var output: FullScreenViewOutput!

    @IBOutlet weak var image: UIImageView!
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        navigationController?.hidesBarsOnTap = true
        navigationController?.isToolbarHidden = true
    }


    // MARK: FullScreenViewInput
    func setupInitialState() {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        image.kf.setImage(with: URL(string:output.imageStringURL())!)
    }
    
}
