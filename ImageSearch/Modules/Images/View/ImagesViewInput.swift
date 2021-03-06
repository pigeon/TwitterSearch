//
//  ImagesImagesViewInput.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 29/03/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

import Foundation

protocol ImagesViewInput: class {
    /**
     @author Dmytro Golub
     Setup initial state of the view
     */

    func setupInitialState()
    func reload()
    func show(error: NSError)
}
