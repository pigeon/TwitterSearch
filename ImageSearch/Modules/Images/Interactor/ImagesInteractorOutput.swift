//
//  ImagesImagesInteractorOutput.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 29/03/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

import Foundation

protocol ImagesInteractorOutput: class {
    func images(_:[String])
    func error(_:NSError)
}
