//
//  ImagesImagesInitializer.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 29/03/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

import UIKit

class ImagesModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var imagesViewController: ImagesViewController!

    override func awakeFromNib() {

        let configurator = ImagesModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: imagesViewController)
    }

}
