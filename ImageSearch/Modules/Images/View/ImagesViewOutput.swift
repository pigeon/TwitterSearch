//
//  ImagesImagesViewOutput.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 29/03/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//
import UIKit

protocol ImagesViewOutput {
    /**
     @author Dmytro Golub
     Notify presenter that view is ready
     */

    func viewIsReady()
    func numberOfItemsInSection() -> Int
    func dataModel(with index: IndexPath) -> SearchImageCellModel
    func imageSelected(at index: IndexPath)
    func prepare(for segue: UIStoryboardSegue)
}
