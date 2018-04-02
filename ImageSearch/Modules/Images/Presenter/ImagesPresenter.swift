//
//  ImagesImagesPresenter.swift
//  ImageSearch
//
//  Created by Dmytro Golub on 29/03/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

import UIKit

class ImagesPresenter: ImagesModuleInput, ImagesViewOutput, ImagesInteractorOutput {
    
    weak var view: ImagesViewInput!
    var interactor: ImagesInteractorInput!
    var router: ImagesRouterInput!
    var foundImages:[String] = [] {
        didSet {
          view.reload()
        }
    }

    func viewIsReady() {
        interactor.search(with: "#lovewhereyouwork")
    }
    
    func numberOfItemsInSection() -> Int {
        return foundImages.count
    }
    
    func images(_ img: [String]) {
        self.foundImages = img
        view.reload()
    }

    
    func dataModel(with index: IndexPath) -> SearchImageCellModel {
        return  SearchImageCellModel(strUrl: foundImages[index.row])
    }
}
