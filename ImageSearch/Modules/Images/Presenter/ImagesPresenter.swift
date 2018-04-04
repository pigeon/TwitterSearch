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
    var selectedImageIndex:IndexPath?
    
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

    func error(_ error: NSError) {
        view.show(error: error)
    }
    
    func dataModel(with index: IndexPath) -> SearchImageCellModel {
        return  SearchImageCellModel(strUrl: foundImages[index.row])
    }
    
    func imageSelected(at index: IndexPath) {
        selectedImageIndex = index
    }
    
    func prepare(for segue: UIStoryboardSegue) {
        guard let dest = segue.destination as? FullScreenViewController ,
            let module = dest.output as? FullScreenModuleInput,
            let index = selectedImageIndex else {
            return
        }
        module.imageURL = foundImages[index.row]
        
    }
    
}
